select store.store_state as c0, store.store_country as c1 from store as store where UPPER(store.store_state) = UPPER('OR') group by store.store_state, store.store_country order by store.store_state ASC NULLS LAST;
