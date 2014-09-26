select
  c.c_last_name,
  c.c_first_name,
  c.c_salutation,
  c.c_preferred_cust_flag,
  dn.sstn,
  dn.cnt
from
  (select
    ss.ss_ticket_number as sstn,
    ss.ss_customer_sk as sscsk,
    count(*) cnt
  from
    store_sales as ss,
    date_dim as d,
    store as s,
    household_demographics as hd
  where
    ss.ss_sold_date_sk = d.d_date_sk
    and ss.ss_store_sk = s.s_store_sk
    and ss.ss_hdemo_sk = hd.hd_demo_sk
    and (d.d_dom between 1 and 3
      or d.d_dom between 25 and 28)
    and (hd.hd_buy_potential = '>10000'
      or hd.hd_buy_potential = 'unknown')
    and hd.hd_vehicle_count > 0
    and (case when hd.hd_vehicle_count > 0 then hd.hd_dep_count / hd.hd_vehicle_count else null end) > 1.2
    and d.d_year in (1998, 1998 + 1, 1998 + 2)
    and s.s_county in ('Saginaw County', 'Sumner County', 'Appanoose County', 'Daviess County', 'Fairfield County', 'Raleigh County', 'Ziebach County', 'Williamson County')
    and ss.ss_sold_date_sk between 2450816 and 2451910 -- partition key filter
  group by
    ss.ss_ticket_number,
    ss.ss_customer_sk
  ) dn,
  customer as c
where
  dn.sscsk= c.c_customer_sk
  and dn.cnt between 15 and 20
order by
  c.c_last_name,
  c.c_first_name,
  c.c_salutation,
  c.c_preferred_cust_flag desc
limit 100000;

