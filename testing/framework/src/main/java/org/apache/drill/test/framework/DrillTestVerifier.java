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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * Verification of drill tests by comparing actual query output with expected
 * query result set.
 * 
 * @author Zhiyong Liu
 */
public class DrillTestVerifier {
  private static final int MAX_MISMATCH_SIZE = 10;
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());

  /**
   * Verifies output of a query. The verification is performed by comparing the
   * contents of the expected and actual query result files.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @return true if the outputs are identical
   * @throws IOException
   * @throws InterruptedException
   */
  public static boolean fileComparisonVerify(String expectedOutput,
      String actualOutput, int outputFileHeaderSize) throws IOException,
      InterruptedException {
    extractQueryOutput(actualOutput, outputFileHeaderSize);
    Map<String, Integer> expectedMap = getExpectedMap(expectedOutput);
    List<String> unexpectedList = new ArrayList<String>();
    BufferedReader reader = new BufferedReader(new FileReader(new File(
        actualOutput)));
    String line = "";
    int unexpectedCount = 0;
    while ((line = reader.readLine()) != null) {
      line.trim();
      if (!check(expectedMap, line)) {
        if (unexpectedList.size() < MAX_MISMATCH_SIZE) {
          unexpectedList.add(line);
        }
        unexpectedCount++;
      }
    }
    reader.close();
    printSummary(unexpectedList, unexpectedCount, expectedMap);
    return expectedMap.isEmpty() && unexpectedList.isEmpty();
  }

  /**
   * Verifies output of a query. The verification is performed using map-reduce.
   * This is used when the query output does not have consistent ordering, and
   * is too large for in-memory verifications.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @return true if the outputs are identical
   * @throws IOException
   */
  // TODO need to implement this
  public static boolean mapReduceVerify(String expectedOutput,
      String actualOutput) throws IOException {
    return false;
  }

  public static boolean resultSetVerify(String expectedFile, ResultSet resultSet)
      throws IOException, SQLException {
    Map<String, Integer> expectedMap = getExpectedMap(expectedFile);
    int columnCount = resultSet.getMetaData().getColumnCount();
    int unexpectedCount = 0;
    List<String> unexpectedList = new ArrayList<String>();
    while (resultSet.next()) {
      StringBuilder builder = new StringBuilder();
      for (int i = 0; i < columnCount; i++) {
        builder.append(resultSet.getObject(i) + "\t");
      }
      String entry = builder.toString();
      if (!check(expectedMap, entry)) {
        if (unexpectedCount < MAX_MISMATCH_SIZE) {
          unexpectedList.add(entry);
          unexpectedCount++;
        }
      }
    }
    printSummary(unexpectedList, unexpectedCount, expectedMap);
    return expectedMap.isEmpty() && unexpectedList.isEmpty();
  }

  private static void extractQueryOutput(String filename, int startLineNumber)
      throws InterruptedException, IOException {
    String[] commands = { "/bin/sh", "-c",
        "sed -i '1," + startLineNumber + "d;N;$!P;$!D;$d' " + filename };
    Runtime.getRuntime().exec(commands).waitFor();
  }

  private static Map<String, Integer> getExpectedMap(String filename)
      throws IOException {
    Map<String, Integer> map = new HashMap<String, Integer>();
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = "";
    while ((line = reader.readLine()) != null) {
      line.trim();
      if (map.containsKey(line)) {
        map.put(line, map.get(line) + 1);
      } else {
        map.put(line, 1);
      }
    }
    reader.close();
    return map;
  }

  private static boolean check(Map<String, Integer> map, String entry) {
    if (map.containsKey(entry)) {
      map.put(entry, map.get(entry) - 1);
      if (map.get(entry) == 0) {
        map.remove(entry);
      }
      return true;
    }
    return false;
  }

  private static void printSummary(List<String> unexpectedList, int unexpectedCount,
      Map<String, Integer> expectedMap) {
    if (!unexpectedList.isEmpty()) {
      LOG.info("These rows are not expected:");
      for (String row : unexpectedList) {
        LOG.info("\t" + row);
      }
      LOG.info("Total number of unexpected rows: " + unexpectedCount);
    }
    unexpectedCount = expectedMap.size();
    if (!expectedMap.isEmpty()) {
      LOG.info("These rows are expected but are not in result set:");
      int count = 0;
      for (Map.Entry<String, Integer> entry : expectedMap.entrySet()) {
        LOG.info("\t" + entry.getKey() + " (" + entry.getValue() + " time(s))");
        count++;
        if (count == MAX_MISMATCH_SIZE) {
          break;
        }
      }
      LOG.info("Total number of expected but missing: " + unexpectedCount);
    }
  }
}
