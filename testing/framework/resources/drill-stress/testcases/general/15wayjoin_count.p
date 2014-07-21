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
    "pop" : "parquet-scan",
    "@id" : 48,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_orderkey`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 46,
    "child" : 48,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 44,
    "exprs" : [ {
      "ref" : "`l_orderkey0`",
      "expr" : "`l_orderkey`"
    } ],
    "child" : 46,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 57,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/supplier.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`s_suppkey`" ],
    "selectionRoot" : "/drill/testdata/stress/supplier.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 53,
    "child" : 57,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 56,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/partsupp.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`ps_partkey`", "`ps_suppkey`" ],
    "selectionRoot" : "/drill/testdata/stress/partsupp.parquet",
    "cost" : 80000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 52,
    "child" : 56,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 80000.0
  }, {
    "pop" : "hash-join",
    "@id" : 50,
    "left" : 53,
    "right" : 52,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_suppkey`",
      "right" : "`ps_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 80000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 18,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_shipdate`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 16,
    "child" : 18,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`l_shipdate0`",
      "expr" : "`l_shipdate`"
    } ],
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 61,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/part.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`p_partkey`" ],
    "selectionRoot" : "/drill/testdata/stress/part.parquet",
    "cost" : 20000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 58,
    "child" : 61,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 20000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 66,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/orders.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`o_orderkey`", "`o_custkey`" ],
    "selectionRoot" : "/drill/testdata/stress/orders.parquet",
    "cost" : 150000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 63,
    "child" : 66,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 8,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_receiptdate`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 6,
    "child" : 8,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 4,
    "exprs" : [ {
      "ref" : "`l_receiptdate0`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 28,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_commitdate`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 26,
    "child" : 28,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 24,
    "exprs" : [ {
      "ref" : "`l_commitdate0`",
      "expr" : "`l_commitdate`"
    } ],
    "child" : 26,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 67,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/customer.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`c_custkey`" ],
    "selectionRoot" : "/drill/testdata/stress/customer.parquet",
    "cost" : 15000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 64,
    "child" : 67,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 15000.0
  }, {
    "pop" : "hash-join",
    "@id" : 60,
    "left" : 64,
    "right" : 63,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_custkey`",
      "right" : "`o_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 55,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    } ],
    "child" : 60,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 33,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_extendedprice`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 31,
    "child" : 33,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 29,
    "exprs" : [ {
      "ref" : "`l_extendedprice0`",
      "expr" : "`l_extendedprice`"
    } ],
    "child" : 31,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 38,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_suppkey`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 36,
    "child" : 38,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 34,
    "exprs" : [ {
      "ref" : "`l_suppkey0`",
      "expr" : "`l_suppkey`"
    } ],
    "child" : 36,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 23,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_comment`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 21,
    "child" : 23,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 19,
    "exprs" : [ {
      "ref" : "`l_comment0`",
      "expr" : "`l_comment`"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 65,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem1.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_partkey`", "`l_orderkey`", "`l_suppkey`", "`l_extendedprice`", "`l_comment`", "`l_shipdate`", "`l_commitdate`", "`l_receiptdate`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem1.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 62,
    "child" : 65,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 59,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 62,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "hash-join",
    "@id" : 54,
    "left" : 59,
    "right" : 58,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 20000.0
  }, {
    "pop" : "hash-join",
    "@id" : 51,
    "left" : 55,
    "right" : 54,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 49,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
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
      "ref" : "`p_partkey`",
      "expr" : "`p_partkey`"
    } ],
    "child" : 51,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 47,
    "left" : 50,
    "right" : 49,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`ps_partkey`",
      "right" : "`p_partkey`"
    }, {
      "relationship" : "==",
      "left" : "`s_suppkey`",
      "right" : "`l_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 45,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 47,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 42,
    "left" : 45,
    "right" : 44,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_orderkey`",
      "right" : "`l_orderkey0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 40,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "`l_partkey`"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 42,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 13,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_receiptdate`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 11,
    "child" : 13,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 9,
    "exprs" : [ {
      "ref" : "`l_receiptdate0`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 11,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 43,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/lineitem2.parquet"
    } ],
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
      "type" : "parquet"
    },
    "columns" : [ "`l_partkey`" ],
    "selectionRoot" : "/drill/testdata/stress/lineitem2.parquet",
    "cost" : 1000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 41,
    "child" : 43,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "project",
    "@id" : 39,
    "exprs" : [ {
      "ref" : "`l_partkey0`",
      "expr" : "`l_partkey`"
    } ],
    "child" : 41,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1000.0
  }, {
    "pop" : "hash-join",
    "@id" : 37,
    "left" : 40,
    "right" : 39,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`l_partkey0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 35,
    "exprs" : [ {
      "ref" : "`l_suppkey`",
      "expr" : "`l_suppkey`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 37,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 32,
    "left" : 35,
    "right" : 34,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_suppkey`",
      "right" : "`l_suppkey0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 30,
    "exprs" : [ {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 32,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 27,
    "left" : 30,
    "right" : 29,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_extendedprice`",
      "right" : "`l_extendedprice0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 25,
    "exprs" : [ {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_commitdate`",
      "expr" : "`l_commitdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 27,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 22,
    "left" : 25,
    "right" : 24,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_commitdate`",
      "right" : "`l_commitdate0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 20,
    "exprs" : [ {
      "ref" : "`l_comment`",
      "expr" : "`l_comment`"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 17,
    "left" : 20,
    "right" : 19,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_comment`",
      "right" : "`l_comment0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`l_shipdate`",
      "expr" : "`l_shipdate`"
    }, {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 12,
    "left" : 15,
    "right" : 14,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_shipdate`",
      "right" : "`l_shipdate0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 7,
    "left" : 10,
    "right" : 9,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_receiptdate`",
      "right" : "`l_receiptdate0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`l_receiptdate`",
      "expr" : "`l_receiptdate`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "hash-join",
    "@id" : 3,
    "left" : 5,
    "right" : 4,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_receiptdate`",
      "right" : "`l_receiptdate0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "project",
    "@id" : 2,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "0"
    } ],
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 150000.0
  }, {
    "pop" : "streaming-aggregate",
    "@id" : 1,
    "child" : 2,
    "keys" : [ ],
    "exprs" : [ {
      "ref" : "`EXPR$0`",
      "expr" : "count(1) "
    } ],
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 15000.0
  } ]
}