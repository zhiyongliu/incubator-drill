select customer.country as c0, customer.state_province as c1 from customer as customer, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, product_class as product_class, product as product where sales_fact_1997.customer_id = customer.customer_id and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Food' and product_class.product_department = 'Canned Foods' and product_class.product_category = 'Canned Shrimp' group by customer.country, customer.state_province having (sum(sales_fact_1997.unit_sales) > 0) order by customer.country ASC NULLS LAST, customer.state_province ASC NULLS LAST;
