select store.store_state as c0, store.store_city as c1, store.store_type as c2, time_by_day.the_year as c3, sum(sales_fact_1997.unit_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where sales_fact_1997.store_id = store.store_id and store.store_state in ('CA', 'OR', 'WA') and store.store_city in ('Los Angeles', 'Portland', 'Salem', 'San Diego', 'Tacoma') and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 group by store.store_state, store.store_city, store.store_type, time_by_day.the_year;
