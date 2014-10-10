#!/bin/bash

set -x

hadoop fs -rm -r /test/tables
hadoop fs -mkdir /test/tables

export PIG_HOME=/opt/mapr/pig/pig-0.12/

user=`ps -aef | grep Drillbit | cut -d' ' -f1 | head -1`
if [ "$user" == "root" ]
then
   resources/Datasources/M7/createM7Tables.sh
else
   su mapr resources/Datasources/M7/createM7Tables.sh
fi

pig resources/Datasources/M7/loadM7Tables.pig 

set +x
