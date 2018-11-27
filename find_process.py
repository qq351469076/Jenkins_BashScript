# !/usr/bin/python
# -*- coding: utf-8 -*-
import sys
from os import popen

reload(sys)
sys.setdefaultencoding('utf-8')


def find_process(process_name_):
    a = popen('ps -ef | grep python | grep -v grep').read()  # 查找所有python进程
    b = []
    for _ in a.split('\n'):
        if len(_) != 0:  # 过滤''
            if _.split()[-1] == process_name_:
                b.append(_.split()[-1])

    if len(b) == 1:  # 没找到进程
        print u'没找到进程'
        exit(1)
    else:  # 找到进程
        print u'找到了进程'
        exit(0)


if __name__ == '__main__':
    process_name = sys.argv[1]  # 进程名.py
    find_process(process_name)  # 查找进程
