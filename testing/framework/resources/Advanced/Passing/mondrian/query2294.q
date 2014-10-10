select store.store_city as c0 from employee as employee, store as store where employee.store_id = store.store_id and (store.store_state = 'OR') group by store.store_city order by store.store_city ASC NULLS LAST;