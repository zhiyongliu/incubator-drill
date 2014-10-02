select product.product_name as c0 from product as product, product_class as product_class where product.product_class_id = product_class.product_class_id and (product.brand_name = 'Good' and product_class.product_subcategory = 'Wine' and product_class.product_category = 'Beer and Wine' and product_class.product_department = 'Alcoholic Beverages' and product_class.product_family = 'Drink') and UPPER(product.product_name) = UPPER('Good Chablis Wine') group by product.product_name order by product.product_name ASC NULLS LAST;
