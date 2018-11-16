#!/bin/bash


cd /data1/www/monitor
unzip -o -d ./ ./DSP_web.zip         # 解压
echo '333333'
cp -rf ./DSP_web /data1/www/DSP
echo '4444444'
rm -rf ./DSP_web
echo '555555'
rm -rf ./DSP_web.zip
