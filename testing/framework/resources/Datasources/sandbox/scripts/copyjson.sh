#!/bin/sh

hadoop fs -test -e /sandbox/json
OUT=$?

echo $OUT

if [ $OUT -eq 0 ]; then
    hadoop fs -ls /sandbox/json
else

hadoop fs -mkdir /sandbox/json

hadoop fs -cp /sandbox/data/nested/clicks /sandbox/json/

hadoop fs -ls /sandbox/json

fi
