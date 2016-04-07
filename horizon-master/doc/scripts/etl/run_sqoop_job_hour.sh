#!/bin/sh

source /etc/profile
source ~/.bash_profile

`find /home/dwetl/kettle/log/ -mtime +6 -name "*.log.*" -exec rm -f {} \;`

`find /home/dwetl/DATA/DW_ODS/ -mtime +1 -exec rm -rf {} \;` 

BASEDIR=`dirname $0`
cd $BASEDIR
today=`date +%Y-%m-%d`
LOGFILE=/home/dwetl/kettle/log/all.log.${today}
KETTLE_LOG_DIR=/home/dwetl/kettle/log/
echo ${LOGFILE}

etl_system=$1
etl_job=$2
sdate=$3
timezone='PST8PDT'
shour=$4
ehour=$5

if [ ! ${etl_system} ]; then
    etl_system='test'
fi

if [ ! ${etl_job} ]; then
    etl_job='test'
fi

if [ ! ${sdate} ]; then
    sdate=`date -d '-1 hours' +%Y-%m-%d`
fi

if [ ! "${shour}" ]; then
    shour=`date -d '-1 hours' +%Y-%m-%d\ %H`
fi

shour_seconds=`date -d "${shour}" +%s`
ehour_seconds=$((shour_seconds + 3600)) 

if [ ! "${ehour}" ]; then
    ehour=`date -d @$ehour_seconds +%Y-%m-%d\ %H`
fi

sdate=`date -d "${shour}" +%Y-%m-%d`
seconds=`date -d ${sdate} +%s`

seconds_tomorrow=$((seconds + 86400))  
edate=`date -d @$seconds_tomorrow +%Y-%m-%d`

shour=`date -d "${shour}" +%Y-%m-%d_%H`
ehour=`date -d "${ehour}" +%Y-%m-%d_%H`
shour="${shour}"":00:00"
ehour="${ehour}"":00:00"

echo ${sdate}
echo ${edate} 
echo ${shour}
echo ${ehour}
echo "$BASEDIR/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name_hour
 -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate
} ${edate} ${shour} ${ehour} ${timezone} ${etl_system}_${etl_job}"

echo 'etl_system : ' ${etl_system} >> $LOGFILE
echo 'etl_job : ' ${etl_job} >> $LOGFILE
echo 'sdate : ' ${sdate} >> $LOGFILE
echo 'edate : ' ${edate} >> $LOGFILE
echo 'shour : ' ${shour} >> $LOGFILE
echo 'ehour : ' ${ehour} >> $LOGFILE
echo 'timezone : ' ${timezone} >> $LOGFILE

echo 'exec kettle sqoop hourly job ' >> $LOGFILE
echo "/home/dwetl/kettle/data-integration/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name_hour -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate} ${edate} ${shour} ${ehour} ${timezone} ${etl_system}_${etl_job}" >> $LOGFILE
$BASEDIR/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name_hour -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate} ${edate} ${shour} ${ehour} ${timezone} ${etl_system}_${etl_job} |tee ${KETTLE_LOG_DIR}/tmp.etl.log.${etl_system}_${etl_job}
kettel_log_error=$(grep '(result=\[false\])' ${KETTLE_LOG_DIR}/tmp.etl.log.${etl_system}_${etl_job} | wc -l)
if [ $kettel_log_error = 0 ];then
exit 0
else
exit 1
fi 
