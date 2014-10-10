#!/bin/sh

# MapR Sandbox with Apache Drill. 
# Script modified for Internal QA Automation Framework (by Abhishek Girish <agirish@mapr.com> 

hadoop fs -test -e /sandbox/data
OUT=$?

echo $OUT

if [ $OUT -eq 0 ]; then
    hadoop fs -ls /sandbox/data
else
    hadoop fs -mkdir /sandbox
    hadoop fs -mkdir /sandbox/data
    hadoop fs -copyFromLocal resources/Datasources/sandbox/data/* /sandbox/data
fi

hadoop fs -chmod -R 777 /sandbox/data
