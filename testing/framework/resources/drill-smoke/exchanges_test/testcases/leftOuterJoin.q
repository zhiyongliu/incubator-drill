select c.C_custkey,c.C_NAME,o.O_ORDERKEY from customer c left outer join orders o on c.c_custkey = o.o_custkey;
