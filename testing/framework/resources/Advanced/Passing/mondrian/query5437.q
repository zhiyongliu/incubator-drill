select store.store_state as c0, store.store_city as c1, time_by_day.the_year as c2, sum(sales_fact_1997.store_cost) as m0, count(sales_fact_1997.product_id) as m1 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where sales_fact_1997.store_id = store.store_id and store.store_state = 'OR' and store.store_city in ('Portland', 'Salem') and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 group by store.store_state, store.store_city, time_by_day.the_year;
