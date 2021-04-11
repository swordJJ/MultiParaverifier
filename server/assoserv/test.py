

import os
import subprocess
from subprocess import PIPE
import hashlib

from pexpect import spawn, EOF, TIMEOUT


def base(cmd):
    if subprocess.call(cmd, shell=True):
        raise Exception("{} fail".format(cmd))

if __name__ == '__main__':
    base('python3 Assoc.py -p mutualEx')