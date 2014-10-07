create view part as select cast(columns[0] as int) p_partkey, columns[1] p_name, columns[2] p_mfgr, columns[3] p_brand, columns[4] p_type, cast(columns[5] as int) p_size, columns[6] p_container, cast(columns[7] as double) p_retailprice, columns[8] p_comment from `part_text`;
select count(*) from part;
drop view part;
