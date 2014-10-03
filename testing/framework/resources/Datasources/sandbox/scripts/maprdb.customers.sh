#!/bin/sh

# MapR Sandbox with Apache Drill. 
# Script modified for Internal QA Automation Framework (by Abhishek Girish <agirish@mapr.com>

# Set HBase env
HBVERSION=$( cat /opt/mapr/hbase/hbaseversion )
export HBASE_HOME=/opt/mapr/hbase/hbase-${HBVERSION}

# Set table name and path
TABLENAME="customers"
TABLEPATH=/sandbox/maprdb/${TABLENAME}

# Disable and Drop table via HBase shell
echo 'disable '"'${TABLEPATH}'"'; drop '"'${TABLEPATH}'"'' | hbase shell

# Create table and column families
maprcli table create -path ${TABLEPATH} -defaultreadperm 'g:mapr | g:root' -defaultwriteperm 'g:mapr | g:root' -defaultappendperm 'g:mapr | g:root'
maprcli table cf create -path ${TABLEPATH} -cfname personal
maprcli table cf create -path ${TABLEPATH} -cfname address
maprcli table cf create -path ${TABLEPATH} -cfname loyalty

# Set permissions
/usr/bin/hadoop fs -chmod 777 ${TABLEPATH}

# Import data
hadoop jar $HBASE_HOME/hbase-0.94.21-mapr-1407-SNAPSHOT.jar \
        importtsv -Dimporttsv.separator=, \
        -Dimporttsv.columns=HBASE_ROW_KEY,personal:name,address:state,personal:gender,personal:age,loyalty:agg_rev,loyalty:membership\
        ${TABLEPATH} \
        /sandbox/data/customers.all.csv
