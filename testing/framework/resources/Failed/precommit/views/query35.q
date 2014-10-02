create view v1 as select * from `dfs/parquet/rankings`;
select table_catalog, view_schema, view_name from INFORMATION_SCHEMA.VIEWS;
drop view v1;
