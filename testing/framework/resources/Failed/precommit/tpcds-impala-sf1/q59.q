with
wss as
(select
d.d_week_seq as wdws,
ss.ss_store_sk as wssk,
sum(case when (d.d_day_name = 'Sunday') then ss.ss_sales_price else null end) sun_sales,
sum(case when (d.d_day_name = 'Monday') then ss.ss_sales_price else null end) mon_sales,
sum(case when (d.d_day_name = 'Tuesday') then ss.ss_sales_price else null end) tue_sales,
sum(case when (d.d_day_name = 'Wednesday') then ss.ss_sales_price else null end) wed_sales,
sum(case when (d.d_day_name = 'Thursday') then ss.ss_sales_price else null end) thu_sales,
sum(case when (d.d_day_name = 'Friday') then ss.ss_sales_price else null end) fri_sales,
sum(case when (d.d_day_name = 'Saturday') then ss.ss_sales_price else null end) sat_sales
from
store_sales as ss,
date_dim as d
where
d.d_date_sk = ss.ss_sold_date_sk
group by
d.d_week_seq,
ss.ss_store_sk
)
select
y.s_store_name1,
y.s_store_id1,
y.d_week_seq1,
y.sun_sales1 / x.sun_sales2,
y.mon_sales1 / x.mon_sales2,
y.tue_sales1 / x.tue_sales2,
y.wed_sales1 / x.wed_sales2,
y.thu_sales1 / x.thu_sales2,
y.fri_sales1 / x.fri_sales2,
y.sat_sales1 / x.sat_sales2
from
(select
s1.s_store_name s_store_name1,
d1.d_week_seq d_week_seq1,
s1.s_store_id s_store_id1,
wss.sun_sales sun_sales1,
wss.mon_sales mon_sales1,
wss.tue_sales tue_sales1,
wss.wed_sales wed_sales1,
wss.thu_sales thu_sales1,
wss.fri_sales fri_sales1,
wss.sat_sales sat_sales1
from
wss,
store as s1,
date_dim as d1
where
d1.d_week_seq = wss.wdws
and wss.wssk = s1.s_store_sk
and d1.d_month_seq between 1185 and 1185 + 11
) as y,
(select
s2.s_store_name s_store_name2,
d2.d_week_seq d_week_seq2,
s2.s_store_id s_store_id2,
wss.sun_sales sun_sales2,
wss.mon_sales mon_sales2,
wss.tue_sales tue_sales2,
wss.wed_sales wed_sales2,
wss.thu_sales thu_sales2,
wss.fri_sales fri_sales2,
wss.sat_sales sat_sales2
from
wss,
store as s2,
date_dim as d2
where
d2.d_week_seq = wss.wdws
and wss.wssk = s2.s_store_sk
and d2.d_month_seq between 1185 + 12 and 1185 + 23
) as x
where
y.s_store_id1 = x.s_store_id2
and y.d_week_seq1 = x.d_week_seq2 - 52
order by
y.s_store_name1,
y.s_store_id1,
y.d_week_seq1
limit 100;

