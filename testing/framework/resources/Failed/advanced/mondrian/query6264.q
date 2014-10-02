select customer.country as c0, customer.state_province as c1, customer.city as c2, customer.customer_id as c3, fullname as c4, fullname as c5, customer.gender as c6, customer.marital_status as c7, customer.education as c8, customer.yearly_income as c9 from customer as customer, sales_fact_1997 as sales_fact_1997, store as store, time_by_day as time_by_day, product as product where sales_fact_1997.customer_id = customer.customer_id and sales_fact_1997.store_id = store.store_id and store.store_name = 'Store 14' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q1' and time_by_day.month_of_year = 1 and sales_fact_1997.product_id = product.product_id and product.brand_name = 'Modell' group by customer.country, customer.state_province, customer.city, customer.customer_id, fullname, customer.gender, customer.marital_status, customer.education, customer.yearly_income order by customer.country ASC NULLS LAST, customer.state_province ASC NULLS LAST, customer.city ASC NULLS LAST, fullname ASC NULLS LAST;
