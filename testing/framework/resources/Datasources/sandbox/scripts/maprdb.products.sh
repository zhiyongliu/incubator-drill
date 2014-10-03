#!/bin/sh

# MapR Sandbox with Apache Drill. 
# Script modified for Internal QA Automation Framework (by Abhishek Girish <agirish@mapr.com>

# Table name and path
TABLENAME="products"
TABLEPATH=/sandbox/maprdb/${TABLENAME}

# Disable and Drop table via hbase shell
echo 'disable '"'${TABLEPATH}'"'; drop '"'${TABLEPATH}'"'' | hbase shell

# Create table and column families
maprcli table create -path ${TABLEPATH} -defaultreadperm 'g:mapr | g:root' -defaultwriteperm 'g:mapr | g:root' -defaultappendperm 'g:mapr | g:root' 
maprcli table cf create -path ${TABLEPATH} -cfname details 
maprcli table cf create -path ${TABLEPATH} -cfname pricing 

# Set permissions
/usr/bin/hadoop fs -chmod 777 ${TABLEPATH}

# Set HBase env
HBVERSION=$( cat /opt/mapr/hbase/hbaseversion )
export HBASE_HOME=/opt/mapr/hbase/hbase-${HBVERSION}

# Import
hadoop jar $HBASE_HOME/hbase-0.94.21-mapr-1407-SNAPSHOT.jar \
        importtsv -Dimporttsv.separator=, \
        -Dimporttsv.columns=HBASE_ROW_KEY,details:name,details:category,pricing:price \
        ${TABLEPATH} \
        /sandbox/data/products/products.csv

