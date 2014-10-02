select time_by_day.the_year as c0, time_by_day.quarter as c1, customer.education as c2 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and sales_fact_1997.customer_id = customer.customer_id and ((time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q2', 'Q3', 'Q4')) or (time_by_day.the_year = 1998 and time_by_day.quarter = 'Q1')) group by time_by_day.the_year, time_by_day.quarter, customer.education order by time_by_day.the_year ASC NULLS LAST, time_by_day.quarter ASC NULLS LAST, customer.education ASC NULLS LAST;
