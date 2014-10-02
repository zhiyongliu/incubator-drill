select time_by_day.the_year as c0, time_by_day.quarter as c1, promotion.media_type as c2, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, promotion as promotion where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q2' and sales_fact_1997.promotion_id = promotion.promotion_id group by time_by_day.the_year, time_by_day.quarter, promotion.media_type;
