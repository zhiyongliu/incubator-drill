create view v1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageURL from v1;
drop view v1;
