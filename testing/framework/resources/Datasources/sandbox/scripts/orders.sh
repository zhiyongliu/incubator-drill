#!/bin/sh

# MapR Sandbox with Apache Drill. 
# Script modified for Internal QA Automation Framework (by Abhishek Girish <agirish@mapr.com>

# Drop table
/usr/bin/hive -e "drop table orders;"

# Create table
/usr/bin/hive -f resources/Datasources/sandbox/scripts/orders.hive.hql
