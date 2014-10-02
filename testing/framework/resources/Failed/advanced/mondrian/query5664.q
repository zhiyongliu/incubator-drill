select count(*) from (select distinct nation.nation_name as c0 from (SELECT * FROM (VALUES ('USA', 'US'), ('Mexico', 'MX'), ('Canada', 'CA')) AS t (nation_name, nation_shortcode)) as nation) as init;
