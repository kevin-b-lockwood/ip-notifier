#!/bin/bash
# check and send ip address to email
INTERFACE='enp3s0'
LASTIPFILE='/home/diogenes/ip-notifier/.last_ip_addr';
TIME=`date`;
ADDRESS='agentkbl@gmail.com'

LASTIP=`cat ${LASTIPFILE}`;
MYIP=`/sbin/ifconfig enp3s0 | grep -Eo 10.55.66.[0-9]\{1,3\}`;

echo ${MYIP}
if [[ ${MYIP} != ${LASTIP} ]]
then
        echo "New IP = ${MYIP}"
        echo "sending email.."
        echo -e "Timestamp = ${TIME}\nIP = ${MYIP}" | \
                /usr/bin/mail -s "[INFO] New IP" ${ADDRESS};
        echo ${MYIP} > ${LASTIPFILE};
fi
