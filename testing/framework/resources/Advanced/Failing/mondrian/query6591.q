select store.store_name as c0, sum(store.store_sqft) as m0, sum(store.grocery_sqft) as m1 from store as store group by store.store_name;
