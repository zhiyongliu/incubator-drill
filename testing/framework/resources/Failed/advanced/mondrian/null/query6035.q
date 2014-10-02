select warehouse.warehouse_fax as c0 from warehouse as warehouse where warehouse.warehouse_fax is null group by warehouse.warehouse_fax order by warehouse.warehouse_fax ASC NULLS LAST;
