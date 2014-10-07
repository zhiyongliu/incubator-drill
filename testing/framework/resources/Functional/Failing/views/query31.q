create view dfs.drillTestDirAmplab.v1 as select pageRank, pageURL, avgDuration from `/drill/testdata/views/dfs/parquet/rankings`;
select * from dfs.drillTestDirAmplab.v1;
drop view dfs.drillTestDirAmplab.v1;
