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
    "@id" : 9,
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
    "columns" : [ "`l_quantity`", "`l_extendedprice`", "`l_discount`", "`l_tax`", "`l_returnflag`", "`l_linestatus`", "`l_shipdate`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    }, {
      "ref" : "`l_tax`",
      "expr" : "`l_tax`"
    }, {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "filter",
    "@id" : 7,
    "child" : 8,
    "expr" : "less_than_or_equal_to(`l_shipdate`, subtract(cast( 912470400000 as DATE), cast( 'P120D' as INTERVALDAY)) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3546.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 6,
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3546.5
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`$f4`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    }, {
      "ref" : "`$f5`",
      "expr" : "multiply(multiply(`l_extendedprice`, subtract(1, `l_discount`) ) , add(1, `l_tax`) ) "
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3546.5
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2659.875,
    "groupByExprs" : [ {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`sum_qty`",
      "expr" : "sum(`l_quantity`) "
    }, {
      "ref" : "`sum_base_price`",
      "expr" : "sum(`l_extendedprice`) "
    }, {
      "ref" : "`sum_disc_price`",
      "expr" : "sum(`$f4`) "
    }, {
      "ref" : "`sum_charge`",
      "expr" : "sum(`$f5`) "
    }, {
      "ref" : "`avg_qty`",
      "expr" : "avg(`l_quantity`) "
    }, {
      "ref" : "`avg_price`",
      "expr" : "avg(`l_extendedprice`) "
    }, {
      "ref" : "`avg_disc`",
      "expr" : "avg(`l_discount`) "
    }, {
      "ref" : "`count_order`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`l_returnflag`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`l_linestatus`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 354.65
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 354.65
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    }, {
      "ref" : "`sum_qty`",
      "expr" : "`sum_qty`"
    }, {
      "ref" : "`sum_base_price`",
      "expr" : "`sum_base_price`"
    }, {
      "ref" : "`sum_disc_price`",
      "expr" : "`sum_disc_price`"
    }, {
      "ref" : "`sum_charge`",
      "expr" : "`sum_charge`"
    }, {
      "ref" : "`avg_qty`",
      "expr" : "`avg_qty`"
    }, {
      "ref" : "`avg_price`",
      "expr" : "`avg_price`"
    }, {
      "ref" : "`avg_disc`",
      "expr" : "`avg_disc`"
    }, {
      "ref" : "`count_order`",
      "expr" : "`count_order`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 354.65
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 354.65
  } ]
}