alter session set `planner.enable_mergejoin` = false;
select o.O_TOTALPRICE, c.C_NAME
   from orders o, customer c
   where c.C_CUSTKEY = c.C_CUSTKEY and o.O_TOTALPRICE > 400000.00
   order by o.O_TOTALPRICE;
alter session set `planner.enable_mergejoin` = true;
