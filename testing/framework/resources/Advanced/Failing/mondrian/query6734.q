select store.store_type as c0, count(distinct (select warehouse_class.warehouse_class_id AS warehouse_class_id from warehouse_class AS warehouse_class where warehouse_class.warehouse_class_id = warehouse.warehouse_class_id and warehouse_class.description = 'Large Owned')) as m0, count(distinct (select warehouse_class.warehouse_class_id AS warehouse_class_id from warehouse_class AS warehouse_class where warehouse_class.warehouse_class_id = warehouse.warehouse_class_id and warehouse_class.description = 'Large Independent')) as m1, count((select warehouse_class.warehouse_class_id AS warehouse_class_id from warehouse_class AS warehouse_class where warehouse_class.warehouse_class_id = warehouse.warehouse_class_id and warehouse_class.description = 'Large Independent')) as m2, count(distinct store_id+warehouse_id) as m3, count(store_id+warehouse_id) as m4, count(warehouse.stores_id) as m5 from store as store, warehouse as warehouse where warehouse.stores_id = store.store_id group by store.store_type;
