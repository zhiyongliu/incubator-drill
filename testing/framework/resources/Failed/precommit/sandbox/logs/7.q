select dir1 month_no, count(*) month_count from logs where dir0=2014 group by dir1 order by dir1;
