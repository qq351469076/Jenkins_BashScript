#!/bin/bash 
 
process_name='API.py'
process_folder='/var/www/data_meida_API/MT_media_API/'
process_backup='/var/www/data_meida_API/MT_media_API/Jenkins_backup/'
process_folder_name='meida_API' 
 
find_process(){ 
 
    for temp in `ps aux| grep ${process_name} | grep -v grep | awk '{print $2}'`;do 
        id=${temp} 
    done 
         
    kill -9 ${id} 
} 
 
Backup_Env(){ 
     
    time=$(date +%Y%m%d%H%M) 
 
    mkdir ${process_backup}${time} 
    cp ${process_folder}*.py ${process_backup}${time} 
} 
 
Git_Clone(){ 
 
    cd ${process_backup} 
 
    git clone https://github.com/adlab-zilong/meida_API.git 
    
    mv ${process_folder_name}/API/Multi_media_API/*.py ../
    rm -rf ${process_folder_name}
}

find_process
Backup_Env
Git_Clone
