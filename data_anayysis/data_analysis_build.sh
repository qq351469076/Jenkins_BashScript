#!/bin/bash

process_name='nohup_run.py'     # 进程的名字
process_folder='/var/www/data_analysis/'          # 程序运行的地方
process_backup='/var/www/data_analysis/Jenkins_backup/'  # 程序备份的地方
process_folder_name='data_analysis_DB'

find_process(){
    # 杀掉进程

    for temp in `ps aux| grep ${process_name} | grep -v grep | awk '{print $2}'`
    do
        id=${temp}
    done
	
    kill -9 ${id}
}

Backup_Env(){
    # 把线上*.py文件备份到时间戳目录
    
    time=$(date +%Y%m%d%H%M)

    mkdir ${process_backup}${time}
    cp ${process_folder}*.py ${process_backup}${time}
}

reload_system(){

    cd /data1/www/test_kxx
    unzip -o -d ./ ./data_analysis_package.zip
    
    mv ./LX_data_analysis_DB/python/*.py ${process_folder}

    rm -rf ./LX_data_analysis_DB
    rm -rf ./data_analysis_package.zip
}

find_process
Backup_Env
reload_system

























