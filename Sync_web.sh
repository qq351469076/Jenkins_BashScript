#!/bin/bash

process='/data1/www/Sync-web'
git_folder='/data1/www/DSP/Jenkins/git_clone/Sync-web'

cd ${git_folder}                                                        # 进入clone目录
before=`git rev-parse --short HEAD`                                     # 拉之前的id
git pull                                                                # 拉更新
last=`git rev-parse --short HEAD`                                       # 拉最新的id
git diff ${before} ${last} --name-only | xargs zip update.zip           # 制作差异增量包
unzip -o -d ../update ./update.zip                                      # 解压缩
cp -r  ../update/* ${process}                                           # 复制增量到线上
rm -rf ../update                                                        # 删除解压之后的文件夹
~                                                                                                           
