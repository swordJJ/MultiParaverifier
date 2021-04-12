#coding=utf-8

import time, os, socket, hashlib, sys

from simpserv import start_server
from smvserv import SMV
from z3serv import SMT2
from muserv import Murphi
import assoserv
from dtserv import dt
from settings import MAX_SLEEP_TIME, TIME_OUT, SMV_PATH, SMV_FILE_DIR, HOST, PORT
from settings import MU_PATH, MU_INCLUDE, GXX_PATH, MU_FILE_DIR, MU_CHECK_TIMEOUT, MU_CHECK_MEMORY
import subprocess
from subprocess import PIPE
import hashlib

from pexpect import spawn, EOF, TIMEOUT
SPLIT_CHAR=','
ERROR = '-2'
WAITING = '-1'
OK = '0'

COMPUTE_REACHABLE = '1'
QUERY_REACHABLE = '2'
CHECK_INV = '3'
SMV_QUIT = '7'
GO_BMC = '10'
CHECK_INV_BMC = '11'
SMV_BMC_QUIT = '12'

SET_SMT2_CONTEXT = '4'
QUERY_SMT2 = '5'
QUERY_STAND_SMT2 = '6'

SET_MU_CONTEXT = '8'
CHECK_INV_BY_MU = '9'

CHECK_INV_BY_ASSOCIATE_RULE='13'

SET_MU_CONTEXT_DT = '14' #决策树准备服务
CHECK_INV_BY_DT_TREE='15'#决策树判断公式服务

QUERY_SMT2_CE='16'
QUERY_STAND_SMT2_CE='17'



smt2_pool = {}
smv_pool = {}
smv_process_pool = {}
smv_bmc_pool = {}
mu_pool = {}

__verbose = False
data_set_csv = 'data.csv' #训练数据收集器产生的训练数据文件的名称，其中，第一行是表头，其余行为可达状态
path_dict = {} #存储可复用的路径文件，键是路径文件中属性组成的字符串，值为路径文件名称
candidate_dict = {} #存储候选不变式判断结果，键是候选不变式特殊符号（整体排序后的字符串，排序指交换赋值表达式的位置和等号两边元素的位置，具体使用sort函数完成），值为判断结果
path_content_dict = {} #dt3-2新加变量，用于将路径文件存于缓存，键为路径文件名称，值为路径列表
title = [] #存储训练数据的表头--协议的属性集合
data_set = [] #存储训练数据的内容--可达状态
protocol_dict = {} #用于记录判断过协议的结果
last_protocol = '' #用于记录上一个协议的名称，用于记录判断过的协议
is_cache = False #是否使用完整cache

def run_command(cmd):
    if subprocess.call(cmd, shell=True):
        raise Exception("{} fail".format(cmd))

def gen_smv_file(name, content, name_add=""):
    smv_file = SMV_FILE_DIR + hashlib.md5(name).hexdigest() + name_add + '.smv'
    new_smv_file = True
    if os.path.isfile(smv_file):
        with open(smv_file, 'r') as f:
            c = f.read()
            if content == c:
                new_smv_file = False
    if new_smv_file:
        with open(smv_file, 'w') as f:
            f.write(content)
    return new_smv_file, smv_file

def gen_smv_process(name, content, ord_str, name_add=""):
    smv_file = SMV_FILE_DIR + hashlib.md5(content).hexdigest() + name_add + '.smv'
    if os.path.isfile(smv_file) and smv_file in smv_process_pool:
        smv_pool[name] = smv_file
    else:
        with open(smv_file, 'w') as f:
            f.write(content)
        ord_file = None
        if ord_str:
            ord_file = SMV_FILE_DIR + hashlib.md5(content).hexdigest() + name_add + '.ord'
            with open(ord_file, 'w') as f:
                f.write(ord_str)
        smv_pool[name] = smv_file
        if __verbose: print("Start to compute reachable set")
        smv = SMV(SMV_PATH, smv_file, ord_file, timeout=TIME_OUT)
        smv_process_pool[smv_file] = smv
        smv.go_and_compute_reachable()

def serv(conn, addr):
    global data_set_csv
    global sign_txt 
    global path_dict
    global candidate_dict
    global path_content_dict
    global title
    global data_set
    global protocol_dict
    global last_protocol
    global is_cache
    data = ''
    size = 1024
    len_to_recv = None
    while len(data) < len_to_recv or len_to_recv is None:
        try:
            d = conn.recv(size)
            if len_to_recv is None:
                d = d.split(SPLIT_CHAR)
                len_to_recv = int(d[0])
                data += SPLIT_CHAR.join(d[1:])
            else:
                data += d
        except socket.timeout:
            pass
    cmd = data.split(SPLIT_CHAR)
    res = None
    if __verbose: 
        sys.stdout.write(data[:10240])
        sys.stdout.flush()
    if cmd[0] == COMPUTE_REACHABLE:
        """
        In this case, cmd should be [length, command, command_id, name, smv file content]
        """
        # There are many SPLIT_CHARin smv file, so should concat the parts splited
        name = cmd[2]
        content = SPLIT_CHAR.join(cmd[3:-1])
        ord_str = cmd[-1]
        gen_smv_process(name, content, ord_str)
        conn.sendall(OK)
    elif cmd[0] == QUERY_REACHABLE:
        """
        In this case, cmd should be [length, command, command_id, name]
        """
        if cmd[2] in smv_pool:
            res = smv_process_pool[smv_pool[cmd[2]]].query_reachable()
            conn.sendall(SPLIT_CHAR.join([OK, res]) if res else WAITING)
        else:
            conn.sendall(ERROR)
    elif cmd[0] == CHECK_INV:
        """
        In this case, cmd should be [length, command, command_id, name, inv]
        """
        if cmd[2] in smv_pool:
            res = smv_process_pool[smv_pool[cmd[2]]].check(cmd[3])
            conn.sendall(SPLIT_CHAR.join([OK, res]))
        else:
            conn.sendall(ERROR)
    elif cmd[0] == SMV_QUIT:
        """
        In this case, cmd should be [length, command, command_id, name]
        """
        if cmd[2] in smv_pool:
            smv_process_pool[smv_pool[cmd[2]]].exit()
            del smv_process_pool[smv_pool[cmd[2]]]
            del smv_pool[cmd[2]]
            conn.sendall(OK)
        else:
            conn.sendall(ERROR)
    elif cmd[0] == GO_BMC:
        """
        In this case, cmd should be [length, command, command_id, name, smv file content]
        """
        # There are many SPLIT_CHARin smv file, so should concat the parts splited
        name = cmd[2]
        content = SPLIT_CHAR.join(cmd[3:])
        new_smv_file, smv_file = gen_smv_file(name, content, name_add='.bmc')
        if new_smv_file or name not in smv_bmc_pool:
            if __verbose: print("Go to bmc checking of NuSMV")
            smv = SMV(SMV_PATH, smv_file, timeout=TIME_OUT)
            if name in smv_bmc_pool: smv_bmc_pool[name].exit()
            smv_bmc_pool[name] = smv
            res = smv.go_bmc()
        conn.sendall(OK)
    elif cmd[0] == CHECK_INV_BMC:
        """
        In this case, cmd should be [length, command, command_id, name, inv]
        """
        if cmd[2] in smv_bmc_pool:
            res = smv_bmc_pool[cmd[2]].check_bmc(cmd[3])
            conn.sendall(SPLIT_CHAR.join([OK, res]))
        else:
            conn.sendall(ERROR)
    elif cmd[0] == SMV_BMC_QUIT:
        """
        In this case, cmd should be [length, command, command_id, name]
        """
        if cmd[2] in smv_bmc_pool:
            smv_bmc_pool[cmd[2]].exit()
            del smv_bmc_pool[cmd[2]]
            conn.sendall(OK)
        else:
            conn.sendall(ERROR)
    elif cmd[0] == SET_SMT2_CONTEXT:
        """
        In this case, cmd should be [length, command, command_id, name, context]
        """
        smt2 = SMT2(cmd[3])
        smt2_pool[cmd[2]] = smt2
        conn.sendall(OK)
    elif cmd[0] == QUERY_SMT2:
        """
        In this case, cmd should be [length, command, command_id, name, formula]
        """
        if cmd[2] in smt2_pool:
            res = smt2_pool[cmd[2]].check(cmd[3])
            conn.sendall(SPLIT_CHAR.join([OK, res]))
        else:
            conn.sendall(ERROR)
    elif cmd[0] == QUERY_STAND_SMT2:
        """
        In this case, cmd should be [length, command, command_id, context, formula]
        """
        smt2 = SMT2(cmd[2])
        res = smt2.check(cmd[3])
        conn.sendall(SPLIT_CHAR.join([OK, res]))        
    elif cmd[0] == QUERY_SMT2_CE:
        """
        In this case, cmd should be [length, command, command_id, name, formula]
        """
        if cmd[2] in smt2_pool:
            res = smt2_pool[cmd[2]].check_ce(cmd[3])
            conn.sendall(SPLIT_CHAR.join([OK, res]))
        else:
            conn.sendall(ERROR)
    elif cmd[0] == QUERY_STAND_SMT2_CE:
        """
        In this case, cmd should be [length, command, command_id, context, formula]
        """
        smt2 = SMT2(cmd[2])
        res = smt2.check_ce(cmd[3])
        conn.sendall(SPLIT_CHAR.join([OK, res]))    
    elif cmd[0] == SET_MU_CONTEXT:
        """
        In this case, cmd should be [length, command, command_id, name, context]
        """
        mu = Murphi(cmd[2], MU_PATH, MU_INCLUDE, GXX_PATH, MU_FILE_DIR, SPLIT_CHAR.join(cmd[3:]), 
            memory=MU_CHECK_MEMORY, timeout=MU_CHECK_TIMEOUT)
        mu_pool[cmd[2]] = mu
        conn.sendall(OK)
    elif cmd[0] == CHECK_INV_BY_MU:
        """
        In this case, cmd should be [length, command, command_id, name, inv]
        """
        if cmd[2] in mu_pool:
            res = mu_pool[cmd[2]].check(cmd[3])
            conn.sendall(SPLIT_CHAR.join([OK, res]))
        else:
            conn.sendall(ERROR)
    elif cmd[0] == CHECK_INV_BY_ASSOCIATE_RULE:
        """
        In this case, cmd should be [length, command, command_id, name, inv]
        """
        run_command('python3 assoserv/assoc.py -p ../examples/asso/%s' % (cmd[2]))
        conn.sendall(OK)
    elif cmd[0] == SET_MU_CONTEXT_DT:
		"""
		In this case, cmd should be [length, command, command_id, name, context]
		"""
		print("SET_MU_CONTEXT is running")
		print(cmd)
		if (last_protocol != '') and (is_cache == True):
			protocol_dict[last_protocol] = candidate_dict
			path_dict = {}
			path_content_dict = {}
		else:
			path_dict = {} #存储可复用的路径文件，键是路径文件中属性组成的字符串，值为路径文件名称
			candidate_dict = {} #存储候选不变式判断结果，键是候选不变式特殊符号（整体排序后的字符串，排序指交换赋值表达式的位置和等号两边元素的位置，具体使用sort函数完成），值为判断结果
			path_content_dict = {} #dt3-2新加变量，用于将路径文件存于缓存，键为路径文件名称，值为路径列表
		
		is_cache = False #初始化is_cache

		if cmd[2] in list(protocol_dict.keys()):
			candidate_dict = protocol_dict[cmd[2]]
			reuse_flag = True
			last_protocol = ''
			print '复用协议：' + cmd[2]
			conn.sendall(OK)
		else:
			mu = Murphi(cmd[2], MU_PATH, MU_INCLUDE, GXX_PATH, MU_FILE_DIR, ','.join(cmd[3:]), 
			memory=MU_CHECK_MEMORY, timeout=MU_CHECK_TIMEOUT)
			#mu_pool[cmd[2]] = mu
			print(','.join(cmd[3:]))
			res = mu.check('true') 
			m_file_name = mu.m_file_name()
			print 'DtModuleData1:start!'
			title,data_set = dt.DtModuleData1(data_set_csv,m_file_name)
		
			last_protocol = cmd[2]
		
			print 'DtModuleData1:ok!\nserver start!\n'
			conn.sendall(OK)
	#决策树-修改增加6-end
    elif cmd[0] == CHECK_INV_BY_DT_TREE:
		"""
		In this case, cmd should be [length, command, command_id, name, inv]
		"""
		#print "CHECK_INV is running"#test 20180802
		#sys.stdout.write(data[:10240]) #test 20180804
		#print ""#test 20180804
		
		is_cache = True #用于记录是否使用cache，防止第一次运行带有cache的客户端会使复用机制生成“空”的记录
		
		print 'checking' + cmd[3]
		z3 = smt2_pool['new'] #z3类
		#res = test.prior.Test(cmd[3],z3) #调用优先级决策树模块，包括生成优先决策树，决策树路径化，利用Z3和路径判断公式是否为不变式
		#print title
		res = dt.dt.candidateInvChecker(cmd[3],z3,title,data_set,path_dict,candidate_dict,path_content_dict,__sca) #调用决策树模块-综合，筛选候选不变式，返回正确性。输入为：候选不变式、z3实例、表头、状态集合、路径字典、候选不变式字典
		if res == 'true':
			print 'inv: ' + cmd[3] + '\n'
		else :
			print 'not inv: ' + cmd[3] + '\n'
		conn.sendall(','.join([OK, res]))	
	#决策树-修改增加5-end
    conn.close()
    if __verbose: print(': ', res)




if '-v' in sys.argv or '--verbose' in sys.argv:
    __verbose = True
if '-h' in sys.argv or '--help' in sys.argv:
    print("""Usage: [-v|-h] to [--verbose|--help]""")

if __name__ == '__main__':
    print(MU_PATH)
    print(r'='*10 +'Server Starting'+'='*10)
    start_server(HOST, PORT, serv=serv, timeout=TIME_OUT)
