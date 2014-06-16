alter session set `planner.enable_hashagg` = false;
select cast(c_groupby as varchar(5)), min(c_int), min(c_bigint), min(c_float4), min(c_float8) from data group by c_groupby;
alter session set `planner.enable_hashagg` = true;
