# !/usr/bin/python
# -*- coding: utf-8 -*-
import sys
from os import popen, system

reload(sys)
sys.setdefaultencoding('utf-8')

a = popen('ps -ef | grep python | grep -v grep').read()


def kill_process(process_name_):
    for _ in a.split('\n'):
        if len(_) != 0:
            if _.split()[-1] == process_name_:
                system('kill -9 {}'.format(_.split()[1]))


if __name__ == '__main__':
    process_name = sys.argv[1]  # 接受 进程名.py
    kill_process(process_name)
