select warehouse.warehouse_fax as c0 from warehouse as warehouse where (warehouse.wa_address2 is null and warehouse.wa_address3 is null) and warehouse.warehouse_fax is null group by warehouse.warehouse_fax order by warehouse.warehouse_fax ASC NULLS LAST;
