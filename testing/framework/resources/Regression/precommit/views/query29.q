create view v1 as select rankings.pageRank pageRank, rankings.pageURL pageURL, uservisits.destinationURL destinationURL from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select v1.pageRank, pages.url, pages.description from v1 inner join hive.pages pages on v1.pageURL = pages.url;
drop view v1;
