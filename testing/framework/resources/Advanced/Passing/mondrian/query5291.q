select store.store_state as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, product_class.product_family as c3, customer.gender as c4, sum(sales_fact_1997.store_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, product_class as product_class, product as product, customer as customer where sales_fact_1997.store_id = store.store_id and store.store_state = 'OR' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q1' and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Drink' and sales_fact_1997.customer_id = customer.customer_id group by store.store_state, time_by_day.the_year, time_by_day.quarter, product_class.product_family, customer.gender;
