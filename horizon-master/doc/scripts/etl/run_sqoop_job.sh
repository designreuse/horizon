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
edate=$3
timezone='PST8PDT'

if [ ! ${etl_system} ]; then
        etl_system='test'
fi

if [ ! ${etl_job} ]; then
        etl_job='test'
fi

if [ ! ${edate} ]; then
        edate=`date +%Y-%m-%d`
fi

edate=`date -d ${edate} +%Y-%m-%d`

seconds=`date -d ${edate} +%s`

seconds_yesterday=$((seconds - 86400))  
sdate=`date -d @$seconds_yesterday +%Y-%m-%d`

echo 'etl_system : ' ${etl_system} >> $LOGFILE
echo 'etl_job : ' ${etl_job} >> $LOGFILE
echo 'sdate : ' ${sdate} >> $LOGFILE
echo 'edate : ' ${edate} >> $LOGFILE
echo 'timezone : ' ${timezone} >> $LOGFILE

echo 'exec kettle sqoop job ' >> $LOGFILE
echo "$BASEDIR/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate} ${edate} ${timezone} ${etl_system}_${etl_job} "
echo "$BASEDIR/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate} ${edate} ${timezone} ${etl_system}_${etl_job} " >> $LOGFILE
$BASEDIR/kitchen.sh -rep:DW_ETL -dir:/sqp_exec -job:jb_exec_sqp_job_by_name -level:Debug -log:${KETTLE_LOG_DIR}/etl.log.${etl_system}_${etl_job}.${today} ${sdate} ${edate} ${timezone} ${etl_system}_${etl_job} |tee ${KETTLE_LOG_DIR}/tmp.etl.log.${etl_system}_${etl_job}
kettel_log_error=$(grep '(result=\[false\])' ${KETTLE_LOG_DIR}/tmp.etl.log.${etl_system}_${etl_job} | wc -l)
if [ $kettel_log_error = 0 ];then
exit 0
else
exit 1
fi
