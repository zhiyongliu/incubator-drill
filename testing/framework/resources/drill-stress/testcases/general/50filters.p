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
    "pop" : "filter",
    "@id" : 3,
    "child" : 4,
    "expr" : "booleanAnd(greater_than(`col0`, 9999) , greater_than(`col1`, 9999) , greater_than(`col2`, 9999) , greater_than(`col3`, 9999) , greater_than(`col4`, 9999) , greater_than(`col5`, 9999) , greater_than(`col6`, 9999) , greater_than(`col7`, 9999) , greater_than(`col8`, 9999) , greater_than(`col9`, 9999) , greater_than(`col10`, 9999) , greater_than(`col11`, 9999) , greater_than(`col12`, 9999) , greater_than(`col13`, 9999) , greater_than(`col14`, 9999) , greater_than(`col15`, 9999) , greater_than(`col16`, 9999) , greater_than(`col17`, 9999) , greater_than(`col18`, 9999) , greater_than(`col19`, 9999) , greater_than(`col20`, 9999) , greater_than(`col21`, 9999) , greater_than(`col22`, 9999) , greater_than(`col23`, 9999) , greater_than(`col24`, 9999) , greater_than(`col25`, 9999) , greater_than(`col26`, 9999) , greater_than(`col27`, 9999) , greater_than(`col28`, 9999) , greater_than(`col29`, 9999) , greater_than(`col30`, 9999) , greater_than(`col31`, 9999) , greater_than(`col32`, 9999) , greater_than(`col33`, 9999) , greater_than(`col34`, 9999) , greater_than(`col35`, 9999) , greater_than(`col36`, 9999) , greater_than(`col37`, 9999) , greater_than(`col38`, 9999) , greater_than(`col39`, 9999) , greater_than(`col40`, 9999) , greater_than(`col41`, 9999) , greater_than(`col42`, 9999) , greater_than(`col43`, 9999) , greater_than(`col44`, 9999) , greater_than(`col45`, 9999) , greater_than(`col46`, 9999) , greater_than(`col47`, 9999) , greater_than(`col48`, 9999) , greater_than(`col49`, 9999) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 8.881784197001252E-11
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`*`",
      "expr" : "`*`"
    }, {
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
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  } ]
}