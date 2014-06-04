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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
  private static final int TIME_OUT_SECONDS = Integer.parseInt(drillProperties
      .get("TIME_OUT_SECONDS"));
  private Connection connection = null;
  private Statement statement = null;
  private ResultSet resultSet = null;
  private static Map<String, Pair> connectionMap = new HashMap<String, Pair>();
  private static String query = "";
  private static String summaryPassing = "\nPassing Tests:\n==============\n";
  private static String summaryFailed = "\nFailed Tests:\n=============\n";
  private static boolean verified = true;
  private String optionFile = null;
  private boolean restartDrillBit = false;

  @BeforeClass
  public void beforeClass() throws SQLException, ClassNotFoundException,
      IOException {
    Class.forName("org.apache.drill.jdbc.Driver");
    try {
      optionFile = System.getProperty("option.file");
    } catch (Exception e) {
      LOG.info("No option file provided.");
    }
    try {
      restartDrillBit = Boolean.parseBoolean(System
          .getProperty("restart_between_query"));
    } catch (Exception e) {
      LOG.info("No option file provided.");
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
    String[] command = { "/bin/bash",
        "/root/drillAutomation/restartDrillBit.sh" };
    ProcessBuilder pb = new ProcessBuilder(command);
    Process p = pb.start();
    BufferedReader br = new BufferedReader(new InputStreamReader(
        p.getInputStream()));
    String line;

    System.out.println("Output of running " + command + " is: ");
    while ((line = br.readLine()) != null) {
      System.out.println(line);
    }
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
        String url = "jdbc:drill:schema=" + schema + ";zk="
            + Utils.getDrillTestProperties().get("ZOOKEEPERS");
        LOG.info("Connecting to " + url);
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
    verified = true;
    boolean timedOut = false;
    logTestStart(testId, testDesc);
    String[] outputFileNames = generateOutputFileNames(inputFileNames, testId);
    handler = new InputQueryFileHandler(inputFileNames, outputFileNames,
        outputFormats);
    submitter = new QuerySubmitter(schemas[0]);
    Date date1 = new Date();
    List<Map<ColumnList, Integer>> resultSets = new ArrayList<Map<ColumnList, Integer>>();
    LOG.info("Query submit start time: " + dateFormat.format(date1));
    RunThread runThread = new RunThread(submitType, inputFileNames,
        outputFileNames, queryType, resultSets, verificationTypes);
    runThread.start();
    runThread.join(TIME_OUT_SECONDS * 1000);
    if (runThread.isAlive()) {
      LOG.warn("Drill didn't complete query within " + TIME_OUT_SECONDS
          + " seconds.");
      verified = false;
      timedOut = true;
      runThread.interrupt();
      summaryFailed += "***[timedout] " + query + "\n";
      logTestEnd(testId, verified, timedOut);
      return;
    }
    Date date2 = new Date();
    LOG.info("Query submit end time: " + dateFormat.format(date2));
    LOG.info("The execution time for the query: "
        + Utils.getDateDiff(date2, date1, "second") + " seconds.");
    if (submitType.equals("sqlline")) {
      verified = true;
    } else if (submitType.equals("submit_plan")) {
      verified = verified && verifyAllOutputs(expectedFiles, outputFileNames);
    } else if (submitType.equals("jdbc")) {
      if (verificationTypes != null && verificationTypes.length != 0
          && !verificationTypes[0].equalsIgnoreCase("none")) {
        verified = verified && verifyAllOutputs(expectedFiles, outputFileNames);
      }
    }
    if (verified) {
      summaryPassing += "*** " + query + "\n";
    } else {
      summaryFailed += "*** " + query + "\n";
    }
    logTestEnd(testId, verified, timedOut);
  }

  private class RunThread extends Thread {
    String submitType;
    String[] inputFileNames;
    String[] outputFileNames;
    String queryType;
    String[] verificationTypes;

    public RunThread(String submitType, String[] inputFileNames,
        String[] outputFileNames, String queryType,
        List<Map<ColumnList, Integer>> resultSets, String[] verificationTypes) {
      this.submitType = submitType;
      this.inputFileNames = inputFileNames;
      this.outputFileNames = outputFileNames;
      this.queryType = queryType;
      this.verificationTypes = verificationTypes;
    }

    @Override
    public void run() {
      try {
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
                  LOG.info("Submitting query:\n" + inputFileNames[i] + " : "
                      + queryString);
                  if (j != mid) {
                    submitter.submitQueryJDBC(queryString, statement);
                    continue;
                  }
                  if (submitType.equals("jdbc")) {
                    query = inputFileNames[i] + " : " + queryString;
                    try {
                      submitter.submitQueryJDBC(queryString, statement,
                          outputFileNames[i]);
                    } catch (Exception e) {
                      continue;
                    }
                  } else {
                    if (submitType.equals("gen-physical")) {
                      submitter.generatePlan(statement, inputFileNames[i],
                          queryString, "physical");
                    } else if (submitType.equals("gen-logical")) {
                      submitter.generatePlan(statement, inputFileNames[i],
                          queryString, "logical");
                    }
                  }
                }
              }
            }
          }
        }
      } catch (Exception e) {
        verified = false;
      }
    }
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

  private boolean verifyAllOutputs(String[] expectedOutputs,
      String[] actualOutputs) throws IOException, InterruptedException {
    boolean verified = true;
    for (int i = 0; i < expectedOutputs.length; i++) {
      verified = verified
          && TestVerifier.fileComparisonVerify(expectedOutputs[i],
              actualOutputs[i]);
      if (!verified) {
        return verified;
      }
    }
    return true;
  }

  private void logTestStart(String testId, String testDesc) throws IOException {
    LOG.info("+===========================================");
  }

  private void logTestEnd(String testId, boolean verified, boolean timedOut) {
    if (verified) {
      LOG.info("Test " + testId + " was successfully verified.");
    } else {
      if (!timedOut) {
        Assert.fail("Verification of test " + testId + " failed.");
      } else {
        Assert.fail("Test failed through timeout.");
      }
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