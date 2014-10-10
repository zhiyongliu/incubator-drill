select store.store_name as c0, time_by_day.the_year as c1, product.product_name as c2, sum(sales_fact_1997.unit_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, product as product where sales_fact_1997.store_id = store.store_id and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.product_id = product.product_id and product.product_name in ('ADJ Rosy Sunglasses', 'Akron City Map', 'Akron Eyeglass Screwdriver', 'Atomic Bubble Gum', 'Atomic Mints', 'Atomic Spicy Mints', 'Bird Call 200 MG Acetominifen', 'Bird Call 200 MG Ibuprofen', 'Bird Call Angled Toothbrush', 'Bird Call Apricot Shampoo', 'Bird Call Buffered Aspirin', 'Bird Call Childrens Aspirin', 'Bird Call Childrens Cold Remedy', 'Bird Call Conditioning Shampoo', 'Bird Call Deodorant', 'Bird Call Dishwasher Detergent', 'Bird Call Extra Moisture Shampoo', 'Bird Call HCL Nasal Spray', 'Bird Call Laundry Detergent', 'Bird Call Mint Mouthwash', 'Bird Call Multi-Symptom Cold Remedy', 'Bird Call Silky Smooth Hair Conditioner', 'Bird Call Tartar Control Toothpaste', 'Bird Call Toothpaste', 'Bird Call Whitening Toothpast', 'Black Tie City Map', 'Black Tie Eyeglass Screwdriver', 'Choice Bubble Gum', 'Choice Malted Milk Balls', 'Choice Mint Chocolate Bar', 'Choice Mints', 'Choice Semi-Sweet Chocolate Bar', 'Choice Spicy Mints', 'Choice Tasty Candy Bar', 'Choice White Chocolate Bar', 'Colossal Manicotti', 'Colossal Ravioli', 'Colossal Rice Medly', 'Colossal Spaghetti', 'Colossal Thai Rice', 'Consolidated 200 MG Acetominifen', 'Consolidated 200 MG Ibuprofen', 'Consolidated Angled Toothbrush', 'Consolidated Apricot Shampoo', 'Consolidated Buffered Aspirin', 'Consolidated Childrens Aspirin', 'Consolidated Childrens Cold Remedy', 'Consolidated Conditioning Shampoo', 'Consolidated Deodorant', 'Consolidated Dishwasher Detergent', 'Consolidated Extra Moisture Shampoo', 'Consolidated HCL Nasal Spray', 'Consolidated Laundry Detergent', 'Consolidated Mint Mouthwash', 'Consolidated Multi-Symptom Cold Remedy', 'Consolidated Silky Smooth Hair Conditioner', 'Consolidated Tartar Control Toothpaste', 'Consolidated Toothpaste', 'Consolidated Whitening Toothpast', 'Cormorant Bees Wax Candles', 'Cormorant Counter Cleaner', 'Cormorant Economy Toilet Brush', 'Cormorant Glass Cleaner', 'Cormorant Toilet Bowl Cleaner', 'Denny Bees Wax Candles', 'Denny Counter Cleaner', 'Denny Economy Toilet Brush', 'Denny Glass Cleaner', 'Denny Toilet Bowl Cleaner', 'Discover Manicotti', 'Discover Ravioli', 'Discover Rice Medly', 'Discover Spaghetti', 'Discover Thai Rice', 'Faux Products 200 MG Acetominifen', 'Faux Products 200 MG Ibuprofen', 'Faux Products Angled Toothbrush', 'Faux Products Apricot Shampoo', 'Faux Products Buffered Aspirin', 'Faux Products Childrens Aspirin', 'Faux Products Childrens Cold Remedy', 'Faux Products Conditioning Shampoo', 'Faux Products Deodorant', 'Faux Products Dishwasher Detergent', 'Faux Products Extra Moisture Shampoo', 'Faux Products HCL Nasal Spray', 'Faux Products Laundry Detergent', 'Faux Products Mint Mouthwash', 'Faux Products Multi-Symptom Cold Remedy', 'Faux Products Silky Smooth Hair Conditioner', 'Faux Products Tartar Control Toothpaste', 'Faux Products Toothpaste', 'Faux Products Whitening Toothpast', 'Framton City Map', 'Framton Eyeglass Screwdriver', 'Gulf Coast Bubble Gum', 'Gulf Coast Malted Milk Balls', 'Gulf Coast Mint Chocolate Bar', 'Gulf Coast Mints', 'Gulf Coast Semi-Sweet Chocolate Bar', 'Gulf Coast Spicy Mints', 'Gulf Coast Tasty Candy Bar', 'Gulf Coast White Chocolate Bar', 'High Quality Bees Wax Candles', 'High Quality Counter Cleaner', 'High Quality Economy Toilet Brush', 'High Quality Glass Cleaner', 'High Quality Toilet Bowl Cleaner', 'Hilltop 200 MG Acetominifen', 'Hilltop 200 MG Ibuprofen', 'Hilltop Angled Toothbrush', 'Hilltop Apricot Shampoo', 'Hilltop Buffered Aspirin', 'Hilltop Childrens Aspirin', 'Hilltop Childrens Cold Remedy', 'Hilltop Conditioning Shampoo', 'Hilltop Deodorant', 'Hilltop Dishwasher Detergent', 'Hilltop Extra Moisture Shampoo', 'Hilltop HCL Nasal Spray', 'Hilltop Laundry Detergent', 'Hilltop Mint Mouthwash', 'Hilltop Multi-Symptom Cold Remedy', 'Hilltop Silky Smooth Hair Conditioner', 'Hilltop Tartar Control Toothpaste', 'Hilltop Toothpaste', 'Hilltop Whitening Toothpast', 'James Bay City Map', 'James Bay Eyeglass Screwdriver', 'Jardon Manicotti', 'Jardon Ravioli', 'Jardon Rice Medly', 'Jardon Spaghetti', 'Jardon Thai Rice', 'King Rosy Sunglasses', 'Medalist Manicotti', 'Medalist Ravioli', 'Medalist Rice Medly', 'Medalist Spaghetti', 'Medalist Thai Rice', 'Monarch Manicotti', 'Monarch Ravioli', 'Monarch Rice Medly', 'Monarch Spaghetti', 'Monarch Thai Rice', 'Musial Bubble Gum', 'Musial Malted Milk Balls', 'Musial Mint Chocolate Bar', 'Musial Mints', 'Musial Semi-Sweet Chocolate Bar', 'Musial Spicy Mints', 'Musial Tasty Candy Bar', 'Musial White Chocolate Bar', 'Prelude Rosy Sunglasses', 'Queen City Map', 'Queen Eyeglass Screwdriver', 'Red Wing Bees Wax Candles', 'Red Wing Counter Cleaner', 'Red Wing Economy Toilet Brush', 'Red Wing Glass Cleaner', 'Red Wing Toilet Bowl Cleaner', 'Shady Lake Manicotti', 'Shady Lake Ravioli', 'Shady Lake Rice Medly', 'Shady Lake Spaghetti', 'Shady Lake Thai Rice', 'Steady 200 MG Acetominifen', 'Steady 200 MG Ibuprofen', 'Steady Angled Toothbrush', 'Steady Apricot Shampoo', 'Steady Buffered Aspirin', 'Steady Childrens Aspirin', 'Steady Childrens Cold Remedy', 'Steady Conditioning Shampoo', 'Steady Deodorant', 'Steady Dishwasher Detergent', 'Steady Extra Moisture Shampoo', 'Steady HCL Nasal Spray', 'Steady Laundry Detergent', 'Steady Mint Mouthwash', 'Steady Multi-Symptom Cold Remedy', 'Steady Silky Smooth Hair Conditioner', 'Steady Tartar Control Toothpaste', 'Steady Toothpaste', 'Steady Whitening Toothpast', 'Sunset Bees Wax Candles', 'Sunset Counter Cleaner', 'Sunset Economy Toilet Brush', 'Sunset Glass Cleaner', 'Sunset Toilet Bowl Cleaner', 'Symphony Rosy Sunglasses', 'Thresher Bubble Gum', 'Thresher Malted Milk Balls', 'Thresher Mint Chocolate Bar', 'Thresher Mints', 'Thresher Semi-Sweet Chocolate Bar', 'Thresher Spicy Mints', 'Thresher Tasty Candy Bar', 'Thresher White Chocolate Bar', 'Toretti Rosy Sunglasses') group by store.store_name, time_by_day.the_year, product.product_name;