selectn    product_class.product_family as c0,n    product_class.product_department as c1,n    product_class.product_category as c2nfromn    product as product,n    product_class as product_class,n    sales_fact_1997 as sales_fact_1997,n    time_by_day as time_by_daynwheren    product.product_class_id = product_class.product_class_idnandn    sales_fact_1997.product_id = product.product_idnandn    sales_fact_1997.time_id = time_by_day.time_idnandn    time_by_day.the_year = 1997nandn    (product_class.product_department = 'Alcoholic Beverages' and product_class.product_family = 'Drink')ngroup byn    product_class.product_family,n    product_class.product_department,n    product_class.product_categorynorder byn    product_class.product_family ASC NULLS LAST,n    product_class.product_department ASC NULLS LAST,n    product_class.product_category ASC NULLS LAST;
