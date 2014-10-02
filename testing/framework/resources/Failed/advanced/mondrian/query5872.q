select time_by_day.the_year as c0, t.big_num as c1, t.id as c2, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, (SELECT * FROM (VALUES (0, 1234, 'Ben'), (519, 1234567890123, 'Bill')) AS t (id, big_num, name)) as t where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.promotion_id = t.id group by time_by_day.the_year, t.big_num, t.id;
