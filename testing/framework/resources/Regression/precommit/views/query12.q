create view v1 as select * from `dfs/parquet/rankings`;
create view v2 as select * from `dfs/parquet/uservisits`;
select * from v1 inner join v2 on v1.pageURL = v2.destinationURL;
drop view v1;
drop view v2;
