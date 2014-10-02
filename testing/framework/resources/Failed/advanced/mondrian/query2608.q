select store.store_sqft as c0, store.store_type as c1, time_by_day.the_year as c2, product_class.product_family as c3, sum(inventory_fact_1997.store_invoice) as m0 from store as store, inventory_fact_1997 as inventory_fact_1997, time_by_day as time_by_day, product_class as product_class, product as product where inventory_fact_1997.store_id = store.store_id and store.store_sqft = 20319 and store.store_type = 'Supermarket' and inventory_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and inventory_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Food' group by store.store_sqft, store.store_type, time_by_day.the_year, product_class.product_family;
