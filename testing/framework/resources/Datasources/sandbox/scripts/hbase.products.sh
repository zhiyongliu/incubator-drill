#!/usr/bin/bash

HBVERSION=$( cat /opt/mapr/hbase/hbaseversion )

export HBASE_HOME=/opt/mapr/hbase/hbase-${HBVERSION}
TABLENAME="products"

#first delete table via hbase shell
echo 'disable '"'${TABLENAME}'"'' | hbase shell

echo 'drop '"'${TABLENAME}'"'' | hbase shell

#create table + 2 CF's
echo 'create '"'${TABLENAME}'"',"details","pricing"' | hbase shell

# Import 
hadoop jar $HBASE_HOME/hbase-0.94.21-mapr-1407-SNAPSHOT.jar \
        importtsv -Dimporttsv.separator=, \
        -Dimporttsv.columns=HBASE_ROW_KEY,details:name,details:category,pricing:price \
        ${TABLENAME} \
        resources/sandbox/datasources/data/products/products.csv
