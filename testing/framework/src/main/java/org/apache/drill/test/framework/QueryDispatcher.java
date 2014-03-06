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

/**
 * Interface providing methods to dispatch queries on a heterogeneous hadoop
 * distributions.
 * 
 * @author Zhiyong Liu
 * 
 */
public interface QueryDispatcher {
  /**
   * Submits query(ies) to drill via CLI
   * 
   * @param command
   *          name of command to execute.
   * @param queryFileName
   *          name of file to use for query submission
   * @throws IOException
   * @throws InterruptedException
   */
  public void dispatchQueriesCLI(String command, String queryFileName)
      throws IOException, InterruptedException;

  /**
   * 
   * @param command
   * @param filename
   * @param planType
   * @throws Exception
   */
  public void dispatchQueriesSubmitPlan(String command, String filename,
      String planType) throws Exception;
}
