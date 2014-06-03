<<<<<<< HEAD
create view v1 as select rankings.pageRank pageRank, rankings.pageURL pageURL, uservisits.destinationURL destinationURL from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
=======
create view v1 as select rankings.pageRank pageRank, rankings.pageURL pageURL uservisits.destinationURL destinationURL from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
>>>>>>> abc8a0033b3d4d035a2f45778b8e7c6bc534c1ed
select v1.pageRank, pages.url, pages.description from v1 inner join hive.pages pages on v1.pageURL = pages.url;
drop view v1;
