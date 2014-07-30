DROP TABLE IF EXISTS NATION;
DROP TABLE IF EXISTS REGION; 
DROP TABLE IF EXISTS PART;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS PARTSUPP;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS LINEITEM;

CREATE EXTERNAL TABLE NATION  ( N_NATIONKEY  INT ,
                            N_NAME       STRING ,
                            N_REGIONKEY  INT ,
                            N_COMMENT    STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/nation';

CREATE EXTERNAL TABLE REGION  ( R_REGIONKEY  INT ,
                            R_NAME       STRING ,
                            R_COMMENT    STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/region';

CREATE EXTERNAL TABLE PART  ( P_PARTKEY     INT ,
                          P_NAME        STRING ,
                          P_MFGR        STRING ,
                          P_BRAND       STRING ,
                          P_TYPE        STRING ,
                          P_SIZE        INT ,
                          P_CONTAINER   STRING ,
                          P_RETAILPRICE DOUBLE ,
                          P_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/part';

CREATE EXTERNAL TABLE SUPPLIER ( S_SUPPKEY     INT ,
                             S_NAME        STRING ,
                             S_ADDRESS     STRING ,
                             S_NATIONKEY   INT ,
                             S_PHONE       STRING ,
                             S_ACCTBAL     DOUBLE ,
                             S_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/supplier';

CREATE EXTERNAL TABLE PARTSUPP ( PS_PARTKEY     INT ,
                             PS_SUPPKEY     INT ,
                             PS_AVAILQTY    INT ,
                             PS_SUPPLYCOST  DOUBLE  ,
                             PS_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/partsupp';

CREATE EXTERNAL TABLE CUSTOMER ( C_CUSTKEY     INT ,
                             C_NAME        STRING ,
                             C_ADDRESS     STRING ,
                             C_NATIONKEY   INT ,
                             C_PHONE       STRING ,
                             C_ACCTBAL     DOUBLE   ,
                             C_MKTSEGMENT  STRING ,
                             C_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/customer';

CREATE EXTERNAL TABLE ORDERS  ( O_ORDERKEY       INT ,
                           O_CUSTKEY        INT ,
                           O_ORDERSTATUS    STRING ,
                           O_TOTALPRICE     DOUBLE ,
                           O_ORDERDATE	    DATE ,
                           O_ORDERPRIORITY  STRING ,  
                           O_CLERK          STRING , 
                           O_SHIPPRIORITY   INT ,
                           O_COMMENT        STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/orders';

CREATE EXTERNAL TABLE LINEITEM ( L_ORDERKEY    INT ,
                             L_PARTKEY     INT ,
                             L_SUPPKEY     INT ,
                             L_LINENUMBER  INT ,
                             L_QUANTITY    DOUBLE ,
                             L_EXTENDEDPRICE  DOUBLE ,
                             L_DISCOUNT    DOUBLE ,
                             L_TAX         DOUBLE ,
                             L_RETURNFLAG  STRING ,
                             L_LINESTATUS  STRING ,
                             L_SHIPDATE    DATE ,
                             L_COMMITDATE  DATE ,
                             L_RECEIPTDATE DATE ,
                             L_SHIPINSTRUCT STRING ,
                             L_SHIPMODE     STRING ,
                             L_COMMENT      STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/tpch-complete-hive/lineitem';

