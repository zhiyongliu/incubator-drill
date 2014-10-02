select store_region.sales_region as c0, customer_region.sales_region as c1, sum(sales_fact_1997.unit_sales) as m0 from region as store_region, store as store, sales_fact_1997 as sales_fact_1997, region as customer_region, customer as customer where sales_fact_1997.store_id = store.store_id and store.region_id = store_region.region_id and store_region.sales_region = 'South West' and sales_fact_1997.customer_id = customer.customer_id and customer.customer_region_id = customer_region.region_id and customer_region.sales_region = 'South West' group by store_region.sales_region, customer_region.sales_region;
