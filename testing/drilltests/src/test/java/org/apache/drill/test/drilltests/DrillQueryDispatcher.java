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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.drill.test.framework.GenericQueryDispatcher;
import org.apache.drill.test.framework.Utils;

/**
 * Additional drill-specific query dispatching methods to the generic
 * dispatcher.
 * 
 * @author Zhiyong Liu
 * 
 */
public class DrillQueryDispatcher extends GenericQueryDispatcher {
  public DrillQueryDispatcher(String schema) {
    super(schema);
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
  public void dispatchQueriesSubmitPlan(String submitPlanCommand,
      String queryFileName, String outputFileName, String queryType)
      throws Exception {
    String command = submitPlanCommand + " -f " + queryFileName
        + " --format tsv -t " + queryType + " -z "
        + Utils.getDrillTestProperties().get("ZOOKEEPERS");
    LOG.info("Executing " + command + ".");
    Process process = Runtime.getRuntime().exec(command);
    process.waitFor();
    StringBuilder builder = new StringBuilder();
    String line = "";
    String last = "";
    BufferedReader reader = new BufferedReader(new InputStreamReader(
        process.getInputStream()));
    line = reader.readLine();
    while ((last = reader.readLine()) != null) {
      builder.append(line.trim() + '\n');
      line = last;
    }
    reader.close();
    writeConsoleOutputToFile(builder.toString().trim(), outputFileName);
  }

  public void writeConsoleOutputToFile(String content, String outputFileName)
      throws IOException {
    File file = new File(outputFileName);
    FileOutputStream fos = new FileOutputStream(file);
    byte[] bytes = content.getBytes();
    fos.write(bytes);
    fos.flush();
    fos.close();
  }
}
