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
    "@id" : 5,
    "entries" : [ {
      "path" : "maprfs:/drill/testdata/stress/200columns"
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
    "columns" : [ "`col0`", "`col1`", "`col2`", "`col3`", "`col4`", "`col5`", "`col6`", "`col7`", "`col8`", "`col9`", "`col10`", "`col11`", "`col12`", "`col13`", "`col14`", "`col15`", "`col16`", "`col17`", "`col18`", "`col19`", "`col20`", "`col21`", "`col22`", "`col23`", "`col24`", "`col25`", "`col26`", "`col27`", "`col28`", "`col29`", "`col30`", "`col31`", "`col32`", "`col33`", "`col34`", "`col35`", "`col36`", "`col37`", "`col38`", "`col39`", "`col40`", "`col41`", "`col42`", "`col43`", "`col44`", "`col45`", "`col46`", "`col47`", "`col48`", "`col49`" ],
    "selectionRoot" : "/drill/testdata/stress/200columns",
    "cost" : 100000.0
  }, {
    "pop" : "producer-consumer",
    "@id" : 4,
    "child" : 5,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 100000.0
  }, {
    "pop" : "project",
    "@id" : 3,
    "exprs" : [ {
      "ref" : "`col0`",
      "expr" : "`col0`"
    }, {
      "ref" : "`col1`",
      "expr" : "`col1`"
    }, {
      "ref" : "`col2`",
      "expr" : "`col2`"
    }, {
      "ref" : "`col3`",
      "expr" : "`col3`"
    }, {
      "ref" : "`col4`",
      "expr" : "`col4`"
    }, {
      "ref" : "`col5`",
      "expr" : "`col5`"
    }, {
      "ref" : "`col6`",
      "expr" : "`col6`"
    }, {
      "ref" : "`col7`",
      "expr" : "`col7`"
    }, {
      "ref" : "`col8`",
      "expr" : "`col8`"
    }, {
      "ref" : "`col9`",
      "expr" : "`col9`"
    }, {
      "ref" : "`col10`",
      "expr" : "`col10`"
    }, {
      "ref" : "`col11`",
      "expr" : "`col11`"
    }, {
      "ref" : "`col12`",
      "expr" : "`col12`"
    }, {
      "ref" : "`col13`",
      "expr" : "`col13`"
    }, {
      "ref" : "`col14`",
      "expr" : "`col14`"
    }, {
      "ref" : "`col15`",
      "expr" : "`col15`"
    }, {
      "ref" : "`col16`",
      "expr" : "`col16`"
    }, {
      "ref" : "`col17`",
      "expr" : "`col17`"
    }, {
      "ref" : "`col18`",
      "expr" : "`col18`"
    }, {
      "ref" : "`col19`",
      "expr" : "`col19`"
    }, {
      "ref" : "`col20`",
      "expr" : "`col20`"
    }, {
      "ref" : "`col21`",
      "expr" : "`col21`"
    }, {
      "ref" : "`col22`",
      "expr" : "`col22`"
    }, {
      "ref" : "`col23`",
      "expr" : "`col23`"
    }, {
      "ref" : "`col24`",
      "expr" : "`col24`"
    }, {
      "ref" : "`col25`",
      "expr" : "`col25`"
    }, {
      "ref" : "`col26`",
      "expr" : "`col26`"
    }, {
      "ref" : "`col27`",
      "expr" : "`col27`"
    }, {
      "ref" : "`col28`",
      "expr" : "`col28`"
    }, {
      "ref" : "`col29`",
      "expr" : "`col29`"
    }, {
      "ref" : "`col30`",
      "expr" : "`col30`"
    }, {
      "ref" : "`col31`",
      "expr" : "`col31`"
    }, {
      "ref" : "`col32`",
      "expr" : "`col32`"
    }, {
      "ref" : "`col33`",
      "expr" : "`col33`"
    }, {
      "ref" : "`col34`",
      "expr" : "`col34`"
    }, {
      "ref" : "`col35`",
      "expr" : "`col35`"
    }, {
      "ref" : "`col36`",
      "expr" : "`col36`"
    }, {
      "ref" : "`col37`",
      "expr" : "`col37`"
    }, {
      "ref" : "`col38`",
      "expr" : "`col38`"
    }, {
      "ref" : "`col39`",
      "expr" : "`col39`"
    }, {
      "ref" : "`col40`",
      "expr" : "`col40`"
    }, {
      "ref" : "`col41`",
      "expr" : "`col41`"
    }, {
      "ref" : "`col42`",
      "expr" : "`col42`"
    }, {
      "ref" : "`col43`",
      "expr" : "`col43`"
    }, {
      "ref" : "`col44`",
      "expr" : "`col44`"
    }, {
      "ref" : "`col45`",
      "expr" : "`col45`"
    }, {
      "ref" : "`col46`",
      "expr" : "`col46`"
    }, {
      "ref" : "`col47`",
      "expr" : "`col47`"
    }, {
      "ref" : "`col48`",
      "expr" : "`col48`"
    }, {
      "ref" : "`col49`",
      "expr" : "`col49`"
    } ],
    "child" : 4,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 100000.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 2,
    "child" : 3,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 99999.99999999991,
    "groupByExprs" : [ {
      "ref" : "`col0`",
      "expr" : "`col0`"
    }, {
      "ref" : "`col1`",
      "expr" : "`col1`"
    }, {
      "ref" : "`col2`",
      "expr" : "`col2`"
    }, {
      "ref" : "`col3`",
      "expr" : "`col3`"
    }, {
      "ref" : "`col4`",
      "expr" : "`col4`"
    }, {
      "ref" : "`col5`",
      "expr" : "`col5`"
    }, {
      "ref" : "`col6`",
      "expr" : "`col6`"
    }, {
      "ref" : "`col7`",
      "expr" : "`col7`"
    }, {
      "ref" : "`col8`",
      "expr" : "`col8`"
    }, {
      "ref" : "`col9`",
      "expr" : "`col9`"
    }, {
      "ref" : "`col10`",
      "expr" : "`col10`"
    }, {
      "ref" : "`col11`",
      "expr" : "`col11`"
    }, {
      "ref" : "`col12`",
      "expr" : "`col12`"
    }, {
      "ref" : "`col13`",
      "expr" : "`col13`"
    }, {
      "ref" : "`col14`",
      "expr" : "`col14`"
    }, {
      "ref" : "`col15`",
      "expr" : "`col15`"
    }, {
      "ref" : "`col16`",
      "expr" : "`col16`"
    }, {
      "ref" : "`col17`",
      "expr" : "`col17`"
    }, {
      "ref" : "`col18`",
      "expr" : "`col18`"
    }, {
      "ref" : "`col19`",
      "expr" : "`col19`"
    }, {
      "ref" : "`col20`",
      "expr" : "`col20`"
    }, {
      "ref" : "`col21`",
      "expr" : "`col21`"
    }, {
      "ref" : "`col22`",
      "expr" : "`col22`"
    }, {
      "ref" : "`col23`",
      "expr" : "`col23`"
    }, {
      "ref" : "`col24`",
      "expr" : "`col24`"
    }, {
      "ref" : "`col25`",
      "expr" : "`col25`"
    }, {
      "ref" : "`col26`",
      "expr" : "`col26`"
    }, {
      "ref" : "`col27`",
      "expr" : "`col27`"
    }, {
      "ref" : "`col28`",
      "expr" : "`col28`"
    }, {
      "ref" : "`col29`",
      "expr" : "`col29`"
    }, {
      "ref" : "`col30`",
      "expr" : "`col30`"
    }, {
      "ref" : "`col31`",
      "expr" : "`col31`"
    }, {
      "ref" : "`col32`",
      "expr" : "`col32`"
    }, {
      "ref" : "`col33`",
      "expr" : "`col33`"
    }, {
      "ref" : "`col34`",
      "expr" : "`col34`"
    }, {
      "ref" : "`col35`",
      "expr" : "`col35`"
    }, {
      "ref" : "`col36`",
      "expr" : "`col36`"
    }, {
      "ref" : "`col37`",
      "expr" : "`col37`"
    }, {
      "ref" : "`col38`",
      "expr" : "`col38`"
    }, {
      "ref" : "`col39`",
      "expr" : "`col39`"
    }, {
      "ref" : "`col40`",
      "expr" : "`col40`"
    }, {
      "ref" : "`col41`",
      "expr" : "`col41`"
    }, {
      "ref" : "`col42`",
      "expr" : "`col42`"
    }, {
      "ref" : "`col43`",
      "expr" : "`col43`"
    }, {
      "ref" : "`col44`",
      "expr" : "`col44`"
    }, {
      "ref" : "`col45`",
      "expr" : "`col45`"
    }, {
      "ref" : "`col46`",
      "expr" : "`col46`"
    }, {
      "ref" : "`col47`",
      "expr" : "`col47`"
    }, {
      "ref" : "`col48`",
      "expr" : "`col48`"
    }, {
      "ref" : "`col49`",
      "expr" : "`col49`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`EXPR$0`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`EXPR$0`",
      "expr" : "`EXPR$0`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 10000.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 10000.0
  } ]
}