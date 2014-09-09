#!/bin/bash

# The below command causes the shell to exit immediately if any command fails
set -e

# run the drillTestConfig.properties file as a shell script
# drillTestConfig.properties file should have execute permissions
. src/main/resources/drillTestConfig.properties


IFS=',' read -ra ADDR <<< "$DRILLBITS"
for i in "${ADDR[@]}"; do
    echo "Restarting drillbit on $i"
    ssh "root@$i" $DRILL_HOME/bin/drillbit.sh restart
done

sleep 20
