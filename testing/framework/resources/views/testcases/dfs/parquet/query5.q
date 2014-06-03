create view v1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select count(*) from v1;
drop view v1;
