select store.store_type as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, customer.education as c3, sum(sales_fact_1997.unit_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, customer as customer where sales_fact_1997.store_id = store.store_id and sales_fact_1997.time_id = time_by_day.time_id and sales_fact_1997.customer_id = customer.customer_id and customer.education = 'Graduate Degree' group by store.store_type, time_by_day.the_year, time_by_day.quarter, customer.education;
