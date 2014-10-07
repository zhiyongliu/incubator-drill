select time_by_day.the_year as c0, time_by_day.quarter as c1, customer.account_num as c2, store.store_number as c3, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, customer as customer, store as store where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q4' and sales_fact_1997.customer_id = customer.customer_id and sales_fact_1997.store_id = store.store_id and store.store_number = 23 group by time_by_day.the_year, time_by_day.quarter, customer.account_num, store.store_number;
