select product_cat.name2 as c0, product_cat.cap as c1, product_cat.ord as c2 from test_lp_xxx_fact as test_lp_xxx_fact, product_csv as product_csv, product_cat as product_cat, cat as cat where test_lp_xxx_fact.category = 1 and product_cat.cat = cat.cat and product_csv.prod_cat = product_cat.prod_cat and product_cat.name2 = test_lp_xxx_fact.product_category and cat.cat = test_lp_xxx_fact.category group by product_cat.name2, product_cat.cap, product_cat.ord order by product_cat.ord ASC NULLS LAST;
