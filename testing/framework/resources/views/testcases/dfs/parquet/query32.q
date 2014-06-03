create view dfs.drillTestDirAmplab.v1 as select pageRank, pageURL, avgDuration from `/drill/testdata/views/dfs/parquet/rankings`;
create view v2 as select  sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode, searchWord, duration from `dfs/parquet/uservisits`;
select count(*) from dfs.drillTestDirAmplab.v1 v1  inner join v2 on v1.pageURL = v2.destinationURL;
drop view dfs.drillTestDirAmplab.v1;
drop view v2;
