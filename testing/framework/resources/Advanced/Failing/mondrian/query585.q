select store.store_sqft as c0 from store as store where store.store_sqft is null group by store.store_sqft order by store.store_sqft ASC NULLS LAST;
