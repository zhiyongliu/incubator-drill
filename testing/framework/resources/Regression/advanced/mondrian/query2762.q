select store.store_country as c0, store.store_state as c1, store.store_city as c2 from store as store, sales_fact_1997 as sales_fact_1997 where sales_fact_1997.store_id = store.store_id and store.store_country = 'USA' and store.store_state = 'CA' and store.store_city in ('Alameda', 'Beverly Hills', 'Los Angeles', 'San Diego', 'San Francisco') and store.store_name in ('HQ', 'Store 6', 'Store 7', 'Store 24', 'Store 14') group by store.store_country, store.store_state, store.store_city order by store.store_country ASC NULLS LAST, store.store_state ASC NULLS LAST, store.store_city ASC NULLS LAST;
