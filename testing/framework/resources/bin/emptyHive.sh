#!/bin/sh

# The below command causes the shell to exit immediately if any command fails
set -e

hive -e 'show tables'|xargs -I '{}' hive -e 'drop table {}'
