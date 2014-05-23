alter session set `planner.enable_hashjoin` = false;
select o.O_TOTALPRICE, c.C_NAME
   from orders o, customer c
   where o.C_CUSTKEY = c.C_CUSTKEY and o.O_TOTALPRICE > 400000.00
   order by o.O_TOTALPRICE;
alter session set `planner.enable_hashjoin` = true;
