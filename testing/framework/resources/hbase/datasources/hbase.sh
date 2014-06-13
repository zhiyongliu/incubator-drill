#!/bin/bash

set -x

/root/incubator-drill/testing/framework/resources/hbase/datasources/createHbaseTables.sh
wait
pig /root/incubator-drill/testing/framework/resources/hbase/datasources/loadHbaseTables.pig 

set +x
