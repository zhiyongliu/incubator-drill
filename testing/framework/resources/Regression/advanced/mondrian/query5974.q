select store_1.store_name as c0, time_by_day.the_year as c1, sum(inventory.unit_sales) as m0 from store as store_1, sales_fact_1997 as inventory, time_by_day as time_by_day where inventory.product_id = store_1.store_id and store_1.store_name = 'Store 11' and inventory.time_id = time_by_day.time_id and time_by_day.the_year = 1997 group by store_1.store_name, time_by_day.the_year;
