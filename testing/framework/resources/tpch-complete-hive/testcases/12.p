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
    "@id" : 8,
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
    "columns" : [ "`o_orderkey`", "`o_orderpriority`" ],
    "cost" : 1620.0
  }, {
    "pop" : "hive-scan",
    "@id" : 11,
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
    "columns" : [ "`l_orderkey`", "`l_shipdate`", "`l_commitdate`", "`l_receiptdate`", "`l_shipmode`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    }, {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    } ],
    "child" : 11,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "filter",
    "@id" : 9,
    "child" : 10,
    "expr" : "booleanAnd(booleanOr(equal(`l_shipmode`, 'TRUCK') , equal(`l_shipmode`, 'REG AIR') ) , less_than(`l_commitdate`, `l_receiptdate`) , less_than(`l_shipdate`, `l_commitdate`) , greater_than_or_equal_to(`l_receiptdate`, cast( 757382400000 as DATE)) , less_than(`l_receiptdate`, add(cast( 757382400000 as DATE), cast( 'P12M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 110.828125
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 7,
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 110.828125
  }, {
    "pop" : "hash-join",
    "@id" : 6,
    "left" : 8,
    "right" : 7,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1620.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    }, {
      "ref" : "`$f1`",
      "expr" : " ( if (booleanOr(equal(`o_orderpriority`, '1-URGENT') , equal(`o_orderpriority`, '2-HIGH') )  ) then (1 )  else (0 )  end  ) "
    }, {
      "ref" : "`$f2`",
      "expr" : " ( if (booleanAnd(not_equal(`o_orderpriority`, '1-URGENT') , not_equal(`o_orderpriority`, '2-HIGH') )  ) then (1 )  else (0 )  end  ) "
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1620.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 810.0,
    "groupByExprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`high_line_count`",
      "expr" : "sum(`$f1`) "
    }, {
      "ref" : "`low_line_count`",
      "expr" : "sum(`$f2`) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`l_shipmode`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.0
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    }, {
      "ref" : "`high_line_count`",
      "expr" : "`high_line_count`"
    }, {
      "ref" : "`low_line_count`",
      "expr" : "`low_line_count`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.0
  } ]
}