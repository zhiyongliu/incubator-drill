create view orders as select cast(columns[0] as int) o_orderkey, cast(columns[1] as int) o_custkey, columns[2] o_orderstatus, cast(columns[3] as double) o_totalprice, cast(columns[4] as date)o_orderdate, columns[5] o_orderpriority, columns[6] o_clerk, cast(columns[7] as int) o_shippriority, columns[8] o_comment from `orders_text`;
select count(*) from orders;
drop view orders;
