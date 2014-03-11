#!/bin/bash

usage() {
  echo 'usage:'
  echo '    runtests.sh testCategory testDefSource [testGroups]'
  echo ''
  echo '  Valid values for testCategory:'
  echo '      commandlinePositiveTests'
  echo '      commandlineNegativeTests'
  echo '      submitPlanPositveTests'
  echo '      submitPlanNegtveTests'
  echo '      jdbcPositiveTests'
  echo '      jdbcNegativeTests'
  echo ''
  echo '  testDefSource - test definition file/directory.  Examples:'
  echo '      basic_query/testcases/select/select.json'
  echo '      /root/basic_query/testcases/select/select.json'
  echo ''
  echo '  testGroups - optional.  When not specified, all test groups will be executed.  Examples:'
  echo '      smoke'
  echo '      smoke,regression'
  exit
}

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]
then
  usage
fi

COMMAND="mvn clean test -Dtest=org.apache.drill.test.drilltests.DrillTestsMapRCluster#$1 -Dtest.def.sources=$2"

if [ "$#" -eq 2 ]
then
  $COMMAND
else
  $COMMAND "-Dtest.groups=$3"
fi
