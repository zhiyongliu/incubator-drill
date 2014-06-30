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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Date;
import java.util.Map;
import java.util.Scanner;

import org.apache.log4j.Logger;

/**
 * The submitter of queries to drill. There are a variety of interfaces via
 * which to submit queries.
 * 
 * @author Zhiyong Liu
 * 
 */
public class QuerySubmitter {
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());
  private String schema;
  private static Map<String, String> drillProperties = Utils
      .getDrillTestProperties();
  public static final long TIMEOUT_SECONDS = Integer.parseInt(drillProperties
      .get("TIME_OUT_SECONDS"));

  /**
   * Constructor with the schema name
   * 
   * @param schema
   *          name of schema to use
   */
  public QuerySubmitter(String schema) {
    this.schema = schema;
  }

  /**
   * Submits query(ies) via CLI
   * 
   * @param queryFileName
   *          name of file to use for query submission
   * @throws IOException
   * @throws InterruptedException
   */
  public void submitQueriesSqlline(String sqllineCommand, String queryFileName,
      long timeout) throws IOException, InterruptedException {
    // TODO: need to parameterize the command line; need to finalize
    // treatment of schemas
    String command = sqllineCommand
        + " -n admin -p admin -u jdbc:drill:schema=" + schema + " -f "
        + queryFileName;
    LOG.debug("Executing " + command + ".");
    RunThread runThread = new RunThread(command);
    processThread(runThread, timeout);
  }

  /**
   * Executes a JDBC Query and iterates through the resultSet
   * 
   * @param query
   * @param queryFileName
   * @param statement
   * @return
   */
  public boolean executeQueryJDBC(String query, String queryFileName,
      Statement statement) throws Exception {
    boolean status = true;
    ResultSet resultSet = null;
    long startTime = 0l;
    long connTime = Long.MIN_VALUE;
    long executeTime = Long.MIN_VALUE;
    long firstRowFetchTime = Long.MIN_VALUE;
    long endTime = Long.MIN_VALUE;
    long lastRowFetchTime = Long.MIN_VALUE;
    long rowCount = 0l;
    int columnCount = 0;
    try {
      LOG.info("Extracted Query from : " + queryFileName);
      String basicFileName = (new File(queryFileName)).getName();
      String queryLabel = basicFileName.subSequence(0,
          basicFileName.lastIndexOf(".q")).toString();
      LOG.info("Executing Query : " + queryLabel);
      startTime = System.currentTimeMillis();
      // Time to Connect
      connTime = System.currentTimeMillis();
      LOG.info("Connect Time: " + ((connTime - startTime) / 1000f) + " sec");
      RunThread runThread = new RunThread(statement, query);
      boolean success = processThread(runThread);
      if (!success) {
        return false;
      }
      resultSet = runThread.getResultSet();
      // Time to Execute
      executeTime = System.currentTimeMillis();
      LOG.info("Execute Time: " + ((executeTime - connTime) / 1000f) + " sec");
      columnCount = resultSet.getMetaData().getColumnCount();
      while (resultSet.next()) {
        if (rowCount == 0)
          firstRowFetchTime = System.currentTimeMillis();
        rowCount++;
        lastRowFetchTime = System.currentTimeMillis();
      }
    } catch (SQLException e) {
      e.printStackTrace();
      LOG.error(e.getMessage());
      status = false;
    } finally {
      endTime = System.currentTimeMillis();
      try {
        LOG.info("Closing connections");
        if (resultSet != null) {
          resultSet.close();
        }
      } catch (SQLException e) {
        LOG.error("[ERROR] During close: " + e.getMessage());
        status = false;
      }
      if (!status)
        LOG.error("Last row was fetched at " + new Date(lastRowFetchTime)
            + " [" + ((endTime - lastRowFetchTime) / 1000f) + " secs ago]");
      LOG.info("Time to fetch 1st row : "
          + ((firstRowFetchTime - executeTime) / 1000f) + " sec");
      LOG.info("Fetched " + rowCount + " rows with " + columnCount
          + " columns in " + ((endTime - executeTime) / 1000f) + " sec");
      LOG.info("Fetch Rate: " + (rowCount * 1000f / (endTime - executeTime))
          + " rows/sec ");
    }
    LOG.info("Total Time: " + (System.currentTimeMillis() - startTime) / 1000f
        + " sec ");
    return status;
  }

  /**
   * Submit query via the submit_plan tool
   * 
   * @param submitPlanCommand
   *          command of submit_plan
   * @param queryFileName
   *          name of file containing input query
   * @param outputFileName
   *          name of file containing query results
   * @param queryType
   *          type of query: sql, logical or physical
   * @throws Exception
   */
  public void submitQueriesSubmitPlan(String submitPlanCommand,
      String queryFileName, String outputFileName, String queryType,
      long timeout) throws Exception {
    String command = submitPlanCommand + " -f " + queryFileName
        + " --format tsv -t " + queryType + " -z "
        + Utils.getDrillTestProperties().get("ZOOKEEPERS");
    LOG.debug("Executing " + command + ".");
    RunThread runThread = new RunThread(command);
    processThread(runThread, timeout);
    Process process = runThread.getProcess();
    Scanner scanner = new Scanner(process.getInputStream()).useDelimiter("\\A");
    String output = scanner.hasNext() ? scanner.next() : "";
    PrintWriter writer = new PrintWriter(outputFileName);
    writer.write(output);
    writer.close();
  }

  /**
   * 
   * @param queryString
   *          query to generate plans for
   * @param type
   *          physical or logical
   * @throws Exception
   */
  public void generatePlan(Statement statement, String inputFileName,
      String queryString, String type, long timeout) throws Exception {
    String query = "explain plan ";
    String extension = ".p";
    if (type.equals("logical")) {
      query += "without implementation ";
      extension = ".l";
    }
    query += "for " + queryString;
    ResultSet resultSet = null;
    String planString = "";
    try {
      LOG.debug("Submitting query:\n" + query.trim());
      RunThread runThread = new RunThread(statement, query);
      processThread(runThread, timeout);
      resultSet = runThread.getResultSet();
      resultSet.next();
      resultSet.next();
      planString = new String(resultSet.getBytes(2));
    } finally {
      if (resultSet != null) {
        resultSet.close();
      }
    }
    String planFileName = inputFileName.substring(0,
        inputFileName.lastIndexOf('.'))
        + extension;
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(
        planFileName)));
    writer.write(planString);
    writer.close();
  }

  /**
   * Submits query via JDBC
   * 
   * @param query
   *          SQL query string
   * @param statement
   *          sql statement to execute the query with
   * @param timeout
   *          time allowed for query execution
   * @throws Exception
   */
  public void submitQueryJDBC(String query, Statement statement, long timeout)
      throws Exception {
    submitQueryJDBC(query, statement, null, timeout);
  }

  /**
   * Submits query via JDBC
   * 
   * @param query
   *          SQL query string
   * @param statement
   *          sql statement to execute the query with
   * @param outputFilename
   *          name of file result set is to be written to
   * @param timeout
   *          time allowed for query execution
   * @throws Exception
   */
  public void submitQueryJDBC(String query, Statement statement,
      String outputFilename, long timeout) throws Exception {
    BufferedWriter writer = null;
    if (outputFilename != null) {
      writer = new BufferedWriter(new FileWriter(new File(outputFilename)));
    }
    ResultSet resultSet = null;
    try {
      RunThread runThread = new RunThread(statement, query);
      processThread(runThread, timeout);
      resultSet = runThread.getResultSet();
      if (resultSet == null) {
        throw runThread.getException();
      }
      if (outputFilename == null) {
        return;
      }
      int columnCount = resultSet.getMetaData().getColumnCount();
      Object[] types = new Object[columnCount];
      for (int i = 1; i <= columnCount; i++) {
        types[i - 1] = resultSet.getMetaData().getColumnType(i);
      }
      ColumnList.setTypes(types);
      LOG.debug("Result set data types:");
      LOG.debug(Utils.getTypesInStrings(ColumnList.getTypes()));
      while (resultSet.next()) {
        Object[] values = new Object[columnCount];
        for (int i = 1; i <= columnCount; i++) {
          try {
            if (resultSet.getObject(i) == null) {
              values[i - 1] = null;
              continue;
            }
            values[i - 1] = new String(resultSet.getBytes(i));
          } catch (Exception e) {
            if (resultSet.getMetaData().getColumnType(i) == Types.DATE) {
              values[i - 1] = resultSet.getDate(i);
            } else {
              values[i - 1] = resultSet.getObject(i);
            }
          }
        }
        ColumnList columnList = new ColumnList(values);
        if (writer != null) {
          writer.write(columnList + "\n");
        }
      }
      if (writer != null) {
        writer.close();
      }
    } finally {
      if (resultSet != null) {
        resultSet.close();
      }
    }
  }

  private boolean processThread(RunThread runThread)
      throws InterruptedException {
    return processThread(runThread, TIMEOUT_SECONDS);
  }

  private boolean processThread(RunThread runThread, long timeout)
      throws InterruptedException {
    runThread.start();
    runThread.join(timeout * 1000);
    if (runThread.isAlive()) {
      TestVerifier.testStatus = TestVerifier.TEST_STATUS.TIMEOUT;
      runThread.interrupt();
      return false;
    }
    return true;
  }

  private class RunThread extends Thread {
    private Statement statement;
    private String query;
    private String command;
    private ResultSet resultSet;
    private Process process;
    private Exception exception;

    public RunThread(Statement statement, String query) {
      this.statement = statement;
      this.query = query;
    }

    public RunThread(String command) {
      this.command = command;
    }

    @Override
    public void run() {
      try {
        if (statement != null) {
          resultSet = statement.executeQuery(query);
        } else {
          process = Runtime.getRuntime().exec(command);
          process.waitFor();
        }
      } catch (Exception e) {
        TestVerifier.testStatus = TestVerifier.TEST_STATUS.EXECUTION_FAILURE;
        LOG.debug("Fatal: execution of query failed.  Result set size: 0.", e);
        this.exception = e;
      }
    }

    public ResultSet getResultSet() {
      return resultSet;
    }

    public Process getProcess() {
      return process;
    }

    public Exception getException() {
      return exception;
    }
  }
}