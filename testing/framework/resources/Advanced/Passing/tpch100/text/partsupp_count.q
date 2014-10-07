create view partsupp as select cast(columns[0] as int) ps_partkey, cast(columns[1] as int) ps_suppkey, cast(columns[2] as int) ps_availqty, cast(columns[3] as double) ps_supplycost, columns[4] ps_comment from `partsupp_text`;
select count(*) from partsupp;
drop view partsupp;
