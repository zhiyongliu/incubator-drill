select store.store_state as c0, time_by_day.the_year as c1, customer.state_province as c2, sum(sales_fact_1997.store_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, customer as customer where sales_fact_1997.store_id = store.store_id and store.store_state = 'CA' and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.customer_id = customer.customer_id and customer.state_province = 'CA' group by store.store_state, time_by_day.the_year, customer.state_province;
