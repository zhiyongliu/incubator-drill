select count(c_int), count(distinct(c_bigint)), count(distinct(c_float4)), count(distinct(c_float8)), count(distinct(cast(c_float4 as decimal(9,3)))), count(distinct(cast(c_decimal9 as decimal(28,9)))), count(distinct(cast(c_decimal18 as decimal(38,18)))) from data where c_row <> 5 and c_row <> 14 and c_row <> 19 group by c_groupby, c_int;