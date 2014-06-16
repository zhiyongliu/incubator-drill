select cast(c_groupby as varchar(4)), avg(distinct(c_int)), avg(distinct(c_bigint)), avg(distinct(c_float4)), avg(distinct(c_float8)) from data group by c_groupby;
