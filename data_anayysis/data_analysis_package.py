# !/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import zipfile
import os

reload(sys)
sys.setdefaultencoding('utf-8')


def make_zip(source_dir, output_filename):
    zipf = zipfile.ZipFile(output_filename, 'w')
    pre_len = len(os.path.dirname(source_dir))
    for parent, dirnames, filenames in os.walk(source_dir):
        for filename in filenames:
            pathfile = os.path.join(parent, filename)
            arcname = pathfile[pre_len:].strip(os.path.sep)  # 相对路径
            zipf.write(pathfile, arcname)
    zipf.close()


if __name__ == '__main__':
	os.system('svn update C:\\Jenkins\\workspace\\data_analysis')	# 更新到最新版本
	make_zip('C:\\Jenkins\\workspace\\data_analysis\\python', 'C:\\Jenkins\\workspace\\data_analysis_package.zip')
	os.system(r'pscp -i C:\data_server\150_linux.ppk C:\Jenkins\workspace\data_analysis_package.zip ****@***.**.***.***:/data1/www/test_kxx/')
