select count(*) as c0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, product_class as product_class, product as product, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Drink' and product_class.product_department = 'Beverages' and product_class.product_category = 'Pure Juice Beverages' and product_class.product_subcategory = 'Juice' and sales_fact_1997.customer_id = customer.customer_id and customer.state_province = 'CA' and customer.city = 'Concord';
