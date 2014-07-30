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
    "@id" : 11,
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
    "columns" : [ "`c_custkey`" ],
    "cost" : 235.0
  }, {
    "pop" : "hive-scan",
    "@id" : 14,
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
    "columns" : [ "`o_orderkey`", "`o_custkey`", "`o_comment`" ],
    "cost" : 1620.0
  }, {
    "pop" : "filter",
    "@id" : 13,
    "child" : 14,
    "expr" : "not(like(`o_comment`, '%special%requests%') ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 12,
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_custkey`",
      "expr" : "`o_custkey`"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_custkey`",
      "right" : "`o_custkey`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 405.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 202.5,
    "groupByExprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "count(`o_orderkey`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 40.5
  }, {
    "pop" : "hash-aggregate",
    "@id" : 5,
    "child" : 6,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 20.25,
    "groupByExprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`custdist`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 4,
    "exprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    }, {
      "ref" : "`custdist`",
      "expr" : "`custdist`"
    } ],
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.05
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`custdist`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "DESC",
      "expr" : "`EXPR$1`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.05
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.05
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    }, {
      "ref" : "`custdist`",
      "expr" : "`custdist`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.05
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.05
  } ]
}