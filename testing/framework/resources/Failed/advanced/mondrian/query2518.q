select store.store_country as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, time_by_day.month_of_year as c3, product_class.product_family as c4, sum(inventory_fact_1997.warehouse_sales) as m0 from store as store, inventory_fact_1997 as inventory_fact_1997, time_by_day as time_by_day, product_class as product_class, product as product where inventory_fact_1997.store_id = store.store_id and store.store_country = 'USA' and inventory_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and inventory_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Food' group by store.store_country, time_by_day.the_year, time_by_day.quarter, time_by_day.month_of_year, product_class.product_family;