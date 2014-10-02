select store.store_state as c0, time_by_day.the_year as c1, sum(sales_fact_1997.store_sales) as m0, count(sales_fact_1997.product_id) as m1 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where sales_fact_1997.store_id = store.store_id and store.store_state in ('CA', 'OR', 'WA') and sales_fact_1997.time_id = time_by_day.time_id group by store.store_state, time_by_day.the_year;
