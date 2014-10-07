create view customer as select cast(columns[0] as int) c_custkey, columns[1] c_name, columns[2] c_address, cast(columns[3] as int) c_nationkey, columns[4] c_phone, cast(columns[5] as double) c_acctbal, columns[6] c_mktsegment, columns[7] c_comment from `customer_text`;
select count(*) from customer;
drop view customer;
