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
    "@id" : 22,
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
    "columns" : [ "`ps_partkey`", "`ps_suppkey`" ],
    "cost" : 1134.0
  }, {
    "pop" : "filter",
    "@id" : 19,
    "child" : 22,
    "expr" : "isnotnull(`ps_suppkey`) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1020.6
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 16,
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1020.6
  }, {
    "pop" : "hive-scan",
    "@id" : 20,
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
    "columns" : [ "`s_suppkey`", "`s_comment`" ],
    "cost" : 13.0
  }, {
    "pop" : "filter",
    "@id" : 17,
    "child" : 20,
    "expr" : "like(`s_comment`, '%Customer%Complaints%') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 14,
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "project",
    "@id" : 12,
    "exprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    }, {
      "ref" : "`$f1`",
      "expr" : "true"
    } ],
    "child" : 14,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "hash-aggregate",
    "@id" : 10,
    "child" : 12,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.625,
    "groupByExprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "min(`$f1`) "
    } ]
  }, {
    "pop" : "hive-scan",
    "@id" : 23,
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
    "columns" : [ "`p_partkey`", "`p_brand`", "`p_type`", "`p_size`" ],
    "cost" : 232.0
  }, {
    "pop" : "project",
    "@id" : 21,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    }, {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    } ],
    "child" : 23,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 232.0
  }, {
    "pop" : "filter",
    "@id" : 18,
    "child" : 21,
    "expr" : "booleanAnd(not_equal(`p_brand`, 'Brand#21') , not(like(`p_type`, 'MEDIUM PLATED%') ) , booleanOr(equal(`p_size`, 38) , equal(`p_size`, 2) , equal(`p_size`, 8) , equal(`p_size`, 31) , equal(`p_size`, 44) , equal(`p_size`, 5) , equal(`p_size`, 14) , equal(`p_size`, 24) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 15,
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7.25
  }, {
    "pop" : "hash-join",
    "@id" : 13,
    "left" : 16,
    "right" : 15,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_partkey`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1020.6
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    }, {
      "ref" : "`ps_suppkey0`",
      "expr" : "`ps_suppkey`"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1020.6
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_suppkey0`",
      "right" : "`s_suppkey`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1020.6
  }, {
    "pop" : "filter",
    "@id" : 8,
    "child" : 9,
    "expr" : "not(istrue(`$f1`) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 255.15
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 7,
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 255.15
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 255.15
  }, {
    "pop" : "hash-aggregate",
    "@id" : 5,
    "child" : 6,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 239.203125,
    "groupByExprs" : [ {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 22.325625000000002,
    "groupByExprs" : [ {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`supplier_cnt`",
      "expr" : "count(`ps_suppkey`) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`supplier_cnt`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`p_brand`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`p_type`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`p_size`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5515
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5515
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`p_brand`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`p_size`"
    }, {
      "ref" : "`supplier_cnt`",
      "expr" : "`supplier_cnt`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5515
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5515
  } ]
}