#!/bin/bash 
 
process_name='nohup_run_clac.py'
process_folder='/var/www/data_calc/'
process_backup='/var/www/data_calc/Jenkins_backup/'
process_folder_name='data_calc' 
 
find_process(){ 
 
    for temp in `ps aux| grep ${process_name} | grep -v grep | awk '{print $2}'` 
    do 
        id=${temp} 
    done 
         
    kill -9 ${id} 
} 
 
Backup_Env(){ 
     
    time=$(date +%Y%m%d%H%M) 
 
    mkdir ${process_backup}${time} 
    cp ${process_folder}*.py ${process_backup}${time} 
} 
 
reload_system(){ 
 
    cd /data1/www/test_kxx 
    unzip -o -d ./ ./data_clac_package.zip 
    mv ./LX_data_clac/money_clac/*.py ${process_folder}
    mv ./LX_data_clac/KPI_clac/*.py ${process_folder}
    mv ./LX_data_clac/report/*.py ${process_folder}
    rm -rf ./LX_data_clac
    rm -rf ./data_clac_package.zip
}

find_process
Backup_Env
reload_system
