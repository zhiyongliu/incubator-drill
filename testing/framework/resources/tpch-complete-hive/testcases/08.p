{
  "head" : {
    "version" : 1,
    "generator" : {
      "type" : "ExplainHandler",
      "info" : ""
    },
    "type" : "APACHE_DRILL_PHYSICAL",
    "options" : [ ],
    "queue" : 0,
    "resultMode" : "EXEC"
  },
  "graph" : [ {
    "pop" : "hive-scan",
    "@id" : 19,
    "hive-table" : {
      "table" : {
        "tableName" : "nation",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "n_nationkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "n_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "n_regionkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "n_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/nation",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`n_nationkey`", "`n_regionkey`" ],
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_regionkey`",
      "expr" : "`n_regionkey`"
    } ],
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "hive-scan",
    "@id" : 35,
    "hive-table" : {
      "table" : {
        "tableName" : "lineitem",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "l_orderkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "l_partkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "l_suppkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "l_linenumber",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "l_quantity",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "l_extendedprice",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "l_discount",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "l_tax",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "l_returnflag",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "l_linestatus",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "l_shipdate",
            "type" : "date",
            "comment" : null
          }, {
            "name" : "l_commitdate",
            "type" : "date",
            "comment" : null
          }, {
            "name" : "l_receiptdate",
            "type" : "date",
            "comment" : null
          }, {
            "name" : "l_shipinstruct",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "l_shipmode",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "l_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/lineitem",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`l_orderkey`", "`l_partkey`", "`l_suppkey`", "`l_extendedprice`", "`l_discount`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 32,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 35,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hive-scan",
    "@id" : 18,
    "hive-table" : {
      "table" : {
        "tableName" : "nation",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "n_nationkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "n_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "n_regionkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "n_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/nation",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`n_nationkey`", "`n_name`" ],
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    } ],
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`n_nationkey0`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    } ],
    "child" : 14,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "hive-scan",
    "@id" : 22,
    "hive-table" : {
      "table" : {
        "tableName" : "customer",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "c_custkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "c_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "c_address",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "c_nationkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "c_phone",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "c_acctbal",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "c_mktsegment",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "c_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/customer",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`c_custkey`", "`c_nationkey`" ],
    "cost" : 235.0
  }, {
    "pop" : "project",
    "@id" : 20,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_nationkey`",
      "expr" : "`c_nationkey`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 235.0
  }, {
    "pop" : "hive-scan",
    "@id" : 34,
    "hive-table" : {
      "table" : {
        "tableName" : "part",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "p_partkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "p_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "p_mfgr",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "p_brand",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "p_type",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "p_size",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "p_container",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "p_retailprice",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "p_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/part",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`p_partkey`", "`p_type`" ],
    "cost" : 232.0
  }, {
    "pop" : "filter",
    "@id" : 31,
    "child" : 34,
    "expr" : "equal(`p_type`, 'PROMO BRUSHED COPPER') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 34.8
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 28,
    "child" : 31,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 34.8
  }, {
    "pop" : "hive-scan",
    "@id" : 30,
    "hive-table" : {
      "table" : {
        "tableName" : "orders",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "o_orderkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "o_custkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "o_orderstatus",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "o_totalprice",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "o_orderdate",
            "type" : "date",
            "comment" : null
          }, {
            "name" : "o_orderpriority",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "o_clerk",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "o_shippriority",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "o_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/orders",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`o_orderkey`", "`o_custkey`", "`o_orderdate`" ],
    "cost" : 1620.0
  }, {
    "pop" : "project",
    "@id" : 27,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_custkey`",
      "expr" : "`o_custkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    } ],
    "child" : 30,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1620.0
  }, {
    "pop" : "filter",
    "@id" : 25,
    "child" : 27,
    "expr" : "booleanAnd(greater_than_or_equal_to(`o_orderdate`, cast( 788918400000 as DATE)) , less_than_or_equal_to(`o_orderdate`, cast( 851990400000 as DATE)) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 23,
    "child" : 25,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hive-scan",
    "@id" : 17,
    "hive-table" : {
      "table" : {
        "tableName" : "region",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "r_regionkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "r_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "r_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/region",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`r_regionkey`", "`r_name`" ],
    "cost" : 0.0
  }, {
    "pop" : "project",
    "@id" : 13,
    "exprs" : [ {
      "ref" : "`r_regionkey`",
      "expr" : "`r_regionkey`"
    }, {
      "ref" : "`r_name`",
      "expr" : "`r_name`"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "filter",
    "@id" : 10,
    "child" : 13,
    "expr" : "equal(`r_name`, 'MIDDLE EAST') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.15
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 8,
    "child" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "hive-scan",
    "@id" : 36,
    "hive-table" : {
      "table" : {
        "tableName" : "supplier",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "s_suppkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "s_name",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "s_address",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "s_nationkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "s_phone",
            "type" : "string",
            "comment" : null
          }, {
            "name" : "s_acctbal",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "s_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/supplier",
          "inputFormat" : "org.apache.hadoop.mapred.TextInputFormat",
          "outputFormat" : "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat",
          "compressed" : false,
          "numBuckets" : -1,
          "serDeInfo" : {
            "name" : null,
            "serializationLib" : "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe",
            "parameters" : {
              "serialization.format" : "|",
              "field.delim" : "|"
            }
          },
          "sortCols" : [ ],
          "parameters" : { }
        },
        "partitionKeys" : [ ],
        "parameters" : {
          "EXTERNAL" : "TRUE",
          "transient_lastDdlTime" : "1406744227"
        },
        "viewOriginalText" : null,
        "viewExpandedText" : null,
        "tableType" : "EXTERNAL_TABLE"
      },
      "partitions" : null
    },
    "storage-plugin" : "hive",
    "columns" : [ "`s_suppkey`", "`s_nationkey`" ],
    "cost" : 13.0
  }, {
    "pop" : "project",
    "@id" : 33,
    "exprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    }, {
      "ref" : "`s_nationkey`",
      "expr" : "`s_nationkey`"
    } ],
    "child" : 36,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "hash-join",
    "@id" : 29,
    "left" : 33,
    "right" : 32,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_suppkey`",
      "right" : "`l_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 26,
    "left" : 29,
    "right" : 28,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 24,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    }, {
      "ref" : "`s_nationkey`",
      "expr" : "`s_nationkey`"
    }, {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 26,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 21,
    "left" : 24,
    "right" : 23,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_orderkey`",
      "right" : "`o_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 16,
    "left" : 21,
    "right" : 20,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_custkey`",
      "right" : "`c_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 12,
    "left" : 16,
    "right" : 15,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_nationkey`",
      "right" : "`n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 12,
    "right" : 11,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_nationkey`",
      "right" : "`n_nationkey0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 7,
    "left" : 9,
    "right" : 8,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`n_regionkey`",
      "right" : "`r_regionkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`o_year`",
      "expr" : "extractYear(`o_orderdate`) "
    }, {
      "ref" : "`$f1`",
      "expr" : " ( if (equal(`n_name`, 'EGYPT')  ) then (multiply(`l_extendedprice`, subtract(1, `l_discount`) )  )  else (0.0 )  end  ) "
    }, {
      "ref" : "`volume`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 5,
    "child" : 6,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3546.5,
    "groupByExprs" : [ {
      "ref" : "`o_year`",
      "expr" : "`o_year`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "sum(`$f1`) "
    }, {
      "ref" : "`$f2`",
      "expr" : "sum(`volume`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 4,
    "exprs" : [ {
      "ref" : "`o_year`",
      "expr" : "`o_year`"
    }, {
      "ref" : "`mkt_share`",
      "expr" : "divide(`$f1`, `$f2`) "
    } ],
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 709.3
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`o_year`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 709.3
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 709.3
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`o_year`",
      "expr" : "`o_year`"
    }, {
      "ref" : "`mkt_share`",
      "expr" : "`mkt_share`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 709.3
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 709.3
  } ]
}