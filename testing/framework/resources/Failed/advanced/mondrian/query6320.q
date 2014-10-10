select customer.country as c0, customer.state_province as c1, customer.city as c2, customer.customer_id as c3, fullname as c4, fullname as c5, customer.gender as c6, customer.marital_status as c7, customer.education as c8, customer.yearly_income as c9, product.brand_name as c10, product.product_name as c11, promotion.promotion_name as c12 from customer as customer, sales_fact_1997 as sales_fact_1997, product as product, promotion as promotion, store as store, time_by_day as time_by_day where sales_fact_1997.customer_id = customer.customer_id and sales_fact_1997.product_id = product.product_id and sales_fact_1997.promotion_id = promotion.promotion_id and sales_fact_1997.store_id = store.store_id and store.store_name = 'Store 14' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q1' and time_by_day.month_of_year = 1 and (product.product_name in ('Kiwi Scallops', 'Fast Avocado Dip', 'High Top Lemons', 'Moms Sliced Turkey', 'High Top Cauliflower', 'Sphinx Bagels')) group by customer.country, customer.state_province, customer.city, customer.customer_id, fullname, customer.gender, customer.marital_status, customer.education, customer.yearly_income, product.brand_name, product.product_name, promotion.promotion_name order by customer.country ASC NULLS LAST, customer.state_province ASC NULLS LAST, customer.city ASC NULLS LAST, fullname ASC NULLS LAST, product.brand_name ASC NULLS LAST, product.product_name ASC NULLS LAST, promotion.promotion_name ASC NULLS LAST;