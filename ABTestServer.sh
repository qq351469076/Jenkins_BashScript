#!/bin/bash 
 
process_name='manager.py'
process_folder='/data1/www/DSP/ABTestserver/'
process_backup='/data1/www/DSP/Jenkins/abtest_backup/'
process_folder_name='ABTest_server' 
 
find_process(){ 
 
    for temp in `ps aux| grep ${process_name} | grep -v grep | awk '{print $2}'`;do 
        id=${temp} 
    done 
         
    kill -9 ${id} 
} 
 
Backup_Env(){ 
     
    time=$(date +%Y%m%d%H%M) 
 
    mkdir ${process_backup}${time} 
    cp -rf  ${process_folder}* ${process_backup}${time} 
} 
 
Git_Clone(){ 
 
    cd ${process_backup} 
 
    git clone https://github.com/adlab-zilong/ABTest_server.git 
    
    cp -rf ${process_folder_name}/* ${process_folder}
    rm -rf ${process_folder_name}
}

find_process
Backup_Env
Git_Clone

python ${process_folder}manager.py
