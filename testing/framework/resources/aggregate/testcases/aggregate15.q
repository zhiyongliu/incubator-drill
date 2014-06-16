select cast(c_groupby as varchar(4)), sum(c_int), sum(c_bigint), sum(c_float4), sum(c_float8) from data group by c_groupby;
