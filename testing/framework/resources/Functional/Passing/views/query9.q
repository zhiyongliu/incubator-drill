create view v1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageRank, count(*) from v1 group by pageRank;
drop view v1;
