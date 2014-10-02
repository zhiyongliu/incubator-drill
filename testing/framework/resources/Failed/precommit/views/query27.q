create view v1 as select * from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select pageRank, pageURL, avgDuration, sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode, searchWord, duration  from v1;
drop view v1;
