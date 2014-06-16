alter session set `planner.enable_streamagg` = false;
select count(distinct(c_int)), count(distinct(c_bigint)), count(distinct(c_float4)), count(distinct(c_float8)) from data;
alter session set `planner.enable_streamagg` = true;
