select cust_id, dir1 month_no, count(*) month_count from logs
where dir0=2014 group by cust_id, dir1 order by cust_id, month_no limit 10;
