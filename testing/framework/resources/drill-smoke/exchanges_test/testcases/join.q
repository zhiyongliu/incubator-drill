select c.C_custkey,c.C_NAME,o.O_ORDERKEY from customer c,orders o where c.c_custkey = o.o_custkey;
