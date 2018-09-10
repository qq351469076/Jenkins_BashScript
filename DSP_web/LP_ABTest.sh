#!/bin/bash

unzip -o -d ./ ./DSP_web.zip         # 解压
cp -rf ./DSP_web /data1/www/DSP
rm -rf ./DSP_web
