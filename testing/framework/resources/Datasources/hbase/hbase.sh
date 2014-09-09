#!/bin/bash

set -x

/root/incubator-drill/testing/framework/resources/Datasources/hbase/createHbaseTables.sh
wait
pig /root/incubator-drill/testing/framework/resources/Datasources/hbase/loadHbaseTables.pig 

set +x
