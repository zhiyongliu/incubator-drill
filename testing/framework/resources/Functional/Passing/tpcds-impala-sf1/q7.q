select
  i.i_item_id,
  avg(ss.ss_quantity) agg1,
  avg(ss.ss_list_price) agg2,
  avg(ss.ss_coupon_amt) agg3,
  avg(ss.ss_sales_price) agg4
from
  store_sales as ss,
  customer_demographics as cd,
  date_dim as d,
  item as i,
  promotion as p
where
  ss.ss_sold_date_sk = d.d_date_sk
  and ss.ss_item_sk = i.i_item_sk
  and ss.ss_cdemo_sk = cd.cd_demo_sk
  and ss.ss_promo_sk = p.p_promo_sk
  and cd.cd_gender = 'F'
  and cd.cd_marital_status = 'W'
  and cd.cd_education_status = 'Primary'
  and (p.p_channel_email = 'N'
    or p.p_channel_event = 'N')
  and d.d_year = 1998
  and ss.ss_sold_date_sk between 2450815 and 2451179 -- partition key filter
group by
  i.i_item_id
order by
  i.i_item_id
limit 100;

