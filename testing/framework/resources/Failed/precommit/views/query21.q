create view v1 as select uservisits.sourceIP, uservisits.destinationURL, uservisits.visitDate, uservisits.adRevenue, uservisits.userAgent, uservisits.countryCode, uservisits.languageCode, uservisits.searchWord, uservisits.duration, rankings.pageRank, rankings.pageURL, rankings.avgDuration from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select * from v1;
drop view v1;
