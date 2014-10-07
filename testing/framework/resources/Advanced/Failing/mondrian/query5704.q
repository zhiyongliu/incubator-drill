select store.store_type as c0, sum(store.grocery_sqft) as m0 from store as store group by store.store_type;
