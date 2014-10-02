select customer.country as c0, region_2.sales_region as c1, sum(sales_fact_1997.unit_sales) as m0 from customer as customer, sales_fact_1997 as sales_fact_1997, region as region_2, customer as customer_1 where sales_fact_1997.store_id = customer.customer_id and customer.country = 'Mexico' and sales_fact_1997.customer_id = customer_1.customer_id and customer_1.customer_region_id = region_2.region_id and region_2.sales_region = 'South West' group by customer.country, region_2.sales_region;
