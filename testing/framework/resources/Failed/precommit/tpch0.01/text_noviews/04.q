select
  o.columns[5],
  count(*) as order_count
from
  `orders.tbl` o
where
  o.columns[4] >= date '1996-10-01'
  and o.columns[4] < date '1996-10-01' + interval '3' month
  and 
  exists (
    select
      *
    from
      `lineitem.tbl` l
    where
      l.columns[0] = o.columns[0]
      and l.columns[11] < l.columns[12]
  )
group by
  o.columns[5]
order by
  o.columns[5];
