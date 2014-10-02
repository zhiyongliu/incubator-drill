create view v1 as select voter_id,name,age,registration,contributions,voterzone,create_time from `hive.default`.voter;
select count(*) from v1;
drop view v1;
