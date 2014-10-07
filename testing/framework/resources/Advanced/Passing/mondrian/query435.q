select time_by_day.the_year as c0, product_class.product_family as c1, product_class.product_department as c2, customer.state_province as c3, customer.city as c4, customer.gender as c5, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, product_class as product_class, product as product, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Drink' and product_class.product_department in ('Alcoholic Beverages', 'Beverages') and sales_fact_1997.customer_id = customer.customer_id and customer.state_province = 'CA' and customer.city = 'San Francisco' and customer.gender = 'F' group by time_by_day.the_year, product_class.product_family, product_class.product_department, customer.state_province, customer.city, customer.gender;
