select columns[22] as city, avg(cast(columns[6] as bigint)) as average, stddev_samp(cast(columns[6] as bigint)) as stddsamp, stddev_pop(cast(columns[6] as bigint)) as stddpop , var_samp(cast(columns[6] as bigint)) as varsamp, var_pop(cast(columns[6] as bigint)) as varpop from store group by columns[22];
