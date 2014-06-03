select c.c_custkey from customer c where exists (select n.n_name from nation n where n.n_nationkey = 5);
