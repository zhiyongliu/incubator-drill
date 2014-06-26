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
package org.apache.drill.test.framework;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;

/**
 * This is the test base class that defines test procedures.
 * 
 * @author Zhiyong Liu
 * 
 */
public class DrillTestBase {
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());
  private QuerySubmitter submitter = null;
  protected InputQueryFileHandler handler = null;
  private static final String CONGREGATED_FILENAME = "/tmp/congregated.q";
  private DateFormat dateFormat = new SimpleDateFormat(
      "yyyy/MM/dd HH:mm:ss.ssss");
  protected static Map<String, String> drillProperties = Utils
      .getDrillTestProperties();
  private static final String SQLLINE_COMMAND = drillProperties
      .get("DRILL_HOME") + "/bin/sqlline";
  private static final String SUBMIT_PLAN_COMMAND = drillProperties
      .get("DRILL_HOME") + "/bin/submit_plan";
  private static int TIME_OUT_SECONDS = Integer.parseInt(drillProperties
      .get("TIME_OUT_SECONDS"));
  private Connection connection = null;
  private Statement statement = null;
  private ResultSet resultSet = null;
  private static Map<String, Pair> connectionMap = new HashMap<String, Pair>();
  private static String query = "";
  private static String summaryPassing = "\nPassing Tests:\n==============\n";
  private static String summaryFailed = "\nFailed Tests:\n=============\n";
  private String optionFile = null;
  private boolean restartDrillBit = false;

  @BeforeClass
  public void beforeClass() throws SQLException, ClassNotFoundException,
      IOException {
    Class.forName("org.apache.drill.jdbc.Driver");
    try {
      optionFile = System.getProperty("option.file");
    } catch (Exception e) {
      LOG.debug("No option file provided.");
    }
    try {
      restartDrillBit = Boolean.parseBoolean(System
          .getProperty("restart_between_query"));
    } catch (Exception e) {
      LOG.debug("No option file provided.");
    }
    try {
      TIME_OUT_SECONDS = Integer.parseInt(System.getProperty("timeout"));
    } catch (Exception e) {
      LOG.debug("No timeout specified");
    }
  }

  @AfterClass
  public void afterClass() throws SQLException {
    if (resultSet != null) {
      resultSet.close();
    }
    for (Map.Entry<String, Pair> entry : connectionMap.entrySet()) {
      Pair pair = entry.getValue();
      if (pair.getStatement() != null) {
        pair.getStatement().close();
      }
      if (pair.getConnection() != null) {
        pair.getConnection().close();
      }
    }
    LOG.info(summaryPassing);
    LOG.info(summaryFailed);
  }

  private void restartDrillBit() throws Exception {
    final String restartScript = "/root/drillAutomation/restartDrillBit.sh";
    if (!new File(restartScript).exists()) {
      return;
    }
    String[] command = { "/bin/bash", restartScript };
    LOG.info("Restarting drillbits");
    ProcessBuilder pb = new ProcessBuilder(command);
    pb.start().waitFor();
  }

  /**
   * Processes TestCaseModeler and passes information contained therein for test
   * execution.
   * 
   * @param modeler
   *          TestCaseModeler to run a test with.
   * @throws Exception
   */
  protected void runTest(TestCaseModeler modeler) throws Exception {
    TestVerifier.testStatus = TestVerifier.TEST_STATUS.PASS;
    if (restartDrillBit) {
      restartDrillBit();
    }
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
      if (matrix.getVerificationTypes().size() > 0) {
        verificationTypes[i] = matrix.getVerificationTypes().get(0);
      }
      i++;
    }
    List<TestCaseModeler.DataSource> datasources = modeler.getDatasources();
    prepareData(datasources);
    for (TestCaseModeler.TestMatrix matrix : matrices) {
      String schema = matrix.getSchema();
      if (!connectionMap.containsKey(schema) || restartDrillBit) {
        if (!restartDrillBit) {
          restartDrillBit();
        }
        String url = "jdbc:drill:schema=" + schema + ";zk="
            + Utils.getDrillTestProperties().get("ZOOKEEPERS");
        LOG.debug("Connecting to " + url);
        connection = DriverManager.getConnection(url);
        statement = connection.createStatement();
        connectionMap.put(schema, new Pair(connection, statement));
        if (optionFile != null) {
          String[] optionQueries = Utils.getSqlStatements(optionFile);
          for (String optionQuery : optionQueries) {
            submitter = new QuerySubmitter(schemas[0]);
            submitter.submitQueryJDBC(optionQuery, statement);
          }
        }
      }
    }
    testProcess(modeler.getTestId(), modeler.getDescription(),
        modeler.getSubmitType(), modeler.getQueryType(), inputFileNames,
        outputFormats, expectedFiles, schemas, verificationTypes);
    if (resultSet != null) {
      resultSet.close();
    }
  }

  private void prepareData(List<TestCaseModeler.DataSource> datasources)
      throws IOException {
    if (datasources == null) {
      return;
    }
    for (TestCaseModeler.DataSource datasource : datasources) {
      String mode = datasource.getMode();
      if (mode.equals("cp")) {
        hdfsCopy(datasource.getSource(), datasource.getDestination(), false);
      } else if (mode.equals("gen")) {
        int exitCode = 0;
        try {
          exitCode = Runtime.getRuntime().exec(datasource.getSource())
              .waitFor();
        } catch (Exception e) {
          LOG.error("Error: Failed to execute the command "
              + datasource.getSource() + ".");
        }
        if (exitCode != 0) {
          throw new RuntimeException("Error executing the command "
              + datasource.getSource() + " has return code " + exitCode);
        }
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
    submitter = new QuerySubmitter(schemas[0]);
    if (submitType.equals("sqlline")) {
      String queries = handler.congregateFiles(CONGREGATED_FILENAME);
      LOG.info("Submitting queries:\n" + queries);
      submitter.submitQueriesSqlline(SQLLINE_COMMAND, CONGREGATED_FILENAME);
    } else {
      for (int i = 0; i < inputFileNames.length; i++) {
        if (submitType.equals("submit_plan")) {
          submitter.submitQueriesSubmitPlan(SUBMIT_PLAN_COMMAND,
              inputFileNames[i], outputFileNames[i], queryType);
        } else {
          String[] queryStrings = Utils.getSqlStatements(inputFileNames[i]);
          int mid = queryStrings.length / 2;
          for (int j = 0; j < queryStrings.length; j++) {
            String queryString = queryStrings[j];
            if (verificationTypes[i] == null
                || verificationTypes[i].equalsIgnoreCase("none")) {
              submitter.executeQueryJDBC(queryString, inputFileNames[i],
                  statement);
            } else {
              LOG.info(inputFileNames[i] + " :\n" + queryString + "\n");
              if (j != mid) {
                submitter.submitQueryJDBC(queryString, statement);
                continue;
              }
              if (submitType.equals("jdbc")) {
                query = inputFileNames[i];
                try {
                  submitter.submitQueryJDBC(queryString, statement,
                      outputFileNames[i]);
                } catch (Exception e) {
                  continue;
                }
              } else {
                submitter.generatePlan(statement, inputFileNames[i],
                    queryString, submitType);
              }
            }
          }
        }
      }
    }
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.TIMEOUT) {
      summaryFailed += "***[timedout] " + query + "\n";
      logTestEnd(testId, TestVerifier.testStatus);
      return;
    }
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.EXECUTION_FAILURE) {
      summaryFailed += "***[execution failure] " + query + "\n";
      logTestEnd(testId, TestVerifier.testStatus);
      return;
    }
    if (submitType.equals("sqlline")) {
      TestVerifier.testStatus = TestVerifier.TEST_STATUS.PASS;
    } else if (submitType.equals("submit_plan")) {
      verifyAllOutputs(expectedFiles, outputFileNames);
    } else if (submitType.equals("jdbc")) {
      if (verificationTypes != null && verificationTypes.length != 0
          && !verificationTypes[0].equalsIgnoreCase("none")) {
        verifyAllOutputs(expectedFiles, outputFileNames);
      }
    }
    switch (TestVerifier.testStatus) {
    case PASS:
      summaryPassing += "*** " + query + "\n";
      break;
    case VERIFICATION_FAILURE:
      summaryFailed += "***[verification failure] " + query + "\n";
      break;
    default:
      break;
    }
    logTestEnd(testId, TestVerifier.testStatus);
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

  private void verifyAllOutputs(String[] expectedOutputs, String[] actualOutputs)
      throws IOException, InterruptedException {
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.PASS) {
      for (int i = 0; i < expectedOutputs.length; i++) {
        TestVerifier.TEST_STATUS status = TestVerifier.fileComparisonVerify(
            expectedOutputs[i], actualOutputs[i]);
        if (status != TestVerifier.TEST_STATUS.PASS) {
          TestVerifier.testStatus = status;
          break;
        }
      }
    }
  }

  private void logTestStart(String testId, String testDesc) throws IOException {
    LOG.info("\n\n+===========================================+");
    LOG.info("Test_Started: " + dateFormat.format(new Date()));
  }

  private void logTestEnd(String testId, TestVerifier.TEST_STATUS status) {
    String message = "";
    switch (status) {
    case EXECUTION_FAILURE:
      message = "Failed to execute.";
      break;
    case VERIFICATION_FAILURE:
      message = "Verification failed.";
      break;
    case TIMEOUT:
      message = "Timeout of " + TIME_OUT_SECONDS + " seconds exceeded.";
      break;
    default:
      break;
    }
    if (status != TestVerifier.TEST_STATUS.PASS) {
      LOG.info("\nTest_Failed: " + dateFormat.format(new Date()) + " - "
          + message);
    }
    LOG.info("END of Test");
    LOG.info("+===========================================+\n\n\n");
    if (status != TestVerifier.TEST_STATUS.PASS) {
      Assert.fail(message);
    }
  }

  private void hdfsCopy(String src, String dest, boolean overWrite)
      throws IOException {
    FileSystem fs = FileSystem.get(new Configuration());
    Path srcPath = new Path(src);
    Path destPath = new Path(dest);
    if (!fs.exists(destPath) || overWrite) {
      fs.copyFromLocalFile(false, overWrite, srcPath, destPath);
    } else {
      LOG.debug("The source file " + src
          + " already exists in destination.  Skipping the copy.");
    }
  }

  private class Pair {
    private Connection connection;
    private Statement statement;

    public Pair(Connection connection, Statement statement) {
      this.connection = connection;
      this.statement = statement;
    }

    public Connection getConnection() {
      return connection;
    }

    public Statement getStatement() {
      return statement;
    }
  }
}