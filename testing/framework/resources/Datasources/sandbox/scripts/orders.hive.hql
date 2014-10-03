CREATE EXTERNAL TABLE orders (order_id BIGINT, month STRING, cust_id BIGINT,  state STRING, prod_id BIGINT, order_total INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE LOCATION "/sandbox/data/orders/";
