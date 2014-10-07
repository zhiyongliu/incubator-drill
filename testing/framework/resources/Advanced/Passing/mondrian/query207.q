select store.store_country as c0, time_by_day.the_year as c1, product.product_name as c2, promotion.promotion_name as c3, customer.gender as c4, sum(sales_fact_1997.unit_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, product as product, promotion as promotion, customer as customer where sales_fact_1997.store_id = store.store_id and store.store_country = 'USA' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_name = 'American Pimento Loaf' and sales_fact_1997.promotion_id = promotion.promotion_id and promotion.promotion_name = 'You Save Days' and sales_fact_1997.customer_id = customer.customer_id and customer.gender = 'F' group by store.store_country, time_by_day.the_year, product.product_name, promotion.promotion_name, customer.gender;
