create view v1 as select * from `dfs/parquet/rankings`;
select * from v1;
drop view v1;
