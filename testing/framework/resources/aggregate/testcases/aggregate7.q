alter session set `planner.enable_hashagg` = false;
select sum(distinct(c_int)), sum(distinct(c_bigint)), sum(distinct(c_float4)), sum(distinct(c_float8)) from data;
alter session set `planner.enable_hashagg` = true;
