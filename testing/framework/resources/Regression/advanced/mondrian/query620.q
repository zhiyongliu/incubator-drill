select time_by_day.quarter as c0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997 where sales_fact_1997.time_id = time_by_day.time_id group by time_by_day.quarter order by time_by_day.quarter ASC NULLS LAST;
