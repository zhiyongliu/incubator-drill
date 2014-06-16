alter session set `planner.enable_hashagg` = false;
alter session set `planner.enable_multiphase_agg` = false;
select avg(c_int), avg(c_bigint), avg(c_float4), avg(c_float8) from data;
alter session set `planner.enable_multiphase_agg` = true;
alter session set `planner.enable_hashagg` = true;
