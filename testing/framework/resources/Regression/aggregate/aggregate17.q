select cast(c_groupby as varchar(5)), c_int, avg(c_int), avg(c_bigint), avg(c_float4), avg(c_float8), avg(cast(c_decimal9 as decimal(18,9))), avg(cast(c_decimal18 as decimal(38,18))) from data group by cast(c_groupby as varchar(5)), c_int;
