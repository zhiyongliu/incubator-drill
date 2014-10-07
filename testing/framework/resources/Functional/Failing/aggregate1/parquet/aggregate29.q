select sum(cast(ss_quantity as int) * cast(ss_list_price as float)) as sales, sum(cast(ss_net_profit as float)) as profit from store_sales;
