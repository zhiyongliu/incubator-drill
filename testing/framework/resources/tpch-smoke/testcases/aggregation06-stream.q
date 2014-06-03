alter session set `planner.enable_hashagg` = false;
select count(distinct ps.ps_suppkey) as supplier_cnt
  from partsupp ps
group by ps_partkey
order by ps_partkey limit 5;
alter session set `planner.enable_hashagg` = true;
