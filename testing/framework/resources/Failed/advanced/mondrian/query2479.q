select store.store_country as c0, agg_c_14_sales_fact_1997.the_year as c1, agg_c_14_sales_fact_1997.quarter as c2, agg_c_14_sales_fact_1997.month_of_year as c3, sum(agg_c_14_sales_fact_1997.unit_sales) as m0 from store as store, agg_c_14_sales_fact_1997 as agg_c_14_sales_fact_1997 where agg_c_14_sales_fact_1997.store_id = store.store_id and store.store_country = 'USA' and agg_c_14_sales_fact_1997.the_year = 1997 group by store.store_country,  agg_c_14_sales_fact_1997.the_year, agg_c_14_sales_fact_1997.quarter, agg_c_14_sales_fact_1997.month_of_year;