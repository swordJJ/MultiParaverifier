#coding=utf-8
#决策树模块，又分为数据处理模块、决策树生成模块、路径合成模块、候选获选不变式模块

#csv相关操作
import csvOperation

import os
from math import log
import operator

#决策树模块-数据处理部分一，输入为：可达状态集、对称符号集。
def DtModuleData1(data_set_csv,m_file_name):
	print(data_set_csv)
	print(m_file_name)
	title,data_set = csvOperation.readCsv(data_set_csv)#读取可达集的表头和数据集
	sign = search_sign(m_file_name)#读取对称符号
	print sign
	true_title = titleChange(title,sign)#去表头中的除对称符号，得到原始表头。将表头小写化统一名称
	true_data_set = dataSetChange(data_set,sign) #除去数据集中的对称符号
	return true_title,true_data_set


#获得对称符号
def search_sign(file_name):
	sign_list = []
	print file_name
	with open(file_name,'r') as infile:
		for line in infile:
			if 'scalarset' in line:
				temp_str = line[:line.find(':')]
				print(temp_str.strip())
				sign_list.append(temp_str.strip() + '_')
		infile.close()
	return sign_list
				
#用于除去数据集中的对称符号
def dataSetChange(data_set,sign):
	result = data_set[:]
	for i in range(len(result)):
		for j in range(len(result[i])):
			for member in sign:
				if member in (result[i])[j] and (((result[i])[j] == member + '1') or ((result[i])[j] == member + '2')):
					(result[i])[j] = (result[i])[j].replace(member,'')
			(result[i])[j] = (result[i])[j].lower()
	return result


def DtModule(candidate_inv,z3,title,data_set,path_dict,candidate_dict,path_content_dict,sca_flag):
	candidate_mark,candidate_result = checkDict(candidate_inv,candidate_dict)
	if candidate_result != '': #candidate_result为空代表该候选不变式没有被测试过
		#print 'reused'
		return candidate_result
	else:
		check_flag = 1#1代表需要测试，若最后仍为1代表true
		has_path_file_flag_dict,candidate_inv_list,inv_path_file_dict,inv_judge_attribute_dict,inv_compress_title_dict,inv_compress_data_set_dict = DtModuleData2(candidate_inv,title,data_set,path_dict,sca_flag)#数据处理模块二
		for inv in candidate_inv_list:
			if has_path_file_flag_dict[inv] == 0:#没有可复用的路径文件
				tree = createTree((inv_compress_title_dict[inv])[:-1],inv_compress_data_set_dict[inv])
				createPathFile(tree,inv_judge_attribute_dict[inv],inv_path_file_dict[inv],path_content_dict)
				if check_flag == 1:
					result = z3checker(inv,inv_path_file_dict[inv],z3,path_content_dict)
					if result == 'sat':
						check_flag = 0;#不需要测试，但要生成路径文件

			else:
				if check_flag == 1:
					result = z3checker(inv,inv_path_file_dict[inv],z3,path_content_dict)
					if result == 'sat':
						check_flag = 0;#不需要测试，但要生成路径文件
		if check_flag == 1:
			candidate_dict[candidate_mark] = 'true' #记录候选不变式的判断结果
			return 'true'
			
		else:
			candidate_dict[candidate_mark] = 'false' #记录候选不变式的判断结果
			return 'false'
		



#数据处理模块二，返回判断复用的字典、候选不变式字典、路径文件字典、判断属性字典、压缩表头字典、压缩数据集字典。
def DtModuleData2(candidate_inv,title,data_set,path_dict,sca_flag):
	inv_path_file_dict = {} #用于返回候选不变式与其对应的路径文件,键是候选不变式，值是路径文件
	inv_judge_attribute_dict = {}
	inv_compress_title_dict = {}
	inv_compress_data_set_dict = {}
	has_path_file_flag_dict = {}
	has_path_file_flag = 0
	candidate_inv_low = candidate_inv.lower()#统一大小写
	
	'''
	if sca_flag == True:
		candidate_inv_list = candidataInvConvert(candidate_inv_low)
	else:
		candidate_inv_list = []
		candidate_inv_list.append(candidate_inv_low)
	'''
	candidate_inv_list = candidataInvConvert(candidate_inv_low,sca_flag)
	
	
	#print candidate_inv_list
	candidate_inv_attribute_dict = findInvAttribute(candidate_inv_list,title)#获得字典，键为候选不变式，值为对应的属性列表
	#print candidate_inv_attribute_dict
	for member in candidate_inv_list:#遍历各个候选不变式
		#print path_dict
		#print member
		if listToString(candidate_inv_attribute_dict[member]) in list(path_dict.keys()):
			inv_path_file_dict[member] = path_dict[listToString(candidate_inv_attribute_dict[member])] #添加候选不变式和其路径文件名称
			has_path_file_flag_dict[member] = 1
			inv_judge_attribute_dict[member] = ''
			inv_compress_title_dict[member] = []
			inv_compress_data_set_dict[member] = {}
		else:
			has_path_file_flag_dict[member] = 0
			path_file_name = creatPathName(candidate_inv_attribute_dict[member],path_dict)#生成路径文件名称
			inv_path_file_dict[member] = path_file_name
			judge_attribute = findJudgeAttribute(title,data_set,candidate_inv_attribute_dict[member])#生成判断属性
			inv_judge_attribute_dict[member] = judge_attribute
			compress_title,compress_data_set = dataCompress(title,data_set,candidate_inv_attribute_dict[member],judge_attribute)#生成压缩表头与压缩数据
			inv_compress_title_dict[member] = compress_title
			inv_compress_data_set_dict[member] = compress_data_set
	return has_path_file_flag_dict,candidate_inv_list,inv_path_file_dict,inv_judge_attribute_dict,inv_compress_title_dict,inv_compress_data_set_dict
			
	'''
	for member in candidate_inv_list:#遍历各个候选不变式，判断是否有可复用的路径文件，若有则将has_path_file_flag标记为1，直接返回路径文件名称。
		if listToString(candidate_inv_attribute_dict[member]) in list(path_dict.keys()):
			inv_path_file_dict[member] = path_dict[listToString(candidate_inv_attribute_dict[member])] #添加候选不变式和其路径文件名称
			has_path_file_flag = 1 #候选不变式是对称的，因此两者的路径文件存在情况只有同时存在和都不存在两种情况
	if has_path_file_flag == 1:
		return has_path_file_flag,candidate_inv_list,inv_path_file_dict,{},{},{}
	else:
		for member in candidate_inv_list: 
			path_file_name = creatPathName(candidate_inv_attribute_dict[member],path_dict)#生成路径文件名称
			inv_path_file_dict[member] = path_file_name 
			judge_attribute = findJudgeAttribute(title,data_set,candidate_inv_attribute_dict[member])#生成判断属性
			inv_judge_attribute_dict[member] = judge_attribute
			compress_title,compress_data_set = dataCompress(title,data_set,candidate_inv_attribute_dict[member],judge_attribute)
			inv_compress_title_dict[member] = compress_title
			inv_compress_data_set_dict[member] = compress_data_set
		return has_path_file_flag,candidate_inv_list,inv_path_file_dict,inv_judge_attribute_dict,inv_compress_title_dict,inv_compress_data_set_dict
	'''	
			
		
		
			

#生成候选不变式列表，包括本体和对称
def candidataInvConvert(candidate_inv_low,sca_flag):
	inv_list = []
	inv_list.append(candidate_inv_low)
	
	if sca_flag == True:
		if ('[1]' in candidate_inv_low) or ('[2]' in candidate_inv_low) or ('= 1' in candidate_inv_low) or ('= 2' in candidate_inv_low) or ('1 =' in candidate_inv_low) or ('2 =' in candidate_inv_low):
			candidate_inv_low_convert = convert(candidate_inv_low[:])
			if candidate_inv_low != candidate_inv_low_convert:
				inv_list.append(candidate_inv_low_convert)
	
	print 'sca:'
	for member in inv_list:
		print member
	
	return inv_list
		
#对称候选不变式	
def convert(q_inv_low):
	'''
	q_inv_low_temp = q_inv_low.replace('[1]','[3]')
	q_inv_low_temp = q_inv_low_temp.replace('[2]','[4]')
	q_inv_low_temp = q_inv_low_temp.replace('[3]','[2]')
	q_inv_low_temp = q_inv_low_temp.replace('[4]','[1]')
	q_inv_low_temp = q_inv_low_temp.replace('= 1','= 3')
	q_inv_low_temp = q_inv_low_temp.replace('= 2','= 4')
	q_inv_low_temp = q_inv_low_temp.replace('= 4','= 1')
	q_inv_low_temp = q_inv_low_temp.replace('= 3','= 2')
	q_inv_low_temp = q_inv_low_temp.replace('1 =','3 =')
	q_inv_low_temp = q_inv_low_temp.replace('2 =','4 =')
	q_inv_low_temp = q_inv_low_temp.replace('4 =','1 =')
	q_inv_low_temp = q_inv_low_temp.replace('3 =','2 =')
	return q_inv_low_temp
	'''
	pass_flag = 0
	sca_not_list = readTxt('not.txt')
	#print (sca_not_list)
	for i in range(len(q_inv_low)):
		if q_inv_low[i] == '[':
			for member in sca_not_list:
				member_len = len(member)
				if member_len <= i:
					if q_inv_low[i - member_len:i] == member.lower():
						pass_flag = 1
						break
			if pass_flag == 1:
				pass_flag = 0
			else:
				if q_inv_low[i + 1] == '1':
					#q_inv_low[i + 1] = '2'
					q_inv_low = q_inv_low[:i+1] + '2' + q_inv_low[i+2:]
				else:
					#q_inv_low[i + 1] = '1'
					q_inv_low = q_inv_low[:i+1] + '1' + q_inv_low[i+2:]
		elif   q_inv_low[i] == '=':
			if (q_inv_low[i - 2] == '1' or q_inv_low[i - 2] == '2') and q_inv_low[i - 3]  == '(': #1 = 的情况
				for j in range(i + 2,len(q_inv_low)):
					if q_inv_low[j] == ')':
						for member in sca_not_list:
							member_len = len(member)
							if member_len <= j:
								if q_inv_low[j - member_len:j] == member.lower():
									#print (q_inv_low[j - member_len:j])
									#print (q_inv_low[j - member_len-5:j+5])
									pass_flag = 1
									break
						break
				if pass_flag == 1:
					pass_flag = 0
				else:
					if q_inv_low[i - 2] == '1':
						#q_inv_low[i - 2] = '2'
						q_inv_low = q_inv_low[:i-2] + '2' + q_inv_low[i-1:]
					else:
						#q_inv_low[i - 2] = '1'
						q_inv_low = q_inv_low[:i-2] + '1' + q_inv_low[i-1:]
			elif (q_inv_low[i + 2] == '1' or q_inv_low[i + 2] == '2') and q_inv_low[i + 3]  == ')':
				for member in sca_not_list:
					member_len = len(member)
					if member_len <= i - 1:
						if q_inv_low[i - member_len - 1:i-1] ==  member.lower():
							pass_flag = 1
							break
				if pass_flag == 1:
					pass_flag = 0
				else:
					if q_inv_low[i + 2] == '1':
						#q_inv_low[i + 2] = '2'
						q_inv_low = q_inv_low[:i+2] + '2' + q_inv_low[i+3:]
					else:
						#q_inv_low[i + 2] = '1'
						q_inv_low = q_inv_low[:i+2] + '1' + q_inv_low[i+3:]			
	return q_inv_low
						

					
						
		
				
				
		

#生成候选不变式-路径文件字典
def	findInvAttribute(candidate_inv_list,title):
	result = {}
	for member in candidate_inv_list:
		inv_attribute = analysisQinv(member,title)
		result[member] = inv_attribute
	return result

#分析候选不变式中的属性，返回属性列表
def analysisQinv(q_inv,title):
	attribute_result = []
	q_inv_temp = q_inv.replace('(','')
	q_inv_temp = q_inv_temp.replace(')','')
	q_inv_temp = q_inv_temp.replace('!','')
	q_inv_part_list = q_inv_temp.split(' & ')
	for member in q_inv_part_list:
		temp_list = member.split(' = ')
		for attribute in temp_list:
			attribute_temp = attribute.strip()
			#print(attribute_temp)
			#print(title)
			if (attribute_temp in title) and (attribute_temp not in attribute_result):
				attribute_result.append(attribute_temp)
	#print attribute_result
	return attribute_result	

#生成路径文件名称，并存入路径字典，字典的键是属性列表排序后的字符串，值是路径文件的名称，由数字+'.txt'组成
g_number = 0
def creatPathName(attribute_list,path_dict):
	global g_number
	dir_path = os.getcwd() +'/pathfile/'
	if not os.path.exists(dir_path):
		os.makedirs(dir_path)
	result_save_name = dir_path + str(g_number) + '.txt'
	list_str = listToString(attribute_list)
	path_dict[list_str] = result_save_name
	g_number = g_number + 1
	return result_save_name

#将列表变为字符串		
def listToString(list_target):
	list_target.sort()
	list_str = ''
	for member in list_target:
		list_str = list_str + member
	return list_str
		
	
#读取txt文件（按行读取）
def readTxt(filename):
	result = []
	f = open(filename)
	lines = f.readlines()
	for line in lines:
		result.append(line.strip())
	f.close()
	return result

#去除对称名称 + 小写化
def titleChange(title,sign):
	result = title[:]
	for i in range(len(result)):
		for j in range(len(sign)):
			if sign[j] in result[i]:
				result[i] = result[i].replace(sign[j],'')
		result[i] = result[i].lower()
	return result
	
#获得候选不变式
def findJudgeAttribute(title,data_set,attribute_list):
	judge_attribute = attribute_list[0]
	max_len = 0
	for member in attribute_list:
		if member not in title:
			#print 'error member not in title!'
			#print 'memeber :' + member
			#print 'title :' + title
			a = 0
		else:
			position = title.index(member)
			temp_list = [example[position] for example in data_set] #找到数据集中该位置的所有取值
			temp_set = set(temp_list)
			temp_set_list = list(temp_set)
			if len(temp_set_list) > max_len: #该属性包含的状态不只一个，选择该属性作为分类属性
				judge_attribute = member
				max_len = len(temp_set_list)
	return judge_attribute

#按属性压缩表头、数据集
def dataCompress(title,data_set,attribute_list,judge_attribute):
	attribute_position_list = findAttributePosition(title,attribute_list) #查询不变式中属性在title中的位置
	judge_attribute_position = title.index(judge_attribute)
	data_set_column = []#存储数据集的列
	compress_title = []#压缩后的可达状态
	for number in attribute_position_list:
		if number != judge_attribute_position: #先加入非分类属性的属性
			attribute_column = read_column(data_set,number)
			data_set_column.append(attribute_column)
			compress_title.append(title[number])
	judge_attribute_column = read_column(data_set,judge_attribute_position)#获得分类属性的列
	data_set_column.append(judge_attribute_column) #加入分类属性列
	compress_title.append(judge_attribute)#加入分类属性
	data_set_row=[[r[col] for r in data_set_column] for col in range(len(data_set_column[0]))] #列表行转列——转换为按行读取的形式
	return compress_title,data_set_row


#返回指定列的数据
def read_column(data_set,position):
	target_column = [row[position] for row in data_set]
	return target_column

#返回各个属性在title中的位置
def findAttributePosition(title,attribute_list):
	result_list = []
	for member in attribute_list:
		position = title.index(member)
		result_list.append(position)
	return result_list

#生成决策树
def createTree(title,data_set):
	class_list = [example[-1] for example in data_set]  #收集所有元素的类别，-1是判定类别的值
	if len(data_set[0]) == 1:    #特征用完,返回叶子节点（判断属性取值）
		return createLeaf(class_list) #生成叶子节点
	best_feat = chooseBestFeatureToSplit(title,data_set) #确定分类特征
	best_feat_label = title[best_feat]   #找到最佳特征所对应的名字
	my_tree = {best_feat_label:{}}  #使用最佳特征创建节点
	del(title[best_feat])  #删除特征名字合集中已经使用的标签名
	feat_values = [example[best_feat] for example in data_set]  #找到最佳特征可能的取值（有重复）
	unique_vals = set(feat_values)   #去掉最佳特征可能取值集中的重复
	for value in unique_vals:
		sub_title = title[:]  #使用切片复制labels集
		temp = splitDataSet(data_set, best_feat, value)
		my_tree[best_feat_label][value] = createTree(sub_title,temp)
	return my_tree  #返回生成好的树（字典）

		
#生成叶子节点——拼接可取值	
def createLeaf(classList):
	class_set = set(classList)
	result = ''
	for member in class_set:
		if result == '':
			result = member
		else:
			result = result + ' | ' + member
	return result

#选择分类属性
def chooseBestFeatureToSplit(title,data_set):
	num_features = len(data_set[0]) - 1   #找到特征的数量，减一是为了排除最后一项（数据的分类项）
	base_entropy = 100#基础熵
	best_info_gain = 0.0; best_feature = -1  #最大信息增益基础值（初始化）为0，最佳特征基础值为-1
	for i in range(num_features):  #遍历所有的特征
		feat_list = [example[i] for example in data_set]  #使用列表解析，将数据集中的每个元素的特征值（i对应的）加入列表中
		unique_vals = set(feat_list)  #获得没用重复的取值，也就是所有可能取值的列表
		new_entropy = 0.0  #用于记录按特征划分后的熵，初始化为0
		for value in unique_vals:  #对于每种取值
			sub_data_set = splitDataSet(data_set,i,value) #找出所有符合取值的状态
			prob = len(sub_data_set)/float(len(data_set))
			new_entropy += prob * calcShannonEnt(sub_data_set)
		info_gain = base_entropy - new_entropy  #信息增益的计算
		if(info_gain > best_info_gain):  #如果按第i个特征划分后的信息增益比之前记录的最佳划分的增益要好（大）
			best_info_gain = info_gain #更新最佳信息增益
			best_feature = i  #跟新最佳划分（特征）
	return best_feature #返回最佳特征
	

#按属性取值筛选状态
def splitDataSet(data_set,axis,value):   #参数分别为 数据集、特征值的位置、特征值的值
	ret_data_set = []
	for feat_vec in data_set:  #对于数据集（列表）中的每个元素
		if feat_vec[axis] == value:   #如果特征值的值等于规定的值
			reduced_feat_vec = feat_vec[:axis]  #创建切片，并移除特征值项（前半部分）
			reduced_feat_vec.extend(feat_vec[axis+1:])  #创建切片，并移除特征值项（后半部分）
			ret_data_set.append(reduced_feat_vec) #将去除特征值项的元素组成新的列表
	return ret_data_set  #返回特征值等于给定值的元素组成的列表，其中特征值项已被删除

#计算香浓熵
def calcShannonEnt(data_set):
	num_entries = len(data_set) #获取data列表中的元素个数
	label_counts = {}  #创建空的字典，用于记录每种取值情况的个数，用于计算熵
	for feat_vec in data_set:
		current_label = feat_vec[-1]   #取列表中的每一个元素（列表），找到该元素（列表）的最后一个元素的取值（决定该元素的分类），并记录下来
		if current_label not in label_counts.keys():  #如果这种元素的取值还未记录与字典labelCounts中，则在该字典中创建该分类的键值对并初始化为0
			label_counts[current_label] = 0
		label_counts[current_label] += 1  #按键值（种类）记录找到的取值
	shannon_ent = 0.0  #初始的香农熵 默认为0
	for key in label_counts:   #对于labelCounts中的每种元素取值
		prob = float(label_counts[key])/num_entries   #计算这种取值的概率 ：该类型总数/总数
		shannon_ent -= prob * log(prob,2)  #香浓熵的计算  -p(xi)log2p(xi)的和
	return shannon_ent #返回结果（香农熵）

#生成路径文件-总
def createPathFile(tree,judge_attribute,file_name,path_content_dict):
	if type(tree) != dict:
		SingleAttributeSave(tree,judge_attribute,file_name,path_content_dict)
	else:
		treeGeography(tree,judge_attribute,file_name,path_content_dict)

'''	
#生成路径文件-候选不变式只有一种属性的情况
def SingleAttributeSave(tree,judge_attribute,file_name):
	path_list = []
	with open(file_name,'w') as f:
		if ' | ' in tree: #单个属性多种取值（状态）
			class_list = tree.split(' | ') 
			for i in range(len(class_list)):
				if i != (len(class_list) - 1):
					path_temp = '(' + judge_attribute + ' = ' + class_list[i] + ')\n'
				else:
					path_temp = '(' + judge_attribute + ' = ' + class_list[i] + ')'
				path_list.append(path_temp)
		else:
			path_temp = '(' + judge_attribute + ' = ' + tree + ')'.lower()
			path_list.append(path_temp)
		f.writelines(path_list)
		f.close()
'''

#生成路径列表并存于字典-候选不变式只有一种属性的情况
def SingleAttributeSave(tree,judge_attribute,file_name,path_content_dict):
	path_list = []
	if ' | ' in tree: #单个属性多种取值（状态）
		class_list = tree.split(' | ')
		for i in range(len(class_list)):
			path_temp = '(' + judge_attribute + ' = ' + class_list[i] + ')'
			path_list.append(path_temp.lower())
	else:
		path_temp = '(' + judge_attribute + ' = ' + tree + ')'.lower()
		path_list.append(path_temp)
	path_content_dict[file_name] = path_list
				




'''
#生成路径文件-一般情况
def treeGeography(tree,judge_attribute,file_name,path_content_dict):
	tree_map = [] #记录所有从根节点到达‘false’叶子节点的路径
	track = [] #用于记录之前走过的路径
	expedition(tree,track,tree_map,judge_attribute)
	result = editor(tree_map) #利用找到的路径合成假设不变式
	with open(file_name,'w') as f:
		f.write(result)
		f.close()
'''
#生成路径列表并存于路径内容字典-一般情况
def treeGeography(tree,judge_attribute,file_name,path_content_dict):
	tree_map = [] #记录所有从根节点到达‘false’叶子节点的路径
	track = [] #用于记录之前走过的路径
	expedition(tree,track,tree_map,judge_attribute)
	result = editor(tree_map) #利用找到的路径合成假设不变式
	path_content_dict[file_name] = result




#生成路径文件步骤1，将路径转化为列表
def expedition(tree,track,tree_map,judge_attribute):
	#探索当前节点与节点的分支
	first_sides = list(tree.keys()) #得到含有根节点的列表，如根节点为A，则得到[A]
	first_str = first_sides[0] #得到根节点名称 如A;(和上一行注释一起看)
	second_dict = tree[first_str] #获得根节点的子树，子树是字典类型
	#探索部分结束，获得当前节点名称firstStr，和当前节点分支secondDict
	
	#判断各个分支的情况（其实就两条，true与false）
	for key in second_dict.keys(): #遍历子树，即子树的两个分支
		if type(second_dict[key]) != dict: #分支下的节点不是中间节点(字典)就是叶子节点(字符串‘false’或‘true’),这里是叶子的情况
			new_track = track[:];
			new_track.append(first_str + ' = ' + key) #加入新路径
			#new_track.append(calssify_attribute + ' = ' + secondDict[key])
			#tree_map.append(new_track)
			if ' | ' in second_dict[key]: #用于处理叶子结点中包含多个属性的情景
				attribute_class_list = second_dict[key].split(' | ')
				for member in attribute_class_list:
					new_track_temp = new_track[:]
					new_track_temp.append(judge_attribute + ' = ' + member)
					tree_map.append(new_track_temp)
			else:
				new_track_temp = new_track[:]
				new_track_temp.append(judge_attribute + ' = ' + second_dict[key])
				tree_map.append(new_track_temp)
		else: #分支下是字典(中间节点)，需要继续探索
			#更新足迹
			new_track_2 = track[:]
			new_track_2.append(first_str + ' = ' + key)
			#足迹更新完毕，继续探索
			expedition(second_dict[key],new_track_2,tree_map,judge_attribute)
'''
#生成路径文件步骤2，将路径转化为合适的格式（字符串）
def editor(tree_map): #用于将收集到的路径拼接成结果（假设不变式）
	result = ''
	for original_path in tree_map:
		#将路径列表用‘&’连接起来
		result_path = '' #用于储存用‘ & ’连接好的路径
		for member in original_path:
			if result_path =='':
				result_path = member
			else:
				result_path = result_path + ' & ' + member
		#合成连接好的路径	
		if result == '':
			result = '(' + result_path + ')'
		else:
			result = result + '\n' + '(' + result_path + ')'
	return result
'''
#生成路径文件步骤2，将路径转化为合适的格式（路径列表）
def editor(tree_map): #用于将收集到的路径拼接成结果
	result = []
	for original_path in tree_map:
		#将路径列表用‘&’连接起来
		result_path = '' #用于储存用‘ & ’连接好的路径
		for member in original_path:
			if result_path =='':
				result_path = member
			else:
				result_path = result_path + ' & ' + member
		result.append('(' + result_path + ')')
	return result


'''
#筛选候选不变式
def z3checker(inv,path_file_name,z3):
	path_list = readPathList(path_file_name) #读取优先决策树路径
	for member in path_list:
		member_temp = member.replace('undefined','3')
		stm_test = transDTAndQInv(member_temp,inv)
		#print stm_test
		res = z3.check(stm_test)
		if res == 'sat':
			return 'sat'
	return 'unsat'
'''
#筛选候选不变式,使用路径内容字典
def z3checker(inv,path_file_name,z3,path_content_dict):
	path_list = path_content_dict[path_file_name] #读取优先决策树路径
	for member in path_list:
		member_temp = member.replace('undefined','3')
		stm_test = transDTAndQInv(member_temp,inv)
		#print stm_test
		res = z3.check(stm_test)
		if res == 'sat':
			return 'sat'
	return 'unsat'

'''
def readPathList(file_name):
	result = []
	f = open(file_name)
	lines = f.readlines() #读取全部内容以列表形式返回
	for line in lines:
		result.append(line.replace('\n',''))
	f.close()
	return result
'''

def transDTAndQInv(dt_path,qinv):
	dt_result = transForDTPath(dt_path)
	q_result = transForQInv(qinv)
	result = '(assert (and ' + dt_result + ' ' + q_result +'))'
	return result

#目标(assert (not (=> (and (= (n 5) C) (= (n 3) C)) (and (= (n 3) C) (= (n 5) C))))):  unsat
#针对决策树路径的中缀转前缀
def transForDTPath(dt_path): #用于处理来自于决策树的不变式，例如"(x = TRUE & n[1] != C & n[1] != E & n[2] != C & n[2] != E)"
	member_list = []
	strsplit = dt_path[1:-1].split('&')
	for member in strsplit:
		member_temp = member.strip()
		if '=' in member_temp and '!=' not in member_temp: #表达式为 a = b的形式
			parameter_list = member_temp.split(' = ')
			if '[' in parameter_list[0]:
				part1 = '(' + changeForm(parameter_list[0]) + ')'
			else:
				part1 = parameter_list[0]
			if '[' in parameter_list[1]:
				part2 = '(' + changeForm(parameter_list[1]) + ')'
			else:
				part2 = parameter_list[1]
			newform = '(' + ' ' + '=' + ' ' + part1 + ' ' + part2 + ')'
			member_list.append(newform)
		elif '!=' in member_temp: #表达式为 a != b的形式
			parameter_list = member_temp.split(' != ')
			if '[' in parameter_list[0]:
				part1 = '(' + changeForm(parameter_list[0]) + ')'
			else:
				part1 = parameter_list[0]
			if '[' in parameter_list[1]:
				part2 = '(' + changeForm(parameter_list[1]) + ')'
			else:
				part2 = parameter_list[1]
			newform = '(not ' + '(' + ' ' + '=' + ' ' + part1 + ' ' + part2 + ')' + ')'
			member_list.append(newform)
		'''
		else:
			print 'error no = or !='
		'''
	result = ''
	if len(member_list) == 1:
		result = member_list[0]
	else:
		for member in member_list:
			if result == '':
				result = member
			else:
				result = '(' + 'and ' + result + ' ' + member + ')'
	return result

#针对查询不变式的中缀转前缀，方法为将查询不变式的形式转换为决策树不变式的形式，即（A & B & C），其中A、B、C用‘ = ’或‘ ！= ’连接
def transForQInv(qinv):#用于处理查询的inv
	qinv_temp = qinv[2:-1] #去掉！与第一层括号
	qinv_temp = qinv_temp.replace('(','')
	qinv_temp = qinv_temp.replace(')','')
	qinv_list = qinv_temp.split(' & ')
	for i in range(len(qinv_list)):
		if '!' in qinv_list[i]:
			qinv_list[i] = qinv_list[i].replace('!','')
			temp_list = qinv_list[i].split(' = ')
			qinv_list[i] = temp_list[0] + ' != ' + temp_list[1]
	new_qinv = ''
	for member in qinv_list:
		if new_qinv == '':
			new_qinv = member
		else:
			new_qinv = new_qinv + ' & ' + member
	result = transForDTPath('(' + new_qinv + ')')
	return result

#候选不变式的复用函数，功能有两种，一是返回候选不变式的独特标记（排序后）,二是返回候选不变式的查询结果
def checkDict(candidate_inv,candidate_dict):
	inv = candidate_inv[2:-1].replace('(','').replace(')','')
	part_list = inv.split(' & ')
	for i in range(len(part_list)):
		if '!' in part_list[i]:
			temp = part_list[i].replace('!','')
			temp_list = temp.split(' = ')
			temp_list.sort()
			result = ''
			for j in range(len(temp_list)):
				if result == '':
					result = temp_list[j]
				else:
					result = result + '!=' + temp_list[j]
			part_list[i] = result
		else:
			temp = part_list[i]
			temp_list = temp.split(' = ')
			temp_list.sort()
			result = ''
			for j in range(len(temp_list)):
				if result == '':
					result = temp_list[j]
				else:
					result = result + '=' + temp_list[j]
	part_list.sort()
	link_str = ' & '
	candidate_mark = link_str.join(part_list)
	if candidate_mark in list(candidate_dict.keys()):
		candidate_result = candidate_dict[candidate_mark]
	else:
		candidate_result = ''
	return candidate_mark,candidate_result

#用于中缀转前缀将‘[]’中的值一尺去
def changeForm(str_target):
	result = str_target
	if '[' in str_target:
		for i in range(len(str_target)):
			if str_target[i] == '[':
				value = str_target[i + 1]
				result = str_target[:i] + str_target[i+3:] + ' ' + value
				break
		if '[' in result:
			result = changeForm(result)
	return  result
#决策树方法实现（包含预处理2），该函数用于拆分候选不变式，主要实现在	DtModule函数中
def candidateInvChecker(candidate_inv,z3,title,data_set,path_dict,candidate_dict,path_content_dict,sca_flag):
	#拆分含有‘|’的候选不变式
	if '|' in candidate_inv:
		candidate_inv_list = []
		temp = candidate_inv[2:-1].replace('(','').replace(')','')
		temp_list = temp.split(' | ')
		for member in temp_list:
			candidate_inv_list.append('!(' + member + ')')
		for member in candidate_inv_list:
			res = DtModule(member,z3,title,data_set,path_dict,candidate_dict,path_content_dict,sca_flag)
			if res == 'false':
				return 'false'
		return 'true'
	else:
		return DtModule(candidate_inv,z3,title,data_set,path_dict,candidate_dict,path_content_dict,sca_flag)
				
'''	
def test():
	candidate_inv_list = []
	candidate_inv = '(!((((replace = non) & (node[2].hasLock = TRUE) & (node[2].firstRead[1] = FALSE) & (node[2].cache[2].state = valid) & (node[2].cache[2].addr = 1) & (!(node[2].cache[2].data = 1)) & (lock[1].beUsed = TRUE) & (lock[1].owner = 1) & (node[1].hasLock = TRUE) & (node[1].cache[2].state = invalid) & (node[1].cache[1].state = invalid) & (lock[2].inProtection[1] = FALSE)) | ((replace = non) & (node[2].hasLock = TRUE) & (node[2].firstRead[1] = FALSE) & (node[2].cache[2].state = valid) & (node[2].cache[2].addr = 1) & (!(node[2].cache[2].data = 1)) & (lock[1].beUsed = TRUE) & (lock[1].owner = 1) & (node[1].hasLock = TRUE) & (!(node[1].cache[2].addr = 1)) & (node[1].cache[1].state = invalid) & (lock[2].inProtection[1] = FALSE)) | ((replace = non) & (node[2].hasLock = TRUE) & (node[2].firstRead[1] = FALSE) & (node[2].cache[2].state = valid) & (node[2].cache[2].addr = 1) & (!(node[2].cache[2].data = 1)) & (lock[1].beUsed = TRUE) & (lock[1].owner = 1) & (node[1].hasLock = TRUE) & (node[1].cache[2].state = invalid) & (!(node[1].cache[1].addr = 1)) & (lock[2].inProtection[1] = FALSE)) | ((replace = non) & (node[2].hasLock = TRUE) & (node[2].firstRead[1] = FALSE) & (node[2].cache[2].state = valid) & (node[2].cache[2].addr = 1) & (!(node[2].cache[2].data = 1)) & (lock[1].beUsed = TRUE) & (lock[1].owner = 1) & (node[1].hasLock = TRUE) & (!(node[1].cache[2].addr = 1)) & (!(node[1].cache[1].addr = 1)) & (lock[2].inProtection[1] = FALSE)))))'
	temp = candidate_inv[2:-1].replace('(','').replace(')','')
	temp_list = temp.split(' | ')
	for member in temp_list:
			candidate_inv_list.append('!(' + member + ')')
	for member in candidate_inv_list:
		print(member)
'''

def test():
		candidate_inv = '(!((node[1].cache[1].addr = 1) & (!(node[1].cache[1].data = memory[1].data)) & (1 = curNode) & (1 = curCache)))'
		res = convert(candidate_inv.lower())
		print(res)

if __name__ == "__main__":
	'''
	candidate_inv = ''
	z3 = ''
	data_set_csv = 'ndata.csv'
	sign_txt = 'sign.txt'
	
	#DtModuleData1(data_set_csv,sign_txt)
	list1 = ['x','n[1]','n[2]','a2','b.c.d[1]','b.a.d[2]']
	list1.sort()
	print(list1)
	
	test = 'node[1].firstRead[1]'
	#print (changeForm(test))
	print (transDTAndQInv())
	'''
	test()
