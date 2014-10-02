create view v1 as select pageRank , max(avgDuration) maxDuration from `dfs/parquet/rankings` group by pageRank;
select pageRank, maxDuration+4 from v1;
drop view v1;
