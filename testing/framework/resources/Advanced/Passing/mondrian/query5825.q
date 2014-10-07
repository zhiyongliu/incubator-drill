select region.sales_region as c0, region_1.sales_region as c1, sum(sales_fact_1997.unit_sales) as m0 from region as region, store as store, sales_fact_1997 as sales_fact_1997, region as region_1, customer as customer where sales_fact_1997.store_id = store.store_id and store.region_id = region.region_id and region.sales_region = 'South West' and sales_fact_1997.customer_id = customer.customer_id and customer.customer_region_id = region_1.region_id and region_1.sales_region = 'South West' group by region.sales_region, region_1.sales_region;
