alter session set `planner.enable_streamagg` = false;
select count(distinct ps.ps_suppkey) as supplier_cnt 
  from partsupp ps;
alter session set `planner.enable_streamagg` = true;
