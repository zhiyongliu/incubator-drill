# Instructions for running drill tests under the Apache drill test framework

## Structure of test resources tree:

<pre><code>
  testing
    |_ drilltests
       |_ resources
          |_ test_group1
          |_ datasources <- this is where small datasources or data generation tools reside
          |_ testcases
             |_ testcase1
             |_ testcase1.q <- this is the raw sql query file
             |_ testcase1.e_tsv <- this is the expected result set.  tsv indicates the format.
             |_ testcase1.json <- this is the test case definition file
</code></pre>

## Steps:

1. cd testing/drilltests/resources.
2. (Optional) Create a test group directory.
3. (Optional) Create datasources directory.
4. (Optional) Create testcases and testcase1 directories.
5. In the same directory, create the .q, .e and .json files.  These files must be in the same directory.


## Explanations of the files:

The expected file is assumed to contain the same result sets as what will be returned by the drill test execution.

The .json test definition file looks like the following:

<pre><code>
{
    "testId": "select",
    "type": "individual",
    "description": "Test sending the select query via submit_plan",
    "categories": [
        "smoke",
    ],
    "matrices": [
        {
            "query-file": "basic_query/testcases/select/select.q",
            "schema": "cp",
            "output-format": "tsv",
            "expected-file": "basic_query/testcases/select/select.e_tsv",
            "verification-type": [
                "in-memory"
            ]
        }
    ],
    "datasources": [
    ]
}
</code></pre>

"categories" is a list of tags that a test may belong to.

"query-file" specifies where the .q file is, relative to the resources directory.  An absolute path can also be specified, starting with '/'.

"schema" indicates which storage engine to use.  Valid values can be "cp", "dfs", and other supported engines by drill.

"output-format" tells the test framework what format the actual result should take, such as "table", "tsv", and "csv".

"expected-file": specifies where the .e file is, relative to the resources directory.  An absolute path can also be specified, starting with '/'.

"verification-type" picks the verification method to use.  For small result sets, in-memory will be used for record-by-record verification.  For large data, we will implement a map-reduce method for verification.

"matrices" is a list, so multiple queries can be submitted as a batch.

"datasources" contains information regarding how data sources are created and stored.  In the above example, it is an empty list, in which case, it is assumed that the data sources needed are already in place.  If you want to populate data at runtime, use the following format:

    "datasources": [
        {
            "mode": "cp",
            "src": "basic_query/datasources/nation.parquet",
            "dest": "nation.parquet"
        },
        {
            "mode": "datagen",
            "src": "datagen.sh param1 [param2 ... param_n]"
        }
    ]

Here, there are two ways to populate data.  The first one is to "cp", which does a simple cp of a small data file directly to the destination.  The second one runs user-defined scripts, with customized parameters including destinations.  If datasources are specified, the test framework will pick up the src file(s) and execute the actions accordingly.


## Executing tests:

To run a test, execute the following command in the drilltests directory:

mvn clean test -Dtest=org.apache.drill.test.drilltests.DrillTestsMapRCluster#drillPositiveTests -Dtest.def.sources=basic_query/testcases/select/select.json -Dtest.groups=smoke

