create view v1 as select cast(adRevenue as int) adRevenueInt from `dfs/parquet/uservisits`;
select * from v1;
drop view v1;
