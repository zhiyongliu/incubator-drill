select o1.cust_id, sum(o1.order_total) as ny_sales,
(select sum(o2.order_total) from hive.orders o2
where o1.cust_id=o2.cust_id and state='ca') as ca_sales
from hive.orders o1 where o1.state='ny' group by o1.cust_id
order by cust_id limit 20;
