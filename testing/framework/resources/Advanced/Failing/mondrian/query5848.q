select FACT.store_type as c0, sum(FACT.store_sqft) as m0 from (select * from store as FOOBAR) as FACT group by FACT.store_type;
