select customer.country as c0, customer.state_province as c1, promotion.promotion_name as c2 from customer as customer, sales_fact_1997 as sales_fact_1997, promotion as promotion, store as store, time_by_day as time_by_day where sales_fact_1997.customer_id = customer.customer_id and sales_fact_1997.promotion_id = promotion.promotion_id and sales_fact_1997.store_id = store.store_id and store.store_name = 'Store 14' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q1' and time_by_day.month_of_year = 1 and (customer.country = 'USA') group by customer.country, customer.state_province, promotion.promotion_name order by (((3 * sum(sales_fact_1997.store_sales)))  - 100) DESC NULLS LAST, customer.country ASC NULLS LAST, customer.state_province ASC NULLS LAST, promotion.promotion_name ASC NULLS LAST;
