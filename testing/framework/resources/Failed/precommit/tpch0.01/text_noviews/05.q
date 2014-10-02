select
  n.columns[1],
  sum(l.columns[5] * (1 - l.columns[6])) as revenue
from
  `customer.tbl` c,
  `orders.tbl` o,
  `lineitem.tbl` l,
  `supplier.tbl` s,
  `nation.tbl` n,
  `region.tbl` r
where
  c.columns[0] = o.o_columns[1]
  and l.l_columns[0] = o.columns[0]
  and l.columns[2] = s.columns[0]
  and c.columns[3] = s.columns[3]
  and s.columns[3] = n.columns[0]
  and n.columns[2] = r.columns[0]
  and r.columns[1] = 'EUROPE'
  and o.columns[4] >= date '1997-01-01'
  and o.columns[4] < date '1997-01-01' + interval '1' year
group by
  n.columns[1]
order by
  revenue desc;
