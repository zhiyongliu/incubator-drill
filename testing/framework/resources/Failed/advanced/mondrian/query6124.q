select store.store_name as c0, sum(store.store_sqft) as m0 from store as store group by store.store_name;
