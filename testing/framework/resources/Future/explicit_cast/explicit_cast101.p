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
    "@id" : 4,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/data"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
    "columns" : [ "`c_row`", "`c_timestamp`" ],
    "selectionRoot" : "/user/root/mondrian/data",
    "cost" : 23.0
  }, {
    "pop" : "filter",
    "@id" : 3,
    "child" : 4,
    "expr" : "not_equal(cast( (`c_row` ) as INT ), 12) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 11.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 11.5
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`EXPR$0`",
      "expr" : "cast( (`c_timestamp` ) as TIMESTAMP )"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 11.5
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 11.5
  } ]
}