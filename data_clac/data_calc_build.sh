#!/bin/bash 
 
process_name='nohup_run_clac.py'
process_folder='/var/www/data_calc/'
process_backup='/var/www/data_calc/Jenkins_backup/'
 
Backup_Env(){ 
     
    time=$(date +%Y%m%d%H%M) 
 
    mkdir ${process_backup}${time} 
    cp ${process_folder}*.py ${process_backup}${time} 
} 
 
reload_system(){ 
 
    cd /data1/www/test_kxx 
    unzip -o -d ./ ./data_clac_package.zip 
    mv ./data_clac/money_clac/*.py ${process_folder}
    mv ./data_clac/KPI_clac/*.py ${process_folder}
    mv ./data_clac/report/*.py ${process_folder}
    rm -rf ./data_clac
    rm -rf ./data_clac_package.zip
}

Backup_Env
reload_system
