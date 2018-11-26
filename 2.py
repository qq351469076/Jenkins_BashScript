# !/usr/bin/python
# -*- coding: utf-8 -*-
import sys
from os import popen, system

reload(sys)
sys.setdefaultencoding('utf-8')


a = popen('ps -ef | grep python | grep -v grep').read()


def kill_process(process_name):
    for _ in a.split('\n'):
        if len(_) != 0:
	    if _.split()[-1] == process_name:
		system('kill -9 {}'.format(_.split()[1]))





process_name = sys.argv[1]
kill_process(process_name)
