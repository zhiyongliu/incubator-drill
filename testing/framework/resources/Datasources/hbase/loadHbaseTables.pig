register /opt/mapr/hbase/hbase-0.94.17/lib/zookeeper-3.4.5-mapr-1406.jar;
register /opt/mapr/hbase/hbase-0.94.17/hbase-0.94.17-mapr-1405.jar;
register /opt/mapr/hbase/hbase-0.94.17/lib/guava-11.0.2.jar;

A = LOAD '/drill/testdata/hbase/votertab' AS (id,name,age,registration,contributions,voterzone,create_date);
B = LOAD '/drill/testdata/hbase/studenttab' AS (id,name,age,gpa,studentnum,create_date);

STORE A INTO 'voter' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('onecf:name twocf:age twocf:registration threecf:contributions threecf:voterzone fourcf:create_date');
STORE B INTO 'student' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('onecf:name twocf:age threecf:gpa fourcf:studentnum fivecf:create_date');
