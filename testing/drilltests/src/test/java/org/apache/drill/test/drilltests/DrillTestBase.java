/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.drill.test.drilltests;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.drill.test.framework.Cluster;
import org.apache.drill.test.framework.DrillQueryDispatcher;
import org.apache.drill.test.framework.DrillTestVerifier;
import org.apache.drill.test.framework.InputQueryFileHandler;
import org.apache.drill.test.framework.QueryDispatcher;
import org.apache.drill.test.framework.TestCaseModeler;
import org.apache.drill.test.framework.Utils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.log4j.Logger;
import org.testng.Assert;

/**
 * This is the test base class that defines test procedures. All test
 * implementations should extend this class and implement their own getCluster()
 * to retrieve cluster information.
 * 
 * @author Zhiyong Liu
 * 
 */
public abstract class DrillTestBase {
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());
  protected InputQueryFileHandler handler = null;
  protected QueryDispatcher dispatcher = null;
  protected static final String CONGREGATED_FILENAME = "/tmp/congregated.q";
  protected DateFormat dateFormat = new SimpleDateFormat(
      "yyyy/MM/dd HH:mm:ss.ssss");
  private static Map<String, String> drillProperties = Utils
      .getDrillTestProperties();
  protected static String DATA_PATH = drillProperties
      .get("DRILL_TEST_DATA_DIR");
  protected static String SQLLINE_COMMAND = drillProperties.get("DRILL_HOME")
      + "/bin/sqlline";
  protected static String SUBMIT_PLAN_COMMAND = drillProperties
      .get("DRILL_HOME") + "/bin/submit_plan";
  public static final String CLUSTER_NAME = drillProperties.get("CLUSTER_NAME");
  private static final String DRIVER_URL = "jdbc:drill:zk=local";
  protected static final String SMOKE_GROUP = "smoke";
  protected static final String REGRESSION_GROUP = "smoke";

  /**
   * Processes TestCaseModeler and passes information contained therein for test
   * execution.
   * 
   * @param modeler
   *          TestCaseModeler to run a test with.
   * @throws Exception
   */
  protected void runTest(TestCaseModeler modeler) throws Exception {
    List<TestCaseModeler.TestMatrix> matrices = modeler.getMatrices();
    String[] inputFileNames = new String[matrices.size()];
    String[] schemas = new String[matrices.size()];
    String[] outputFormats = new String[matrices.size()];
    String[] expectedFiles = new String[matrices.size()];
    String[] verificationTypes = new String[matrices.size()];
    int i = 0;
    for (TestCaseModeler.TestMatrix matrix : matrices) {
      inputFileNames[i] = matrix.getInputFile();
      schemas[i] = matrix.getSchema();
      outputFormats[i] = matrix.getOutputFormat();
      expectedFiles[i] = matrix.getExpectedFile();
      // TODO future releases may support multiple verification types for
      // each matrix
      verificationTypes[i] = matrix.getVerificationTypes().get(0);
      i++;
    }
    List<TestCaseModeler.DataSource> datasources = modeler.getDatasources();
    prepareData(datasources);
    testProcess(modeler.getTestId(), modeler.getDescription(),
        modeler.getSubmitType(), modeler.getQueryType(), inputFileNames,
        outputFormats, expectedFiles, schemas, verificationTypes);
  }

  private void prepareData(List<TestCaseModeler.DataSource> datasources)
      throws IOException {
    for (TestCaseModeler.DataSource datasource : datasources) {
      String mode = datasource.getMode();
      if (mode.equals("cp")) {
        hdfsCopy(datasource.getSource(), datasource.getDestination(), false);
      } else if (mode.equals("gen")) {
        // TODO
      }
    }
  }

  private void testProcess(String testId, String testDesc, String submitType,
      String queryType, String[] inputFileNames, String[] outputFormats,
      String[] expectedFiles, String[] schemas, String[] verificationTypes)
      throws Exception {
    logTestStart(testId, testDesc);
    String[] outputFileNames = generateOutputFileNames(inputFileNames, testId);
    handler = new InputQueryFileHandler(inputFileNames, outputFileNames,
        outputFormats);
    String queries = handler.congregateFiles(CONGREGATED_FILENAME);
    LOG.info("Submitting queries:\n" + queries);
    dispatcher = new DrillQueryDispatcher(schemas[0]);
    Date date1 = new Date();
    ResultSet[] resultSets = new ResultSet[inputFileNames.length];
    LOG.info("Query dispatch start time: " + dateFormat.format(date1));
    if (submitType.equals("sqlline")) {
      dispatcher.dispatchQueriesCLI(SQLLINE_COMMAND, CONGREGATED_FILENAME);
    } else {
      for (int i = 0; i < inputFileNames.length; i++) {
        if (submitType.equals("submit_plan")) {
          // TODO details of the implementation depends on how submit_plan works
          dispatcher.dispatchQueriesSubmitPlan(SUBMIT_PLAN_COMMAND,
              inputFileNames[i], queryType);
        } else if (submitType.equals("jdbc")) {
          resultSets[i] = dispatcher.dispatchQueriesJDBC(DRIVER_URL,
              inputFileNames[i]);
        }
      }
    }
    Date date2 = new Date();
    LOG.info("Query dispatch end time: " + dateFormat.format(date2));
    LOG.info("The execution time for the query: "
        + Utils.getDateDiff(date2, date1, "second") + " seconds.");
    boolean verified = false;
    if (submitType.equals("sqlline")) {
      verified = verifySqllineSubmitType(expectedFiles, outputFileNames,
          verificationTypes);
    } else if (submitType.equals("submit_plan")) {
      // TODO
    } else if (submitType.equals("jdbc")) {
      verified = verifyJdbcSubmitType(expectedFiles, resultSets,
          verificationTypes);
    }
    logTestEnd(testId, verified);
  }

  private String[] generateOutputFileNames(String[] inputFileNames,
      String testId) {
    String[] outputFileNames = new String[inputFileNames.length];
    for (int i = 0; i < outputFileNames.length; i++) {
      String inputFileName = inputFileNames[i];
      int index = inputFileName.lastIndexOf('/');
      String queryName = inputFileName.substring(index + 1);
      queryName = queryName.split("\\.")[0];
      outputFileNames[i] = "/tmp/" + testId + "_" + queryName + ".output";
    }
    return outputFileNames;
  }

  private boolean verifySqllineSubmitType(String[] expectedOutputs,
      String[] actualOutputs, String[] verificationTypes) throws IOException,
      InterruptedException {
    if (verificationTypes[0].equals("none")) {
      return true;
    }
    boolean verified = true;
    for (int i = 0; i < expectedOutputs.length; i++) {
      if (verificationTypes[0].equals("in-memory")) {
        verified = verified
            && DrillTestVerifier.fileComparisonVerify(expectedOutputs[i],
                actualOutputs[i], handler.getHeadSizes()[i]);
      } else {
        verified = verified
            || DrillTestVerifier.mapReduceVerify(expectedOutputs[i],
                actualOutputs[i]);
      }
      if (!verified) {
        return verified;
      }
    }
    return true;
  }

  private boolean verifyJdbcSubmitType(String[] expectedFiles,
      ResultSet[] resultSets, String[] verificationTypes) throws IOException,
      SQLException {
    if (verificationTypes[0].equals("none")) {
      return true;
    }
    boolean verified = true;
    for (int i = 0; i < expectedFiles.length; i++) {
      verified = verified
          && DrillTestVerifier.resultSetVerify(expectedFiles[i], resultSets[i]);
    }
    return verified;
  }

  abstract protected Cluster getCluster();

  private void logTestStart(String testId, String testDesc) throws IOException {
    LOG.info("+===========================================");
    LOG.info("Running test " + testId + ": " + testDesc + " on build "
        + getCluster().getVersion() + " on cluster " + CLUSTER_NAME);
  }

  private void logTestEnd(String testId, boolean verified) {
    if (verified) {
      LOG.info("Test " + testId + " was successfully verified.");
    } else {
      Assert.fail("Verification of test " + testId + " failed.");
    }
    LOG.info("Test " + testId + " completed.");
    LOG.info("+===========================================");
  }

  private void hdfsCopy(String src, String dest, boolean overWrite)
      throws IOException {
    FileSystem fs = FileSystem.get(new Configuration());
    Path srcPath = new Path(src);
    Path destPath = new Path(dest);
    if (!fs.exists(destPath) || overWrite) {
      fs.copyFromLocalFile(false, overWrite, srcPath, destPath);
    } else {
      LOG.info("The source file " + src
          + " already exists in destination.  Skipping the copy.");
    }
  }
}