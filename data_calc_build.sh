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
 
Git_Clone(){ 
 
    cd ${process_backup} 
 
    git clone https://github.com/adlab-zilong/data_calc.git 
    
    mv ${process_folder_name}/money_clac/*.py ../
    mv ${process_folder_name}/KPI_clac/*.py ../
    mv ${process_folder_name}/report/*.py ../
    rm -rf ${process_folder_name}
}

find_process
Backup_Env
Git_Clone
