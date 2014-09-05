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
    "pop" : "fs-scan",
    "@id" : 24,
    "files" : [ "maprfs:/drill/testdata/json_storage/part.tbl" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
        },
        "drillTestDir" : {
          "location" : "/drill/testdata/",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirAmplab" : {
          "location" : "/drill/testdata/amplab",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirP1" : {
          "location" : "/drill/testdata/p1tests",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirStress" : {
          "location" : "/drill/testdata/stress",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicit" : {
          "location" : "/drill/testdata/explicit_cast",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchema" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchemaHbase" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage",
          "writable" : true,
          "storageformat" : "json"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text",
          "writable" : true,
          "storageformat" : "text"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources/",
          "writable" : true,
          "storageformat" : "parquet"
        }
      },
      "formats" : {
        "psv" : {
          "type" : "text",
          "extensions" : [ "tbl" ],
          "delimiter" : "|"
        },
        "csv" : {
          "type" : "text",
          "extensions" : [ "csv" ],
          "delimiter" : ","
        },
        "tsv" : {
          "type" : "text",
          "extensions" : [ "tsv" ],
          "delimiter" : "\t"
        },
        "parquet" : {
          "type" : "parquet"
        },
        "json" : {
          "type" : "json"
        }
      }
    },
    "format" : {
      "type" : "text",
      "extensions" : [ "tbl" ],
      "delimiter" : "|"
    },
    "columns" : [ "`columns`" ],
    "selectionRoot" : "/drill/testdata/json_storage/part.tbl",
    "cost" : 230.0
  }, {
    "pop" : "filter",
    "@id" : 21,
    "child" : 24,
    "expr" : "booleanAnd(not_equal(cast( (`columns`[3] ) as VARCHAR(8) ), 'Brand#21') , not(like(`columns`[4], 'MEDIUM PLATED%') ) , booleanOr(equal(cast( (`columns`[5] ) as INT ), 38) , equal(cast( (`columns`[5] ) as INT ), 2) , equal(cast( (`columns`[5] ) as INT ), 8) , equal(cast( (`columns`[5] ) as INT ), 31) , equal(cast( (`columns`[5] ) as INT ), 44) , equal(cast( (`columns`[5] ) as INT ), 5) , equal(cast( (`columns`[5] ) as INT ), 14) , equal(cast( (`columns`[5] ) as INT ), 24) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7.1875
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 18,
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7.1875
  }, {
    "pop" : "project",
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`p_name`",
      "expr" : "`columns`[1]"
    }, {
      "ref" : "`p_mfgr`",
      "expr" : "`columns`[2]"
    }, {
      "ref" : "`p_brand`",
      "expr" : "`columns`[3]"
    }, {
      "ref" : "`p_type`",
      "expr" : "`columns`[4]"
    }, {
      "ref" : "`p_size`",
      "expr" : "cast( (`columns`[5] ) as INT )"
    }, {
      "ref" : "`p_container`",
      "expr" : "`columns`[6]"
    }, {
      "ref" : "`p_retailprice`",
      "expr" : "cast( (`columns`[7] ) as DECIMAL18(15, 2) )"
    }, {
      "ref" : "`p_comment`",
      "expr" : "`columns`[8]"
    } ],
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7.1875
  }, {
    "pop" : "fs-scan",
    "@id" : 23,
    "files" : [ "maprfs:/drill/testdata/json_storage/supplier.tbl" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
        },
        "drillTestDir" : {
          "location" : "/drill/testdata/",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirAmplab" : {
          "location" : "/drill/testdata/amplab",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirP1" : {
          "location" : "/drill/testdata/p1tests",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirStress" : {
          "location" : "/drill/testdata/stress",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicit" : {
          "location" : "/drill/testdata/explicit_cast",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchema" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchemaHbase" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage",
          "writable" : true,
          "storageformat" : "json"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text",
          "writable" : true,
          "storageformat" : "text"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources/",
          "writable" : true,
          "storageformat" : "parquet"
        }
      },
      "formats" : {
        "psv" : {
          "type" : "text",
          "extensions" : [ "tbl" ],
          "delimiter" : "|"
        },
        "csv" : {
          "type" : "text",
          "extensions" : [ "csv" ],
          "delimiter" : ","
        },
        "tsv" : {
          "type" : "text",
          "extensions" : [ "tsv" ],
          "delimiter" : "\t"
        },
        "parquet" : {
          "type" : "parquet"
        },
        "json" : {
          "type" : "json"
        }
      }
    },
    "format" : {
      "type" : "text",
      "extensions" : [ "tbl" ],
      "delimiter" : "|"
    },
    "columns" : [ "`columns`" ],
    "selectionRoot" : "/drill/testdata/json_storage/supplier.tbl",
    "cost" : 13.0
  }, {
    "pop" : "filter",
    "@id" : 20,
    "child" : 23,
    "expr" : "like(`columns`[6], '%Customer%Complaints%') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 17,
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`$f1`",
      "expr" : "true"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3.25
  }, {
    "pop" : "hash-aggregate",
    "@id" : 12,
    "child" : 14,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.625,
    "groupByExprs" : [ {
      "ref" : "`$f0`",
      "expr" : "`$f0`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "min(`$f1`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "`$f0`"
    }, {
      "ref" : "`$f11`",
      "expr" : "`$f1`"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "fs-scan",
    "@id" : 25,
    "files" : [ "maprfs:/drill/testdata/json_storage/partsupp.tbl" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
        },
        "drillTestDir" : {
          "location" : "/drill/testdata/",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirAmplab" : {
          "location" : "/drill/testdata/amplab",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirP1" : {
          "location" : "/drill/testdata/p1tests",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirStress" : {
          "location" : "/drill/testdata/stress",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicit" : {
          "location" : "/drill/testdata/explicit_cast",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchema" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchemaHbase" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage",
          "writable" : true,
          "storageformat" : "json"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text",
          "writable" : true,
          "storageformat" : "text"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources/",
          "writable" : true,
          "storageformat" : "parquet"
        }
      },
      "formats" : {
        "psv" : {
          "type" : "text",
          "extensions" : [ "tbl" ],
          "delimiter" : "|"
        },
        "csv" : {
          "type" : "text",
          "extensions" : [ "csv" ],
          "delimiter" : ","
        },
        "tsv" : {
          "type" : "text",
          "extensions" : [ "tsv" ],
          "delimiter" : "\t"
        },
        "parquet" : {
          "type" : "parquet"
        },
        "json" : {
          "type" : "json"
        }
      }
    },
    "format" : {
      "type" : "text",
      "extensions" : [ "tbl" ],
      "delimiter" : "|"
    },
    "columns" : [ "`columns`" ],
    "selectionRoot" : "/drill/testdata/json_storage/partsupp.tbl",
    "cost" : 1126.0
  }, {
    "pop" : "filter",
    "@id" : 22,
    "child" : 25,
    "expr" : "isnotnull(cast( (`columns`[1] ) as INT )) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1013.4
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 19,
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1013.4
  }, {
    "pop" : "project",
    "@id" : 16,
    "exprs" : [ {
      "ref" : "`ps_partkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`ps_suppkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    }, {
      "ref" : "`ps_availqty`",
      "expr" : "cast( (`columns`[2] ) as INT )"
    }, {
      "ref" : "`ps_supplycost`",
      "expr" : "cast( (`columns`[3] ) as DECIMAL18(15, 2) )"
    }, {
      "ref" : "`ps_comment`",
      "expr" : "`columns`[4]"
    } ],
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1013.4
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
    "cost" : 1013.4
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`$f1`",
      "expr" : "`ps_suppkey`"
    }, {
      "ref" : "`$f8`",
      "expr" : "`p_brand`"
    }, {
      "ref" : "`$f9`",
      "expr" : "`p_type`"
    }, {
      "ref" : "`$f10`",
      "expr" : "`p_size`"
    }, {
      "ref" : "`$f14`",
      "expr" : "`ps_suppkey`"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1013.4
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`$f14`",
      "right" : "`$f0`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1013.4
  }, {
    "pop" : "filter",
    "@id" : 8,
    "child" : 9,
    "expr" : "not(istrue(`$f11`) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 253.35
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 7,
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 253.35
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`p_brand`",
      "expr" : "`$f8`"
    }, {
      "ref" : "`p_type`",
      "expr" : "`$f9`"
    }, {
      "ref" : "`p_size`",
      "expr" : "`$f10`"
    }, {
      "ref" : "`$f1`",
      "expr" : "`$f1`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 253.35
  }, {
    "pop" : "hash-aggregate",
    "@id" : 5,
    "child" : 6,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 237.515625,
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
      "ref" : "`$f1`",
      "expr" : "`$f1`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 22.168125,
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
      "expr" : "count(`$f1`) "
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
    "cost" : 2.5335
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5335
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
    "cost" : 2.5335
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.5335
  } ]
}