select store.store_state as c0 from store as store where (store.store_country = 'Mexico') and UPPER(store.store_state) = UPPER('DF') group by store.store_state order by store.store_state ASC NULLS LAST;
