#!/bin/sh

# MapR Sandbox with Apache Drill. 
# Script modified for Internal QA Automation Framework (by Abhishek Girish <agirish@mapr.com>

# Table name and path
TABLENAME="embeddedclicks"
TABLEPATH=/sandbox/maprdb/${TABLENAME}

# Disable and drop table
echo 'disable '"'${TABLEPATH}'"'; drop '"'${TABLEPATH}'"'' | hbase shell

# Create table and column family
maprcli table create -path ${TABLEPATH} -defaultreadperm 'g:mapr | g:root' -defaultwriteperm 'g:mapr | g:root' -defaultappendperm 'g:mapr | g:root' 
maprcli table cf create -path ${TABLEPATH} -cfname blob 

# Set permissions
/usr/bin/hadoop fs -chmod 777 ${TABLEPATH}

# Set HBase env
HBVERSION=$( cat /opt/mapr/hbase/hbaseversion )

# Import data
cat resources/sandbox/datasources/scripts/embedded.input.txt | /usr/bin/hbase shell
