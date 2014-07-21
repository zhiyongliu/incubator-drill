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
    "expr" : "booleanOr(booleanAnd(greater_than(`col0`, 9999) , greater_than(`col1`, 9999) , greater_than(`col2`, 9999) , greater_than(`col3`, 9999) , greater_than(`col4`, 9999) , greater_than(`col5`, 9999) , greater_than(`col6`, 9999) , greater_than(`col7`, 9999) , greater_than(`col8`, 9999) , greater_than(`col9`, 9999) , greater_than(`col10`, 9999) , greater_than(`col11`, 9999) , greater_than(`col12`, 9999) , greater_than(`col13`, 9999) , greater_than(`col14`, 9999) , greater_than(`col15`, 9999) , greater_than(`col16`, 9999) , greater_than(`col17`, 9999) , greater_than(`col18`, 9999) , greater_than(`col19`, 9999) , greater_than(`col20`, 9999) , greater_than(`col21`, 9999) , greater_than(`col22`, 9999) , greater_than(`col23`, 9999) , greater_than(`col24`, 9999) , greater_than(`col25`, 9999) , greater_than(`col26`, 9999) , greater_than(`col27`, 9999) , greater_than(`col28`, 9999) ) , booleanAnd(greater_than(`col29`, 9999) , greater_than(`col30`, 9999) , greater_than(`col31`, 9999) , greater_than(`col32`, 9999) , greater_than(`col33`, 9999) , greater_than(`col34`, 9999) , greater_than(`col35`, 9999) , greater_than(`col36`, 9999) , greater_than(`col37`, 9999) , greater_than(`col38`, 9999) , greater_than(`col39`, 9999) , greater_than(`col40`, 9999) , greater_than(`col41`, 9999) , greater_than(`col42`, 9999) , greater_than(`col43`, 9999) , greater_than(`col44`, 9999) , greater_than(`col45`, 9999) , greater_than(`col46`, 9999) , greater_than(`col47`, 9999) , greater_than(`col48`, 9999) , greater_than(`col49`, 9999) , greater_than(`col50`, 9999) , greater_than(`col51`, 9999) , greater_than(`col52`, 9999) , greater_than(`col53`, 9999) , greater_than(`col54`, 9999) , greater_than(`col55`, 9999) , greater_than(`col56`, 9999) , greater_than(`col57`, 9999) , greater_than(`col58`, 9999) , greater_than(`col59`, 9999) , greater_than(`col60`, 9999) , greater_than(`col61`, 9999) , greater_than(`col62`, 9999) , greater_than(`col63`, 9999) , greater_than(`col64`, 9999) , greater_than(`col65`, 9999) , greater_than(`col66`, 9999) , greater_than(`col67`, 9999) , greater_than(`col68`, 9999) , greater_than(`col69`, 9999) , greater_than(`col70`, 9999) , greater_than(`col71`, 9999) , greater_than(`col72`, 9999) , greater_than(`col73`, 9999) , greater_than(`col74`, 9999) , greater_than(`col75`, 9999) , greater_than(`col76`, 9999) , greater_than(`col77`, 9999) , greater_than(`col78`, 9999) , greater_than(`col79`, 9999) , greater_than(`col80`, 9999) , greater_than(`col81`, 9999) , greater_than(`col82`, 9999) , greater_than(`col83`, 9999) , greater_than(`col84`, 9999) , greater_than(`col85`, 9999) , greater_than(`col86`, 9999) , greater_than(`col87`, 9999) , greater_than(`col88`, 9999) , greater_than(`col89`, 9999) , greater_than(`col90`, 9999) , greater_than(`col91`, 9999) , greater_than(`col92`, 9999) , greater_than(`col93`, 9999) , greater_than(`col94`, 9999) , greater_than(`col95`, 9999) , greater_than(`col96`, 9999) , greater_than(`col97`, 9999) , greater_than(`col98`, 9999) , greater_than(`col99`, 9999) , greater_than(`col100`, 9999) , greater_than(`col101`, 9999) , greater_than(`col102`, 9999) , greater_than(`col103`, 9999) , greater_than(`col104`, 9999) , greater_than(`col105`, 9999) , greater_than(`col106`, 9999) , greater_than(`col107`, 9999) , greater_than(`col108`, 9999) , greater_than(`col109`, 9999) , greater_than(`col110`, 9999) , greater_than(`col111`, 9999) , greater_than(`col112`, 9999) , greater_than(`col113`, 9999) , greater_than(`col114`, 9999) , greater_than(`col115`, 9999) , greater_than(`col116`, 9999) , greater_than(`col117`, 9999) , greater_than(`col118`, 9999) , greater_than(`col119`, 9999) , greater_than(`col120`, 9999) , greater_than(`col121`, 9999) , greater_than(`col122`, 9999) , greater_than(`col123`, 9999) , greater_than(`col124`, 9999) , greater_than(`col125`, 9999) , greater_than(`col126`, 9999) , greater_than(`col127`, 9999) , greater_than(`col128`, 9999) , greater_than(`col129`, 9999) , greater_than(`col130`, 9999) , greater_than(`col131`, 9999) , greater_than(`col132`, 9999) , greater_than(`col133`, 9999) , greater_than(`col134`, 9999) , greater_than(`col135`, 9999) , greater_than(`col136`, 9999) , greater_than(`col137`, 9999) , greater_than(`col138`, 9999) , greater_than(`col139`, 9999) , greater_than(`col140`, 9999) , greater_than(`col141`, 9999) , greater_than(`col142`, 9999) , greater_than(`col143`, 9999) , greater_than(`col144`, 9999) , greater_than(`col145`, 9999) , greater_than(`col146`, 9999) , greater_than(`col147`, 9999) , greater_than(`col148`, 9999) , greater_than(`col149`, 9999) , greater_than(`col150`, 9999) , greater_than(`col151`, 9999) , greater_than(`col152`, 9999) , greater_than(`col153`, 9999) , greater_than(`col154`, 9999) , greater_than(`col155`, 9999) , greater_than(`col156`, 9999) , greater_than(`col157`, 9999) , greater_than(`col158`, 9999) , greater_than(`col159`, 9999) , greater_than(`col160`, 9999) , greater_than(`col161`, 9999) , greater_than(`col162`, 9999) , greater_than(`col163`, 9999) , greater_than(`col164`, 9999) , greater_than(`col165`, 9999) , greater_than(`col166`, 9999) , greater_than(`col167`, 9999) , greater_than(`col168`, 9999) , greater_than(`col169`, 9999) , greater_than(`col170`, 9999) , greater_than(`col171`, 9999) , greater_than(`col172`, 9999) , greater_than(`col173`, 9999) , greater_than(`col174`, 9999) , greater_than(`col175`, 9999) , greater_than(`col176`, 9999) , greater_than(`col177`, 9999) , greater_than(`col178`, 9999) , greater_than(`col179`, 9999) , greater_than(`col180`, 9999) , greater_than(`col181`, 9999) , greater_than(`col182`, 9999) , greater_than(`col183`, 9999) , greater_than(`col184`, 9999) , greater_than(`col185`, 9999) , greater_than(`col186`, 9999) , greater_than(`col187`, 9999) , greater_than(`col188`, 9999) , greater_than(`col189`, 9999) , greater_than(`col190`, 9999) , greater_than(`col191`, 9999) , greater_than(`col192`, 9999) , greater_than(`col193`, 9999) , greater_than(`col194`, 9999) , greater_than(`col195`, 9999) , greater_than(`col196`, 9999) , greater_than(`col197`, 9999) , greater_than(`col198`, 9999) , greater_than(`col199`, 9999) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 25000.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 25000.0
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
    }, {
      "ref" : "`col50`",
      "expr" : "`col50`"
    }, {
      "ref" : "`col51`",
      "expr" : "`col51`"
    }, {
      "ref" : "`col52`",
      "expr" : "`col52`"
    }, {
      "ref" : "`col53`",
      "expr" : "`col53`"
    }, {
      "ref" : "`col54`",
      "expr" : "`col54`"
    }, {
      "ref" : "`col55`",
      "expr" : "`col55`"
    }, {
      "ref" : "`col56`",
      "expr" : "`col56`"
    }, {
      "ref" : "`col57`",
      "expr" : "`col57`"
    }, {
      "ref" : "`col58`",
      "expr" : "`col58`"
    }, {
      "ref" : "`col59`",
      "expr" : "`col59`"
    }, {
      "ref" : "`col60`",
      "expr" : "`col60`"
    }, {
      "ref" : "`col61`",
      "expr" : "`col61`"
    }, {
      "ref" : "`col62`",
      "expr" : "`col62`"
    }, {
      "ref" : "`col63`",
      "expr" : "`col63`"
    }, {
      "ref" : "`col64`",
      "expr" : "`col64`"
    }, {
      "ref" : "`col65`",
      "expr" : "`col65`"
    }, {
      "ref" : "`col66`",
      "expr" : "`col66`"
    }, {
      "ref" : "`col67`",
      "expr" : "`col67`"
    }, {
      "ref" : "`col68`",
      "expr" : "`col68`"
    }, {
      "ref" : "`col69`",
      "expr" : "`col69`"
    }, {
      "ref" : "`col70`",
      "expr" : "`col70`"
    }, {
      "ref" : "`col71`",
      "expr" : "`col71`"
    }, {
      "ref" : "`col72`",
      "expr" : "`col72`"
    }, {
      "ref" : "`col73`",
      "expr" : "`col73`"
    }, {
      "ref" : "`col74`",
      "expr" : "`col74`"
    }, {
      "ref" : "`col75`",
      "expr" : "`col75`"
    }, {
      "ref" : "`col76`",
      "expr" : "`col76`"
    }, {
      "ref" : "`col77`",
      "expr" : "`col77`"
    }, {
      "ref" : "`col78`",
      "expr" : "`col78`"
    }, {
      "ref" : "`col79`",
      "expr" : "`col79`"
    }, {
      "ref" : "`col80`",
      "expr" : "`col80`"
    }, {
      "ref" : "`col81`",
      "expr" : "`col81`"
    }, {
      "ref" : "`col82`",
      "expr" : "`col82`"
    }, {
      "ref" : "`col83`",
      "expr" : "`col83`"
    }, {
      "ref" : "`col84`",
      "expr" : "`col84`"
    }, {
      "ref" : "`col85`",
      "expr" : "`col85`"
    }, {
      "ref" : "`col86`",
      "expr" : "`col86`"
    }, {
      "ref" : "`col87`",
      "expr" : "`col87`"
    }, {
      "ref" : "`col88`",
      "expr" : "`col88`"
    }, {
      "ref" : "`col89`",
      "expr" : "`col89`"
    }, {
      "ref" : "`col90`",
      "expr" : "`col90`"
    }, {
      "ref" : "`col91`",
      "expr" : "`col91`"
    }, {
      "ref" : "`col92`",
      "expr" : "`col92`"
    }, {
      "ref" : "`col93`",
      "expr" : "`col93`"
    }, {
      "ref" : "`col94`",
      "expr" : "`col94`"
    }, {
      "ref" : "`col95`",
      "expr" : "`col95`"
    }, {
      "ref" : "`col96`",
      "expr" : "`col96`"
    }, {
      "ref" : "`col97`",
      "expr" : "`col97`"
    }, {
      "ref" : "`col98`",
      "expr" : "`col98`"
    }, {
      "ref" : "`col99`",
      "expr" : "`col99`"
    }, {
      "ref" : "`col100`",
      "expr" : "`col100`"
    }, {
      "ref" : "`col101`",
      "expr" : "`col101`"
    }, {
      "ref" : "`col102`",
      "expr" : "`col102`"
    }, {
      "ref" : "`col103`",
      "expr" : "`col103`"
    }, {
      "ref" : "`col104`",
      "expr" : "`col104`"
    }, {
      "ref" : "`col105`",
      "expr" : "`col105`"
    }, {
      "ref" : "`col106`",
      "expr" : "`col106`"
    }, {
      "ref" : "`col107`",
      "expr" : "`col107`"
    }, {
      "ref" : "`col108`",
      "expr" : "`col108`"
    }, {
      "ref" : "`col109`",
      "expr" : "`col109`"
    }, {
      "ref" : "`col110`",
      "expr" : "`col110`"
    }, {
      "ref" : "`col111`",
      "expr" : "`col111`"
    }, {
      "ref" : "`col112`",
      "expr" : "`col112`"
    }, {
      "ref" : "`col113`",
      "expr" : "`col113`"
    }, {
      "ref" : "`col114`",
      "expr" : "`col114`"
    }, {
      "ref" : "`col115`",
      "expr" : "`col115`"
    }, {
      "ref" : "`col116`",
      "expr" : "`col116`"
    }, {
      "ref" : "`col117`",
      "expr" : "`col117`"
    }, {
      "ref" : "`col118`",
      "expr" : "`col118`"
    }, {
      "ref" : "`col119`",
      "expr" : "`col119`"
    }, {
      "ref" : "`col120`",
      "expr" : "`col120`"
    }, {
      "ref" : "`col121`",
      "expr" : "`col121`"
    }, {
      "ref" : "`col122`",
      "expr" : "`col122`"
    }, {
      "ref" : "`col123`",
      "expr" : "`col123`"
    }, {
      "ref" : "`col124`",
      "expr" : "`col124`"
    }, {
      "ref" : "`col125`",
      "expr" : "`col125`"
    }, {
      "ref" : "`col126`",
      "expr" : "`col126`"
    }, {
      "ref" : "`col127`",
      "expr" : "`col127`"
    }, {
      "ref" : "`col128`",
      "expr" : "`col128`"
    }, {
      "ref" : "`col129`",
      "expr" : "`col129`"
    }, {
      "ref" : "`col130`",
      "expr" : "`col130`"
    }, {
      "ref" : "`col131`",
      "expr" : "`col131`"
    }, {
      "ref" : "`col132`",
      "expr" : "`col132`"
    }, {
      "ref" : "`col133`",
      "expr" : "`col133`"
    }, {
      "ref" : "`col134`",
      "expr" : "`col134`"
    }, {
      "ref" : "`col135`",
      "expr" : "`col135`"
    }, {
      "ref" : "`col136`",
      "expr" : "`col136`"
    }, {
      "ref" : "`col137`",
      "expr" : "`col137`"
    }, {
      "ref" : "`col138`",
      "expr" : "`col138`"
    }, {
      "ref" : "`col139`",
      "expr" : "`col139`"
    }, {
      "ref" : "`col140`",
      "expr" : "`col140`"
    }, {
      "ref" : "`col141`",
      "expr" : "`col141`"
    }, {
      "ref" : "`col142`",
      "expr" : "`col142`"
    }, {
      "ref" : "`col143`",
      "expr" : "`col143`"
    }, {
      "ref" : "`col144`",
      "expr" : "`col144`"
    }, {
      "ref" : "`col145`",
      "expr" : "`col145`"
    }, {
      "ref" : "`col146`",
      "expr" : "`col146`"
    }, {
      "ref" : "`col147`",
      "expr" : "`col147`"
    }, {
      "ref" : "`col148`",
      "expr" : "`col148`"
    }, {
      "ref" : "`col149`",
      "expr" : "`col149`"
    }, {
      "ref" : "`col150`",
      "expr" : "`col150`"
    }, {
      "ref" : "`col151`",
      "expr" : "`col151`"
    }, {
      "ref" : "`col152`",
      "expr" : "`col152`"
    }, {
      "ref" : "`col153`",
      "expr" : "`col153`"
    }, {
      "ref" : "`col154`",
      "expr" : "`col154`"
    }, {
      "ref" : "`col155`",
      "expr" : "`col155`"
    }, {
      "ref" : "`col156`",
      "expr" : "`col156`"
    }, {
      "ref" : "`col157`",
      "expr" : "`col157`"
    }, {
      "ref" : "`col158`",
      "expr" : "`col158`"
    }, {
      "ref" : "`col159`",
      "expr" : "`col159`"
    }, {
      "ref" : "`col160`",
      "expr" : "`col160`"
    }, {
      "ref" : "`col161`",
      "expr" : "`col161`"
    }, {
      "ref" : "`col162`",
      "expr" : "`col162`"
    }, {
      "ref" : "`col163`",
      "expr" : "`col163`"
    }, {
      "ref" : "`col164`",
      "expr" : "`col164`"
    }, {
      "ref" : "`col165`",
      "expr" : "`col165`"
    }, {
      "ref" : "`col166`",
      "expr" : "`col166`"
    }, {
      "ref" : "`col167`",
      "expr" : "`col167`"
    }, {
      "ref" : "`col168`",
      "expr" : "`col168`"
    }, {
      "ref" : "`col169`",
      "expr" : "`col169`"
    }, {
      "ref" : "`col170`",
      "expr" : "`col170`"
    }, {
      "ref" : "`col171`",
      "expr" : "`col171`"
    }, {
      "ref" : "`col172`",
      "expr" : "`col172`"
    }, {
      "ref" : "`col173`",
      "expr" : "`col173`"
    }, {
      "ref" : "`col174`",
      "expr" : "`col174`"
    }, {
      "ref" : "`col175`",
      "expr" : "`col175`"
    }, {
      "ref" : "`col176`",
      "expr" : "`col176`"
    }, {
      "ref" : "`col177`",
      "expr" : "`col177`"
    }, {
      "ref" : "`col178`",
      "expr" : "`col178`"
    }, {
      "ref" : "`col179`",
      "expr" : "`col179`"
    }, {
      "ref" : "`col180`",
      "expr" : "`col180`"
    }, {
      "ref" : "`col181`",
      "expr" : "`col181`"
    }, {
      "ref" : "`col182`",
      "expr" : "`col182`"
    }, {
      "ref" : "`col183`",
      "expr" : "`col183`"
    }, {
      "ref" : "`col184`",
      "expr" : "`col184`"
    }, {
      "ref" : "`col185`",
      "expr" : "`col185`"
    }, {
      "ref" : "`col186`",
      "expr" : "`col186`"
    }, {
      "ref" : "`col187`",
      "expr" : "`col187`"
    }, {
      "ref" : "`col188`",
      "expr" : "`col188`"
    }, {
      "ref" : "`col189`",
      "expr" : "`col189`"
    }, {
      "ref" : "`col190`",
      "expr" : "`col190`"
    }, {
      "ref" : "`col191`",
      "expr" : "`col191`"
    }, {
      "ref" : "`col192`",
      "expr" : "`col192`"
    }, {
      "ref" : "`col193`",
      "expr" : "`col193`"
    }, {
      "ref" : "`col194`",
      "expr" : "`col194`"
    }, {
      "ref" : "`col195`",
      "expr" : "`col195`"
    }, {
      "ref" : "`col196`",
      "expr" : "`col196`"
    }, {
      "ref" : "`col197`",
      "expr" : "`col197`"
    }, {
      "ref" : "`col198`",
      "expr" : "`col198`"
    }, {
      "ref" : "`col199`",
      "expr" : "`col199`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 25000.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 25000.0
  } ]
}