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
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

/**
 * The dispatcher of queries to drill. There are a variety of interfaces via
 * which to dispatch queries.
 * 
 * @author Zhiyong Liu
 * 
 */
public class DrillQueryDispatcher implements QueryDispatcher {
  private static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());
  private String schema;

  /**
   * Constructor with the schema name
   * 
   * @param schema
   *          name of schema to use
   */
  public DrillQueryDispatcher(String schema) {
    this.schema = schema;
  }

  /**
   * Submits query(ies) to drill via CLI
   * 
   * @param queryFileName
   *          name of file to use for query submission
   * @throws IOException
   * @throws InterruptedException
   */
  public void dispatchQueriesCLI(String sqllineCommand, String queryFileName)
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
   * 
   */
  public void dispatchQueriesSubmitPlan(String submitPlanCommand,
      String queryFileName, String queryType) throws Exception {
    String command = submitPlanCommand + " -f " + queryFileName + " -t "
        + queryType + " -zk "
        + Utils.getDrillTestProperties().get("ZOOKEEPERS");
    LOG.info("Executing " + command + ".");
    Runtime.getRuntime().exec(command).waitFor();
  }

  public ResultSet dispatchQueriesJDBC(String connectionUrl,
      String queryFileName) throws Exception {
    Connection connection = DriverManager.getConnection(connectionUrl);
    Statement statement = connection.createStatement();
    return statement.executeQuery(getSqlStatement(queryFileName));
  }

  private String getSqlStatement(String queryFileName) throws IOException {
    StringBuilder builder = new StringBuilder();
    BufferedReader reader = new BufferedReader(new FileReader(new File(
        queryFileName)));
    String line = null;
    while ((line = reader.readLine()) != null && !line.trim().isEmpty()) {
      builder.append(line);
    }
    reader.close();
    return builder.toString();
  }
}