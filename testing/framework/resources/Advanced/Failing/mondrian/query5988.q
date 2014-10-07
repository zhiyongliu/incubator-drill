select store.store_name as c0, time_by_day.the_year as c1, product.product_name as c2, sum(sales_fact_1997.store_cost) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, product as product where sales_fact_1997.store_id = store.store_id and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_name in ('BBB Best Apple Butter', 'BBB Best Apple Jam', 'BBB Best Apple Jelly', 'BBB Best Apple Preserves', 'BBB Best Chunky Peanut Butter', 'BBB Best Creamy Peanut Butter', 'BBB Best Extra Chunky Peanut Butter', 'BBB Best Grape Jam', 'BBB Best Grape Jelly', 'BBB Best Grape Preserves', 'BBB Best Low Fat Apple Butter', 'BBB Best Strawberry Jam', 'BBB Best Strawberry Jelly', 'BBB Best Strawberry Preserves', 'Best Corn Puffs', 'Best Grits', 'Best Oatmeal', 'Best Wheat Puffs', 'Better Beef Soup', 'Better Canned Beets', 'Better Canned Peas', 'Better Canned String Beans', 'Better Canned Tomatos', 'Better Canned Tuna in Oil', 'Better Canned Tuna in Water', 'Better Canned Yams', 'Better Chicken Noodle Soup', 'Better Chicken Ramen Soup', 'Better Chicken Soup', 'Better Creamed Corn', 'Better Fancy Canned Anchovies', 'Better Fancy Canned Clams', 'Better Fancy Canned Oysters', 'Better Fancy Canned Sardines', 'Better Large Canned Shrimp', 'Better Noodle Soup', 'Better Regular Ramen Soup', 'Better Rice Soup', 'Better Turkey Noodle Soup', 'Better Vegetable Soup', 'Blue Label Beef Soup', 'Blue Label Canned Beets', 'Blue Label Canned Peas', 'Blue Label Canned String Beans', 'Blue Label Canned Tomatos', 'Blue Label Canned Tuna in Oil', 'Blue Label Canned Tuna in Water', 'Blue Label Canned Yams', 'Blue Label Chicken Noodle Soup', 'Blue Label Chicken Ramen Soup', 'Blue Label Chicken Soup', 'Blue Label Creamed Corn', 'Blue Label Fancy Canned Anchovies', 'Blue Label Fancy Canned Clams', 'Blue Label Fancy Canned Oysters', 'Blue Label Fancy Canned Sardines', 'Blue Label Large Canned Shrimp', 'Blue Label Noodle Soup', 'Blue Label Regular Ramen Soup', 'Blue Label Rice Soup', 'Blue Label Turkey Noodle Soup', 'Blue Label Vegetable Soup', 'Bravo Beef Soup', 'Bravo Canned Beets', 'Bravo Canned Peas', 'Bravo Canned String Beans', 'Bravo Canned Tomatos', 'Bravo Canned Tuna in Oil', 'Bravo Canned Tuna in Water', 'Bravo Canned Yams', 'Bravo Chicken Noodle Soup', 'Bravo Chicken Ramen Soup', 'Bravo Chicken Soup', 'Bravo Creamed Corn', 'Bravo Fancy Canned Anchovies', 'Bravo Fancy Canned Clams', 'Bravo Fancy Canned Oysters', 'Bravo Fancy Canned Sardines', 'Bravo Large Canned Shrimp', 'Bravo Noodle Soup', 'Bravo Regular Ramen Soup', 'Bravo Rice Soup', 'Bravo Turkey Noodle Soup', 'Bravo Vegetable Soup', 'CDR Apple Butter', 'CDR Apple Jam', 'CDR Apple Jelly', 'CDR Apple Preserves', 'CDR Chunky Peanut Butter', 'CDR Creamy Peanut Butter', 'CDR Extra Chunky Peanut Butter', 'CDR Grape Jam', 'CDR Grape Jelly', 'CDR Grape Preserves', 'CDR Low Fat Apple Butter', 'CDR Strawberry Jam', 'CDR Strawberry Jelly', 'CDR Strawberry Preserves', 'Jeffers Corn Puffs', 'Jeffers Grits', 'Jeffers Oatmeal', 'Jeffers Wheat Puffs', 'Johnson Corn Puffs', 'Johnson Grits', 'Johnson Oatmeal', 'Johnson Wheat Puffs', 'Just Right Beef Soup', 'Just Right Canned Beets', 'Just Right Canned Peas', 'Just Right Canned String Beans', 'Just Right Canned Tomatos', 'Just Right Canned Tuna in Oil', 'Just Right Canned Tuna in Water', 'Just Right Canned Yams', 'Just Right Chicken Noodle Soup', 'Just Right Chicken Ramen Soup', 'Just Right Chicken Soup', 'Just Right Creamed Corn', 'Just Right Fancy Canned Anchovies', 'Just Right Fancy Canned Clams', 'Just Right Fancy Canned Oysters', 'Just Right Fancy Canned Sardines', 'Just Right Large Canned Shrimp', 'Just Right Noodle Soup', 'Just Right Regular Ramen Soup', 'Just Right Rice Soup', 'Just Right Turkey Noodle Soup', 'Just Right Vegetable Soup', 'Landslide Apple Butter', 'Landslide Apple Jam', 'Landslide Apple Jelly', 'Landslide Apple Preserves', 'Landslide Chunky Peanut Butter', 'Landslide Creamy Peanut Butter', 'Landslide Extra Chunky Peanut Butter', 'Landslide Grape Jam', 'Landslide Grape Jelly', 'Landslide Grape Preserves', 'Landslide Low Fat Apple Butter', 'Landslide Strawberry Jam', 'Landslide Strawberry Jelly', 'Landslide Strawberry Preserves', 'Plato Apple Butter', 'Plato Apple Jam', 'Plato Apple Jelly', 'Plato Apple Preserves', 'Plato Chunky Peanut Butter', 'Plato Creamy Peanut Butter', 'Plato Extra Chunky Peanut Butter', 'Plato Grape Jam', 'Plato Grape Jelly', 'Plato Grape Preserves', 'Plato Low Fat Apple Butter', 'Plato Strawberry Jam', 'Plato Strawberry Jelly', 'Plato Strawberry Preserves', 'Pleasant Beef Soup', 'Pleasant Canned Beets', 'Pleasant Canned Peas', 'Pleasant Canned String Beans', 'Pleasant Canned Tomatos', 'Pleasant Canned Tuna in Oil', 'Pleasant Canned Tuna in Water', 'Pleasant Canned Yams', 'Pleasant Chicken Noodle Soup', 'Pleasant Chicken Ramen Soup', 'Pleasant Chicken Soup', 'Pleasant Creamed Corn', 'Pleasant Fancy Canned Anchovies', 'Pleasant Fancy Canned Clams', 'Pleasant Fancy Canned Oysters', 'Pleasant Fancy Canned Sardines', 'Pleasant Large Canned Shrimp', 'Pleasant Noodle Soup', 'Pleasant Regular Ramen Soup', 'Pleasant Rice Soup', 'Pleasant Turkey Noodle Soup', 'Pleasant Vegetable Soup', 'Radius Corn Puffs', 'Radius Grits', 'Radius Oatmeal', 'Radius Wheat Puffs', 'Special Corn Puffs', 'Special Grits', 'Special Oatmeal', 'Special Wheat Puffs', 'Super Apple Butter', 'Super Apple Jam', 'Super Apple Jelly', 'Super Apple Preserves', 'Super Chunky Peanut Butter', 'Super Creamy Peanut Butter', 'Super Extra Chunky Peanut Butter', 'Super Grape Jam', 'Super Grape Jelly', 'Super Grape Preserves', 'Super Low Fat Apple Butter', 'Super Strawberry Jam', 'Super Strawberry Jelly', 'Super Strawberry Preserves') group by store.store_name, time_by_day.the_year, product.product_name;
