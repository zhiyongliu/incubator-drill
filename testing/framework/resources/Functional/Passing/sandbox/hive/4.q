select `month`, state, sum(order_total) as sales from orders group by `month`, state
order by 3 desc limit 20;
