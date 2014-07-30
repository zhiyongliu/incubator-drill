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
    "@id" : 20,
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
    "@id" : 17,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`n_name`"
    } ],
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "filter",
    "@id" : 14,
    "child" : 17,
    "expr" : "equal(`n_name`, 'KENYA') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.3
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 11,
    "child" : 14,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "hive-scan",
    "@id" : 37,
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
    "@id" : 34,
    "child" : 37,
    "expr" : "like(`p_name`, 'antique%') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 31,
    "child" : 34,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "project",
    "@id" : 27,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    } ],
    "child" : 31,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 24,
    "child" : 27,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 29.0,
    "groupByExprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hive-scan",
    "@id" : 42,
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
    "pop" : "project",
    "@id" : 39,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`ps_partkey0`",
      "expr" : "`ps_partkey`"
    } ],
    "child" : 42,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "hive-scan",
    "@id" : 15,
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
    "columns" : [ "`s_suppkey`", "`s_name`", "`s_address`", "`s_nationkey`" ],
    "cost" : 13.0
  }, {
    "pop" : "project",
    "@id" : 12,
    "exprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    }, {
      "ref" : "`s_name`",
      "expr" : "`s_name`"
    }, {
      "ref" : "`s_address`",
      "expr" : "`s_address`"
    }, {
      "ref" : "`s_nationkey`",
      "expr" : "`s_nationkey`"
    } ],
    "child" : 15,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 12,
    "right" : 11,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_nationkey`",
      "right" : "`n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`s_name`",
      "expr" : "`s_name`"
    }, {
      "ref" : "`s_address`",
      "expr" : "`s_address`"
    }, {
      "ref" : "`s_suppkey`",
      "expr" : "`s_suppkey`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "hive-scan",
    "@id" : 45,
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
    "@id" : 44,
    "child" : 45,
    "expr" : "like(`p_name`, 'antique%') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 43,
    "child" : 44,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "project",
    "@id" : 41,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    } ],
    "child" : 43,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 58.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 38,
    "child" : 41,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 29.0,
    "groupByExprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-join",
    "@id" : 35,
    "left" : 39,
    "right" : 38,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_partkey0`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "project",
    "@id" : 32,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "child" : 35,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 29,
    "child" : 32,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 850.5,
    "groupByExprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hive-scan",
    "@id" : 28,
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
    "columns" : [ "`ps_partkey`", "`ps_suppkey`", "`ps_availqty`" ],
    "cost" : 1134.0
  }, {
    "pop" : "project",
    "@id" : 25,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`ps_availqty`",
      "expr" : "`ps_availqty`"
    }, {
      "ref" : "`ps_partkey0`",
      "expr" : "`ps_partkey`"
    } ],
    "child" : 28,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "hash-join",
    "@id" : 22,
    "left" : 25,
    "right" : 24,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_partkey0`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "project",
    "@id" : 19,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`ps_availqty`",
      "expr" : "`ps_availqty`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "hive-scan",
    "@id" : 40,
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
    "columns" : [ "`l_partkey`", "`l_suppkey`", "`l_quantity`", "`l_shipdate`" ],
    "cost" : 7093.0
  }, {
    "pop" : "project",
    "@id" : 36,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    } ],
    "child" : 40,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7093.0
  }, {
    "pop" : "filter",
    "@id" : 33,
    "child" : 36,
    "expr" : "booleanAnd(greater_than_or_equal_to(`l_shipdate`, cast( 725846400000 as DATE)) , less_than(`l_shipdate`, add(cast( 725846400000 as DATE), cast( 'P12M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1773.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 30,
    "child" : 33,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1773.25
  }, {
    "pop" : "hash-join",
    "@id" : 26,
    "left" : 30,
    "right" : 29,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`ps_partkey`"
    }, {
      "relationship" : "==",
      "left" : "`l_suppkey`",
      "right" : "`ps_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1773.25
  }, {
    "pop" : "project",
    "@id" : 23,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    } ],
    "child" : 26,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1773.25
  }, {
    "pop" : "hash-aggregate",
    "@id" : 21,
    "child" : 23,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1329.9375,
    "groupByExprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f2`",
      "expr" : "sum(`l_quantity`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`ps_partkey0`",
      "expr" : "`ps_partkey`"
    }, {
      "ref" : "`ps_suppkey0`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`$f2`",
      "expr" : "`$f2`"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 177.325
  }, {
    "pop" : "hash-join",
    "@id" : 16,
    "left" : 19,
    "right" : 18,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_partkey`",
      "right" : "`ps_partkey0`"
    }, {
      "relationship" : "==",
      "left" : "`ps_suppkey`",
      "right" : "`ps_suppkey0`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1134.0
  }, {
    "pop" : "filter",
    "@id" : 13,
    "child" : 16,
    "expr" : "booleanAnd(true, greater_than(`ps_availqty`, cast( (multiply(0.5, `$f2`)  ) as FLOAT8 )) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 567.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 10,
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 567.0
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "child" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 567.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 6,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5,
    "groupByExprs" : [ {
      "ref" : "`ps_suppkey`",
      "expr" : "`ps_suppkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-join",
    "@id" : 5,
    "left" : 7,
    "right" : 6,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_suppkey`",
      "right" : "`ps_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  }, {
    "pop" : "project",
    "@id" : 4,
    "exprs" : [ {
      "ref" : "`s_name`",
      "expr" : "`s_name`"
    }, {
      "ref" : "`s_address`",
      "expr" : "`s_address`"
    } ],
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`s_name`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`s_name`",
      "expr" : "`s_name`"
    }, {
      "ref" : "`s_address`",
      "expr" : "`s_address`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 283.5
  } ]
}