create view nation as select cast(columns[0] as int) n_nationkey, columns[1] n_name, cast(columns[2] as int) n_regionkey, columns[3] n_comment from `nation_text`;
select count(*) from nation;
drop view nation;
