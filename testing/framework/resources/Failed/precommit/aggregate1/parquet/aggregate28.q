select sum(cast(ss_quantity as int) * cast(ss_list_price as float)) as sales, count(ss_item_sk) as items from store_sales;
