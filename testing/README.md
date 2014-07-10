# Instructions for running drill tests under the Apache drill test framework

## Setup and configurations:
### In the file framework/src/main/resources/drillTestConfig.properties, configure test environment as needed:
    1. DRILL_HOME is where drill is installed.
    2. DRILL_TEST_DATA_DIR points to the parent directory of the drill test data.  If a relative path is provided, it is expected to be under framework.
    3. HADOOP_INSTALL_LOC is the location of the hadoop system drill is running in.
    4. DRILL_TESTDATA specifies path to the distributed system where data is to be populated.
    5. ZOOKEEPERS is a list of zookeepers in the cluster.
    6. TIME_OUT_SECONDS specifies the timeout value for each test.  This is an interim solution and this value should be test suite specific.
    7. The three properties under Resource Tracking are for performance tests.

Add maven dependencies required by the project, if necessary.

cd to the testing directory, and execute mvn clean install.

## Structure of test resources tree:

    testing
      |_ framework
         |_ resources
            |_ test_group1
            |_ datasources <- this is where small datasources or data generation tools reside
            |_ testcases
               |_ testcase1
                 |_ testcase1.q <- this is the raw sql query file
                 |_ testcase1.e <- this is the expected result set
                 |_ testcase1.json <- this is the test case definition file

## Steps:

1. cd testing/framework/resources.
2. (Optional) Create a test group directory.
3. (Optional) Create datasources directory.
4. (Optional) Create testcases and testcase1 directories.
5. In the same directory, create the .q, .e and .json files.  The .q and .e files must come in pair, each of which should have the same basic name.  These files must be in the same directory.


## Explanations of the files:

The expected file contains the target result sets that actual results returned by drill test execution are to be compared with.

The .json test definition file looks like the following:

<pre><code>
{
    "testId": "join",
    "description": "Test join queries via jdbc",
    "submit-type": "jdbc",
    "query-type": "sql",
    "timeout": "20",
    "categories": [
        "smoke"
    ],
    "matrices": [
        {
            "query-file": ".*.q",
            "schema": "dfs",
            "output-format": "tsv",
            "expected-file": ".*.e",
            "verification-type": [
                "in-memory"
            ]
        }
    ],
    "datasources": [
    ]
}
</code></pre>

"submit-type" specifies the submit type.  Valid values are: jdbc, submit_plan, sqlline.  Optional; if not present, jdbc is used.

"query-type" specifies the query type.  Valid values are: sql, physical, logical.  Optional; if not present, sql is used.

"timeout" specifies the amount of time each query in this test suite is allocated.  If a query takes longer to finish, the framework stops the test and sets the test status to timeout.

"categories" is a list of tags that a test may belong to.

"query-file" specifies the query file extension; e.g., .*.q.

"schema" indicates which storage engine to use.  Valid values can be "cp", "dfs", and other supported engines by drill.

"output-format" tells the test framework what format the actual result should take, such as "table", "tsv", and "csv".

"expected-file": specifies the expected file extension; e.g., .*.e.

"verification-type" picks which verification method(s) to use.  For small result sets, in-memory will be used for record-by-record verification.  For large data, we will implement a map-reduce method for verification.  If the list is left empty, no verifications will be performed for the test.

"matrices" is a list, so multiple queries can be submitted as a batch.

"datasources" contains information regarding how data sources are created and stored.  In the above example, it is an empty list, in which case it is assumed that the data sources needed are already in place.  If you want to populate data at runtime, use the following format:

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

Here, there are two ways to populate data.  The first one is "cp", which does a simple copy of a small data file directly to the destination.  The second one runs user-defined scripts, with customized parameters including destinations.  If datasources are specified, the test framework will pick up the src file(s) and execute the actions accordingly.


## Executing tests:

To run a test, execute the following command in the framework directory:

    mvn clean test -Dtest=org.apache.drill.test.framework.DrillTests#positiveTests -Dtest.def.sources=basic_query/testcases/select/select.json -Dtest.groups=smoke

A wrapping script is also provided, so that you can execute tests using this command:

    ./runtests.sh -c positiveTests -s basic_query/testcases/select/select.json -g smoke
    ./runtests.sh -c positiveTests -s amplab/jdbc -g smoke
    ./runtests.sh -c positiveTests -s p1tests/testcases -g smoke

See the runtests.sh script for detailed usage.
