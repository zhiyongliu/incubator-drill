select cast(name as varchar(30)), cast(create_time as timestamp) create_time from student where cast(create_time as timestamp) = date '2014-05-31'
