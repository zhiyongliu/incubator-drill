create view v1 as select * from `dfs/parquet/rankings`;
create view v2 as select * from `dfs/parquet/uservisits`;
select count(*) from INFORMATION_SCHEMA.VIEWS;
drop view v1;
drop view v2;
