create view v1 as select columns[0] as c1, columns[1] as c2, columns[2] as c3 from `dfs/text/rankings`;
select count(*) from v1;
drop view v1;
