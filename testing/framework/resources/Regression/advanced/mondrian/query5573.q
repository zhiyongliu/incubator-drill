select customer.education as c0, product_class.product_family as c1 from customer as customer, sales_fact_1997 as sales_fact_1997, product as product, product_class as product_class where sales_fact_1997.customer_id = customer.customer_id and product.product_class_id = product_class.product_class_id and sales_fact_1997.product_id = product.product_id and (customer.education in ('Bachelors Degree', 'Graduate Degree')) and (product_class.product_family in ('Food', 'Non-Consumable')) group by customer.education, product_class.product_family order by customer.education ASC NULLS LAST, product_class.product_family ASC NULLS LAST;
