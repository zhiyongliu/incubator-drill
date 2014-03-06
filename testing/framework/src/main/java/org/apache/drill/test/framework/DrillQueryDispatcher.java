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

import java.io.IOException;

import org.apache.log4j.Logger;

/**
 * The dispatcher of queries to drill. There are a variety of interfaces via
 * which to dispatch queries.
 * 
 * @author Zhiyong Liu
 * 
 */
public class DrillQueryDispatcher implements QueryDispatcher {
  private static final Logger LOG = Logger.getLogger(Utils.getInvokingClassName());
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
      String filename, String planType) throws Exception {
    String command = submitPlanCommand + " -f " + filename + " - t " + planType
        + " -zk " + "";
    LOG.info("Executing " + command + ".");
    Runtime.getRuntime().exec(command).waitFor();
  }
}
