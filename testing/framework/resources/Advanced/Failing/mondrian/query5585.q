select store.store_type as c0, store.store_country as c1, sum(store.store_sqft) as m0 from store as store group by store.store_type, store.store_country;
