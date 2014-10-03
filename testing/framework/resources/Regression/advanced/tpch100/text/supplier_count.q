create view supplier as select cast(columns[0] as int) s_suppkey, columns[1] s_name, columns[2] s_address, cast(columns[3] as int) s_nationkey, columns[4] s_phone, cast(columns[5] as double) s_acctbal, columns[6] s_comment from `supplier_text`;
select count(*) from supplier;
drop view supplier;
