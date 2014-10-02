select store.store_country as c0, time_by_day.the_year as c1, sum(inventory_fact_1997.units_shipped) as m0 from store as store, inventory_fact_1997 as inventory_fact_1997, time_by_day as time_by_day where inventory_fact_1997.store_id = store.store_id and inventory_fact_1997.time_id = time_by_day.time_id group by store.store_country, time_by_day.the_year;
