create view v1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
create view v2 as select sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode, searchWord, duration from `dfs/parquet/uservisits`;
select v1.avgDuration from v1 inner join v2 on v1.pageURL = v2.destinationURL;
drop view v1;
drop view v2;
