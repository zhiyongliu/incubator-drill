#!/bin/bash
. src/main/resources/drillTestConfig.properties

IFS=',' read -ra ADDR <<< "$DRILLBITS"
for i in "${ADDR[@]}"; do
  scp -r resources/Datasources/udfs/drill-udfs-1.0-SNAPSHOT* $i:$DRILL_HOME/jars/3rdparty
done    

resources/bin/drill-restart.sh
sleep 60


#listVar="10.10.104.80 10.10.104.81 10.10.104.82 10.10.104.83 10.10.104.85 10.10.104.86 10.10.104.87 10.10.104.88";
#for i in $listVar; do
 # echo == $i;
 # scp -r Datasources/udfs/drill-udfs-1.0-SNAPSHOT* $i:/opt/mapr/drill/drill-0.5.0/jars/3rdparty/
#done
