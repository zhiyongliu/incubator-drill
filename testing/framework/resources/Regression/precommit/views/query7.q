create view v1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageRank, pageURL, avgDuration from v1;
drop view v1;
