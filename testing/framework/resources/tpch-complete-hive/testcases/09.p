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
    "@id" : 21,
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
    "columns" : [ "`p_partkey`", "`p_name`" ],
    "cost" : 232.0
  }, {
    "pop" : "filter",
    "@id" : 18,
    "child" : 21,
    "expr" : "like(`p_name`, '%yellow%') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 16,
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "hive-scan",
    "@id" : 13,
    "hive-table" : {
      "table" : {
        "tableName" : "partsupp",
        "dbName" : "default",
        "owner" : "root",
        "createTime" : 1406744227,
        "lastAccessTime" : 0,
        "retention" : 0,
        "sd" : {
          "cols" : [ {
            "name" : "ps_partkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "ps_suppkey",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "ps_availqty",
            "type" : "int",
            "comment" : null
          }, {
            "name" : "ps_supplycost",
            "type" : "double",
            "comment" : null
          }, {
            "name" : "ps_comment",
            "type" : "string",
            "comment" : null
          } ],
          "location" : "maprfs:/drill/testdata/tpch-complete-hive/partsupp",
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
    "columns" : [ "`ps_partkey`", "`ps_suppkey`", "`ps_supplycost`" ],
    "cost" : 1134.0
  }, {
    "pop" : "hive-scan",
    "@id" : 9,
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
    "columns" : [ "`o_orderkey`", "`o_orderdate`" ],
    "cost" : 1620.0
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1620.0
  }, {
    "pop" : "hive-scan",
    "@id" : 12,
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
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "hive-scan",
    "@id" : 23,
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
    "@id" : 20,
    "exprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    }, {
      "ref" : "`s_nationkey`",
      "expr" : "`s_nationkey`"
    } ],
    "child" : 23,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "hive-scan",
    "@id" : 22,
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
    "columns" : [ "`l_orderkey`", "`l_partkey`", "`l_suppkey`", "`l_quantity`", "`l_extendedprice`", "`l_discount`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 19,
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
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 17,
    "left" : 20,
    "right" : 19,
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
    "@id" : 15,
    "left" : 17,
    "right" : 16,
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
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    }, {
      "ref" : "`p_name`",
      "expr" : "`p_name`"
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
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 15,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 14,
    "right" : 13,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_suppkey`",
      "right" : "`ps_suppkey`"
    }, {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`ps_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_nationkey`",
      "right" : "`n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-join",
    "@id" : 6,
    "left" : 8,
    "right" : 7,
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
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`o_year`",
      "expr" : "extractYear(`o_orderdate`) "
    }, {
      "ref" : "`amount`",
      "expr" : "subtract(multiply(`l_extendedprice`, subtract(1, `l_discount`) ) , multiply(`ps_supplycost`, `l_quantity`) ) "
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 5319.75,
    "groupByExprs" : [ {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`o_year`",
      "expr" : "`o_year`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`sum_profit`",
      "expr" : "sum(`amount`) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`n_name`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "DESC",
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
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`o_year`",
      "expr" : "`o_year`"
    }, {
      "ref" : "`sum_profit`",
      "expr" : "`sum_profit`"
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