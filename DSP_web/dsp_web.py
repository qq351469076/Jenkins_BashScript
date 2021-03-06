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
    os.system('svn update C:\\Jenkins\\workspace\\DSP_web')	# 更新本地svn目录
    make_zip('C:\\Jenkins\\workspace\\DSP_web\\DSP_web', 'C:\\Jenkins\\workspace\\DSP_web.zip')	# 压缩
    os.system(r'pscp -i C:\data_server\60_linux.ppk C:\Jenkins\workspace\DSP_web.zip ****@***.**.**.**:/data1/www/monitor/')