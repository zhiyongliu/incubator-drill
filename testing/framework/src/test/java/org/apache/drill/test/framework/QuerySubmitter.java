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
  public void submitQueriesSqlline(String sqllineCommand, String queryFileName)
      throws IOException, InterruptedException {
    // TODO: need to parameterize the command line; need to finalize
    // treatment of schemas
    String command = sqllineCommand
        + " -n admin -p admin -u jdbc:drill:schema=" + schema + " -f "
        + queryFileName;
    LOG.info("Executing " + command + ".");
    Runtime.getRuntime().exec(command).waitFor();
  }

  /**
   * Submits query via JDBC
   * 
   * @param query
   *          SQL query string
   * @param statement
   *          sql statement to execute the query with
   * @return Map of query results and their occurrences
   * @throws Exception
   */
  public void submitQueryJDBC(String query, Statement statement)
      throws Exception {
    submitQueryJDBC(query, statement, null);
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
      Statement statement) {
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
      resultSet = statement.executeQuery(query);
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
      String queryFileName, String outputFileName, String queryType)
      throws Exception {
    String command = submitPlanCommand + " -f " + queryFileName
        + " --format tsv -t " + queryType + " -z "
        + Utils.getDrillTestProperties().get("ZOOKEEPERS");
    LOG.info("Executing " + command + ".");
    Process p = Runtime.getRuntime().exec(command);
    p.waitFor();
    Scanner scanner = new Scanner(p.getInputStream()).useDelimiter("\\A");
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
      String queryString, String type) throws Exception {
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
      LOG.info("Submitting query:\n" + query.trim());
      resultSet = statement.executeQuery(query);
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
   * @param outputFilename
   *          name of file result set is to be written to
   * @throws Exception
   */
  public void submitQueryJDBC(String query, Statement statement,
      String outputFilename) throws Exception {
    BufferedWriter writer = null;
    if (outputFilename != null) {
      writer = new BufferedWriter(new FileWriter(new File(outputFilename)));
    }
    ResultSet resultSet = null;
    try {
      resultSet = statement.executeQuery(query);
      if (outputFilename == null) {
        return;
      }
      int columnCount = resultSet.getMetaData().getColumnCount();
      Object[] types = new Object[columnCount];
      for (int i = 1; i <= columnCount; i++) {
        types[i - 1] = resultSet.getMetaData().getColumnType(i);
      }
      ColumnList.setTypes(types);
      LOG.info("Types in this result set:\n");
      for (Object type : types) {
        LOG.info("\t" + type);
      }
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
}