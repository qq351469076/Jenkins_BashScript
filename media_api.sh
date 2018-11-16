#!/bin/bash 
 
process_name='nohup_run_media.py'
process_folder='/data1/www/data_media_API/'
process_backup='/data1/www/data_media_API/Jenkins_backup/'
 
find_process(){ 
 
    for temp in `ps aux| grep ${process_name} | grep -v grep | awk '{print $2}'` 
    do 
	kill -9 ${temp}
    done 
} 
 
Backup_Env(){ 
     
    time=$(date +%Y%m%d%H%M) 
 
    mkdir ${process_backup}${time} 
    cp ${process_folder}*.py ${process_backup}${time} 
} 
 
reload_system(){ 
 
    cd /data1/www/test_kxx 
    unzip -o -d ./ ./media_API.zip 
    mv ./media_API/API_v3/*.py ${process_folder}
    mv ./headlenr_API/*.py ${process_folder}
    rm -rf ./media_API
    rm -rf ./media_API.zip
}

find_process
Backup_Env
reload_system
