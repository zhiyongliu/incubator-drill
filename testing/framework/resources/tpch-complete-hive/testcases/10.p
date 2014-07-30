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
    "@id" : 16,
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
    "@id" : 13,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    } ],
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "hive-scan",
    "@id" : 21,
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
    "columns" : [ "`c_custkey`", "`c_name`", "`c_address`", "`c_nationkey`", "`c_phone`", "`c_acctbal`", "`c_comment`" ],
    "cost" : 235.0
  }, {
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`c_address`"
    }, {
      "ref" : "`c_nationkey`",
      "expr" : "`c_nationkey`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`c_phone`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`c_acctbal`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`c_comment`"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 235.0
  }, {
    "pop" : "hive-scan",
    "@id" : 23,
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
    "@id" : 22,
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
    "child" : 23,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1620.0
  }, {
    "pop" : "filter",
    "@id" : 20,
    "child" : 22,
    "expr" : "booleanAnd(greater_than_or_equal_to(`o_orderdate`, cast( 762480000000 as DATE)) , less_than(`o_orderdate`, add(cast( 762480000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 17,
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hash-join",
    "@id" : 14,
    "left" : 18,
    "right" : 17,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_custkey`",
      "right" : "`o_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 14,
    "right" : 13,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_nationkey`",
      "right" : "`n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hive-scan",
    "@id" : 19,
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
    "columns" : [ "`l_orderkey`", "`l_extendedprice`", "`l_discount`", "`l_returnflag`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    }, {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    } ],
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "filter",
    "@id" : 12,
    "child" : 15,
    "expr" : "equal(`l_returnflag`, 'R') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1063.95
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 10,
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1063.95
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1063.95
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`c_acctbal`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`c_phone`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`c_address`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`c_comment`"
    }, {
      "ref" : "`$f7`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1063.95
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1055.637890625,
    "groupByExprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`c_acctbal`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`c_phone`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`c_address`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`c_comment`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f7`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`c_acctbal`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`c_address`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`c_phone`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`c_comment`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "top-n",
    "@id" : 5,
    "child" : 6,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`revenue`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "limit" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "limit",
    "@id" : 3,
    "child" : 4,
    "first" : 0,
    "last" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`c_acctbal`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`c_address`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`c_phone`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`c_comment`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 106.39500000000001
  } ]
}