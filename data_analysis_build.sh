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

Git_Clone(){
    # 克隆新版替换线上*.py

    cd ${process_backup}

    git clone https://github.com/adlab-zilong/data_analysis_DB.git
    
    mv ${process_folder_name}/python/*.py ../

    rm -rf ${process_folder_name}
}

find_process
Backup_Env
Git_Clone

























