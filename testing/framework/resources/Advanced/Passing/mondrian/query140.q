select store.store_type as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, time_by_day.month_of_year as c3, sum(inventory_fact_1997.units_shipped) as m0, sum(inventory_fact_1997.units_ordered) as m1 from store as store, inventory_fact_1997 as inventory_fact_1997, time_by_day as time_by_day where inventory_fact_1997.store_id = store.store_id and inventory_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter = 'Q4' and time_by_day.month_of_year = 12 group by store.store_type, time_by_day.the_year, time_by_day.quarter, time_by_day.month_of_year;
