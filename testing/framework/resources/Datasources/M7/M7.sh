#!/bin/bash

set -x

export PIG_HOME=/opt/mapr/pig/pig-0.12/

su mapr resources/Datasources/M7/createM7Tables.sh
wait
su mapr pig resources/Datasources/M7/loadM7Tables.pig 

set +x
