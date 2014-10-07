create view region as select cast(columns[0] as int) r_regionkey, columns[1] r_name, columns[2] r_comment from `region_text`;
select count(*) from region;
drop view region;
