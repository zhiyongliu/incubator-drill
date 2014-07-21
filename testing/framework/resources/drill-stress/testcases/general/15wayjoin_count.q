select count(*) from `lineitem1.parquet` a
inner join `part.parquet` j on a.l_partkey = j.p_partkey
inner join `orders.parquet` k on a.l_orderkey = k.o_orderkey
inner join `supplier.parquet` l on a.l_suppkey = l.s_suppkey
inner join `partsupp.parquet` m on j.p_partkey = m.ps_partkey and l.s_suppkey = m.ps_suppkey
inner join `customer.parquet` n on k.o_custkey = n.c_custkey
inner join `lineitem2.parquet` b on a.l_orderkey = b.l_orderkey
inner join `lineitem2.parquet` c on a.l_partkey = c.l_partkey
inner join `lineitem2.parquet` d on a.l_suppkey = d.l_suppkey
inner join `lineitem2.parquet` e on a.l_extendedprice = e.l_extendedprice
inner join `lineitem2.parquet` f on a.l_comment = f.l_comment
inner join `lineitem2.parquet` g on a.l_shipdate = g.l_shipdate
inner join `lineitem2.parquet` h on a.l_commitdate = h.l_commitdate
inner join `lineitem2.parquet` i on a.l_receiptdate = i.l_receiptdate
inner join `lineitem2.parquet` o on a.l_receiptdate = o.l_receiptdate
