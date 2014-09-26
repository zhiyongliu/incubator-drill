select
  i.i_item_id,
  s.s_state,
  -- grouping(s.s_state) g_state,
  avg(ss.ss_quantity) agg1,
  avg(ss.ss_list_price) agg2,
  avg(ss.ss_coupon_amt) agg3,
  avg(ss.ss_sales_price) agg4
from
  store_sales as ss,
  customer_demographics as cd,
  date_dim as d,
  store as s,
  item as i
where
  ss.ss_sold_date_sk = d.d_date_sk
  and ss.ss_item_sk = i.i_item_sk
  and ss.ss_store_sk = s.s_store_sk
  and ss.ss_cdemo_sk = cd.cd_demo_sk
  and cd.cd_gender = 'F'
  and cd.cd_marital_status = 'W'
  and cd.cd_education_status = 'Primary'
  and d.d_year = 1998
  and s.s_state in ('WI', 'CA', 'TX', 'FL', 'WA', 'TN')
  and ss.ss_sold_date_sk between 2450815 and 2451179  -- partition key filter
group by
  -- rollup (i.i_item_id, s.s_state)
  i.i_item_id,
  s.s_state
order by
  i.i_item_id,
  s.s_state
limit 100;

