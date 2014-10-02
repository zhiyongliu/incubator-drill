select product_csv.name1 as c0, sum(fact.amount) as m0 from product_csv as product_csv, fact as fact where fact.prod_id = product_csv.prod_id and product_csv.name1 = 'One' group by product_csv.name1;
