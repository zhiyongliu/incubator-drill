select store.store_country as c0, count(distinct sales_fact_1997.customer_id) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where sales_fact_1997.store_id = store.store_id and store.store_country = 'USA' and sales_fact_1997.time_id = time_by_day.time_id and ((time_by_day.quarter = 'Q1' and time_by_day.the_year = 1997) or (time_by_day.month_of_year = 7 and time_by_day.quarter = 'Q3' and time_by_day.the_year = 1997)) group by store.store_country;
