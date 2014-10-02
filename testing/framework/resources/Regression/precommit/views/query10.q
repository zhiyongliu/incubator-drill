create view v1 as select pageRank a, pageURL b, avgDuration c from `dfs/parquet/rankings`;
select a, b, c from v1;
drop view v1;
