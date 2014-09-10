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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
  String drillOutputDirName = drillProperties.get("DRILL_OUTPUT_DIR");
  private Connection connection = null;
  private Statement statement = null;
  private ResultSet resultSet = null;
  private static Map<String, Pair> connectionMap = new HashMap<String, Pair>();
  private static String query = "";
  private static String summaryPassing = "\nPassing Tests:\n==============\n";
  private static String summaryFailed = "\nFailed Tests:\n=============\n";
  private String optionFile = null;
  private boolean restartDrillBit = false;
  private static long executionTime = QuerySubmitter.TIMEOUT_SECONDS;
  private String ipAddressPlugin = drillProperties
      .get("DRILL_STORAGE_PLUGIN_SERVER");
  private String pluginContent = "";
  private boolean loadPluginTemplate = true;

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
      executionTime = Integer.parseInt(System.getProperty("timeout"));
    } catch (Exception e) {
      LOG.debug("No timeout specified");
    }
    String loadPluginTemplateProperty = System
        .getProperty("load.plugin.template");
    if (loadPluginTemplateProperty != null) {
      loadPluginTemplate = Boolean.valueOf(loadPluginTemplateProperty);
    }
    if (loadPluginTemplate) {
      try {
        String filename = System.getProperty("user.dir")
            + "/src/main/resources/dfs-storage-plugin.template";
        pluginContent = Utils.getExistingDrillStoragePlugin(ipAddressPlugin,
            "dfs");
        Utils.updateDrillStoragePlugin(filename, ipAddressPlugin, "dfs");
      } catch (Exception e) {
        Assert.fail("Error: Failed to uplaod dfs storage plugin.");
      }
    }
  }

  @AfterClass
  public void afterClass() throws Exception {
    if (loadPluginTemplate) {
      Utils.postDrillStoragePlugin(pluginContent, ipAddressPlugin, "dfs");
      if (resultSet != null) {
        resultSet.close();
      }
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
      String url = "";
      if (!connectionMap.containsKey(schema) || restartDrillBit) {
        url = "jdbc:drill:schema=" + schema + ";zk="
            + Utils.getDrillTestProperties().get("ZOOKEEPERS");
        LOG.debug("Connecting to " + url);
        connection = DriverManager.getConnection(url);
        statement = connection.createStatement();
        connectionMap.put(schema, new Pair(connection, statement));
      } else {
        statement = connectionMap.get(schema).getStatement();
      }
      if (optionFile != null) {
        String[] optionQueries = Utils.getSqlStatements(optionFile);
        for (String optionQuery : optionQueries) {
          submitter = new QuerySubmitter(schema);
          submitter.submitQueryJDBC(optionQuery, statement,
              QuerySubmitter.TIMEOUT_SECONDS);
        }
      }
    }
    testProcess(modeler.getTestId(), modeler.getDescription(),
        modeler.getSubmitType(), modeler.getQueryType(), modeler.getTimeout(),
        inputFileNames, outputFormats, expectedFiles, schemas,
        verificationTypes);
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
      String queryType, String timeout, String[] inputFileNames,
      String[] outputFormats, String[] expectedFiles, String[] schemas,
      String[] verificationTypes) throws Exception {
    logTestStart();
    String[] outputFileNames = generateOutputFileNames(inputFileNames, testId,
        false);
    String[] planFileNames = generateOutputFileNames(inputFileNames, testId,
        true);
    List<List<String>> allColumnLabels = new ArrayList<List<String>>();
    List<Map<String, String>> allOrderByColumns = new ArrayList<Map<String, String>>();
    boolean[] areOrderByQueries = new boolean[inputFileNames.length];
    handler = new InputQueryFileHandler(inputFileNames, outputFileNames,
        outputFormats);
    try {
      executionTime = Integer.parseInt(System.getProperty("timeout"));
    } catch (Exception e) {
      executionTime = QuerySubmitter.TIMEOUT_SECONDS;
    }
    if (timeout != null) {
      executionTime = Long.parseLong(timeout);
    }
    submitter = new QuerySubmitter(schemas[0]);
    if (submitType.equals("sqlline")) {
      String queries = handler.congregateFiles(CONGREGATED_FILENAME);
      LOG.info("Submitting queries:\n" + queries);
      submitter.submitQueriesSqlline(SQLLINE_COMMAND, CONGREGATED_FILENAME,
          executionTime);
    } else {
      for (int i = 0; i < inputFileNames.length; i++) {
        if (submitType.equals("submit_plan")) {
          submitter.submitQueriesSubmitPlan(SUBMIT_PLAN_COMMAND,
              inputFileNames[i], outputFileNames[i], queryType, executionTime);
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
                submitter
                    .submitQueryJDBC(queryString, statement, executionTime);
                continue;
              }
              if (submitType.equals("jdbc")) {
                query = inputFileNames[i];
                try {
                  submitter.submitQueryJDBC(queryString, statement,
                      outputFileNames[i], executionTime);
                  areOrderByQueries[i] = isOrderByQuery(queryString);
                  if (areOrderByQueries[i]) {
                    allOrderByColumns.add(getOrderByColumns(queryString,
                        submitter.getColumnLabels()));
                  } else {
                    allOrderByColumns.add(null);
                  }
                  allColumnLabels.add(submitter.getColumnLabels());
                  submitter.generatePlan(statement, planFileNames[i],
                      queryString, "physical", executionTime);
                } catch (Exception e) {
                  continue;
                }
              } else {
                submitter.generatePlan(statement, inputFileNames[i],
                    queryString, submitType, executionTime);
              }
            }
          }
        }
      }
    }
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.TIMEOUT) {
      summaryFailed += "[timedout] " + query + "\n";
      logTestEnd(testId, TestVerifier.testStatus);
      return;
    }
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.EXECUTION_FAILURE) {
      summaryFailed += "[execution failure] " + query + "\n";
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
        verifyAllOutputs(expectedFiles, outputFileNames, areOrderByQueries);
        if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.PASS) {
          verifyAllOutputsOrders(outputFileNames, allColumnLabels,
              allOrderByColumns);
        }
      }
    }
    switch (TestVerifier.testStatus) {
    case PASS:
      summaryPassing += query + "\n";
      break;
    case VERIFICATION_FAILURE:
      summaryFailed += "[verification failure] " + query + "\n";
      break;
    case ORDER_MISMATCH:
      summaryFailed += "[order mismatch] " + query + "\n";
      break;
    default:
      break;
    }
    logTestEnd(testId, TestVerifier.testStatus);
  }

  private String[] generateOutputFileNames(String[] inputFileNames,
      String testId, boolean isPlan) throws IOException {
    if (drillOutputDirName == null) {
      drillOutputDirName = "/tmp";
    }
    File drillOutputDirDir = new File(drillOutputDirName);
    if (!drillOutputDirDir.exists()) {
      if (!drillOutputDirDir.mkdir()) {
        LOG.debug("Cannot create directory " + drillOutputDirName
            + ".  Using /tmp for drill output");
        drillOutputDirName = "/tmp";
      }
    }
    String[] outputFileNames = new String[inputFileNames.length];
    for (int i = 0; i < outputFileNames.length; i++) {
      String inputFileName = inputFileNames[i];
      int index = inputFileName.lastIndexOf('/');
      String queryName = inputFileName.substring(index + 1);
      queryName = queryName.split("\\.")[0];
      outputFileNames[i] = drillOutputDirName + "/" + testId + "_" + queryName;
      if (isPlan) {
        outputFileNames[i] += ".plan";
      } else {
        outputFileNames[i] += ".output_" + new Date().toString();
      }
    }
    return outputFileNames;
  }

  private void verifyAllOutputs(String[] expectedOutputs, String[] actualOutputs)
      throws Exception {
    verifyAllOutputs(expectedOutputs, actualOutputs, null);
  }

  private void verifyAllOutputs(String[] expectedOutputs,
      String[] actualOutputs, boolean[] areOrderByQueries) throws Exception {
    if (TestVerifier.testStatus == TestVerifier.TEST_STATUS.PASS) {
      for (int i = 0; i < expectedOutputs.length; i++) {
        boolean isOrderByQuery = false;
        if (areOrderByQueries != null) {
          isOrderByQuery = areOrderByQueries[i];
        }
        TestVerifier.TEST_STATUS status = TestVerifier.verifyResultSet(
            expectedOutputs[i], actualOutputs[i], isOrderByQuery);
        if (status != TestVerifier.TEST_STATUS.PASS) {
          TestVerifier.testStatus = status;
          break;
        }
      }
    }
  }

  private void verifyAllOutputsOrders(String[] actualOutputs,
      List<List<String>> allColumnLabels,
      List<Map<String, String>> allOrderByColumns) throws Exception {
    if (allOrderByColumns == null || allOrderByColumns.size() == 0) {
      return;
    }
    for (int i = 0; i < actualOutputs.length; i++) {
      if (allOrderByColumns.get(i) != null) {
        TestVerifier.TEST_STATUS status = TestVerifier.verifyResultSetOrders(
            actualOutputs[i], allColumnLabels.get(i), allOrderByColumns.get(i));
        if (status != TestVerifier.TEST_STATUS.PASS) {
          TestVerifier.testStatus = status;
          break;
        }
      }
    }
  }

  private void logTestStart() throws IOException {
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
    case ORDER_MISMATCH:
      message = "Order mismatch.";
      break;
    case TIMEOUT:
      message = "Timeout of " + executionTime + " seconds exceeded.";
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

  private synchronized void hdfsCopy(String src, String dest, boolean overWrite)
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

  private String getOrderByBlock(String statement) {
    String block = statement;
    int idx = statement.lastIndexOf(')');
    if (idx >= 0) {
      block = block.substring(idx + 1);
    }
    Pattern pattern = Pattern.compile("order\\s+?by");
    Matcher matcher = pattern.matcher(block.toLowerCase());
    if (matcher.find()) {
      block = block.substring(matcher.start());
    } else {
      block = "";
    }
    idx = block.toLowerCase().indexOf("limit");
    if (idx >= 0) {
      block = block.substring(0, idx);
    }
    return block.trim();
  }

  private boolean isOrderByQuery(String statement) {
    return !getOrderByBlock(statement).isEmpty();
  }

  private Map<String, String> getOrderByColumns(String statement,
      List<String> columnLabels) {
    if (!isOrderByQuery(statement)) {
      return null;
    }
    Map<String, String> orderByColumns = new LinkedHashMap<String, String>();
    String string = getOrderByBlock(statement);
    Pattern pattern = Pattern.compile("order\\s+?by");
    Matcher matcher = pattern.matcher(string.toLowerCase());
    if (matcher.find()) {
      string = string.substring(matcher.end()).trim();
    } else {
      return null;
    }
    String[] columns = string.split(",");
    for (String column : columns) {
      column = column.trim();
      String[] columnOrder = column.split("\\s+");
      String columnName = columnOrder[0].trim();
      if (columnName.indexOf('.') >= 0) {
        columnName = columnName.substring(columnName.indexOf('.') + 1);
      }
      int ordinal = -1;
      try {
        ordinal = Integer.parseInt(columnName);
      } catch (Exception e) {
      }
      if (ordinal > 0) {
        columnName = columnLabels.get(ordinal - 1);
      }
      if (columnOrder.length == 2) {
        orderByColumns.put(columnName, columnOrder[1].trim());
      } else {
        orderByColumns.put(columnName, "asc");
      }
    }
    return orderByColumns;
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
