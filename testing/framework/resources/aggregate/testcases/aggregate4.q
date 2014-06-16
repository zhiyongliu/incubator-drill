alter session set `planner.enable_multiphase_agg` = false;
alter session set `planner.enable_streamagg` = false;
select cast(c_groupby as varchar(5)), sum(c_int), sum(c_bigint), sum(c_float4), sum(c_float8) from data group by c_groupby;
alter session set `planner.enable_streamagg` = true;
alter session set `planner.enable_multiphase_agg` = true;
