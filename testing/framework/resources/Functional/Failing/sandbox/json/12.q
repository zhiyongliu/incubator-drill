create table product_search as select o.cust_id, o.order_total, t.trans_info.prod_id[0] as prod_id from hive.orders as o, `clicks/clicks.json` t where o.cust_id=t.user_info.cust_id and o.order_total > (select avg(inord.order_total) from hive.orders inord where inord.state = o.state);

select count(*) from product_search;
