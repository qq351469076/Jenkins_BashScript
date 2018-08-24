#!/bin/bash
BUILD_ID=dontKillMe
cd /var/www/data_meida_API/MT_media_API
nohup python API.py >> ./nohup.out 2>&1 &

sleep 1m

pid_id=`ps -ef | grep API.py | grep -v grep | awk '{print $2}'`

if [ ${#pid_id} -ge 1 ];then
    echo 'yes'
else
    echo 'no'
    exit 1
fi


