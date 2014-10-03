#!/bin/sh

hadoop fs -test -e /sandbox/flat
OUT=$?

echo $OUT

if [ $OUT -eq 0 ]; then
    hadoop fs -ls /sandbox/flat
else

hadoop fs -mkdir /sandbox/flat

hadoop fs -cp /sandbox/data/flat/logs /sandbox/flat/

hadoop fs -ls /sandbox/flat

fi
