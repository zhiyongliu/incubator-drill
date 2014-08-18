select c_interval from data where cast(c_interval as interval) < cast(c_time as time);
