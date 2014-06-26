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
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * Verification of drill tests by comparing actual query output with expected
 * query result set.
 * 
 * @author Zhiyong Liu
 */
public class TestVerifier {
  private static final int MAX_MISMATCH_SIZE = 10;
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());
  public static TEST_STATUS testStatus = TEST_STATUS.UNASSIGNED;
  private transient static int mapSize = 0;

  public enum TEST_STATUS {
    PASS, EXECUTION_FAILURE, VERIFICATION_FAILURE, TIMEOUT, UNASSIGNED
  };

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
  public static TEST_STATUS fileComparisonVerify(String expectedOutput,
      String actualOutput) throws IOException, InterruptedException {
    if (testStatus == TEST_STATUS.EXECUTION_FAILURE) {
      return testStatus;
    }
    Map<ColumnList, Integer> expectedMap = loadFromFileToMap(expectedOutput);
    if (expectedMap == null) {
      return TEST_STATUS.EXECUTION_FAILURE;
    }
    int expectedCount = mapSize;
    Map<ColumnList, Integer> actualMap = loadFromFileToMap(actualOutput);
    int actualCount = mapSize;
    List<ColumnList> unexpectedList = new ArrayList<ColumnList>();
    int unexpectedCount = 0;
    Iterator<Map.Entry<ColumnList, Integer>> iterator = actualMap.entrySet()
        .iterator();
    while (iterator.hasNext()) {
      Map.Entry<ColumnList, Integer> entry = iterator.next();
      ColumnList cl = entry.getKey();
      int count = entry.getValue();
      while (count > 0 && check(expectedMap, cl)) {
        count--;
      }
      if (count > 0) {
        unexpectedList.add(cl);
        unexpectedCount += count;
      }
    }
    printSummary(unexpectedList, unexpectedCount, expectedMap, expectedCount,
        actualCount);
    return expectedMap.isEmpty() && unexpectedList.isEmpty() ? TEST_STATUS.PASS
        : TEST_STATUS.VERIFICATION_FAILURE;

  }

  /**
   * Loads content of a result set file into a RelaxedMap object.
   * 
   * @param filename
   *          name of file containing result sets
   * @return RelaxedMap of result set
   * @throws IOException
   */
  public static Map<ColumnList, Integer> loadFromFileToMap(String filename)
      throws IOException {
    List<Object> types = ColumnList.getTypes();
    if (types == null) {
      LOG.debug("Fatal: Types in the result set is null.  "
          + "This most likely resulted from failed execution.");
      return null;
    }
    Map<ColumnList, Integer> map = new HashMap<ColumnList, Integer>();
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = "";
    mapSize = 0;
    while ((line = reader.readLine()) != null) {
      line.trim();
      String[] fields = line.split("\t");
      Object[] typedFields = new Object[fields.length];
      for (int i = 0; i < fields.length; i++) {
        if (types.size() == 0) {
          typedFields[i] = fields[i];
          continue;
        }
        int type = (Integer) (types.get(i));
        try {
          switch (type) {
          case Types.FLOAT:
            typedFields[i] = Float.parseFloat(fields[i]);
            break;
          case Types.DOUBLE:
            typedFields[i] = Double.parseDouble(fields[i]);
            break;
          case Types.DECIMAL:
            typedFields[i] = new BigDecimal(fields[i]);
            break;
          default:
            typedFields[i] = fields[i];
            break;
          }
        } catch (Exception e) {
          typedFields[i] = fields[i];
        }
      }
      ColumnList cl = new ColumnList(typedFields);
      if (map.containsKey(cl)) {
        map.put(cl, map.get(cl) + 1);
      } else {
        map.put(cl, 1);
      }
      mapSize++;
    }
    reader.close();
    return map;
  }

  private static boolean check(Map<ColumnList, Integer> map, ColumnList entry) {
    if (map.containsKey(entry)) {
      map.put(entry, map.get(entry) - 1);
      if (map.get(entry) == 0) {
        map.remove(entry);
      }
      return true;
    }
    return false;
  }

  private static void printSummary(List<ColumnList> unexpectedList,
      int unexpectedCount, Map<ColumnList, Integer> expectedMap,
      int expectedCount, int actualCount) {
    if (testStatus == TEST_STATUS.EXECUTION_FAILURE
        || testStatus == TEST_STATUS.TIMEOUT) {
      return;
    }
    int missingCount = getMissingCount(expectedMap);
    if (missingCount == 0 && unexpectedList.size() == 0) {
      LOG.info("\nTest passed.");
      return;
    }
    LOG.info("         Expected number of rows: " + expectedCount);
    LOG.info("Actual number of rows from Drill: " + actualCount);
    LOG.info("         Number of matching rows: "
        + (expectedCount - missingCount));
    LOG.info("          Number of rows missing: " + missingCount);
    LOG.info("       Number of rows unexpected: " + unexpectedList.size());
    int count = 0;
    if (!unexpectedList.isEmpty()) {
      LOG.info("\nThese rows are not expected (first " + MAX_MISMATCH_SIZE
          + "):");
      for (ColumnList row : unexpectedList) {
        LOG.info("\t" + row);
        count++;
        if (count == MAX_MISMATCH_SIZE) {
          break;
        }
      }
    }
    if (!expectedMap.isEmpty()) {
      LOG.info("\nThese rows are missing (first " + MAX_MISMATCH_SIZE + "):");
      count = 0;
      for (Map.Entry<ColumnList, Integer> entry : expectedMap.entrySet()) {
        LOG.info("\t" + entry.getKey() + " (" + entry.getValue() + " time(s))");
        count++;
        if (count == MAX_MISMATCH_SIZE) {
          break;
        }
      }
    }
  }

  private static int getMissingCount(Map<ColumnList, Integer> map) {
    int missingCount = 0;
    Iterator<Integer> iterator = map.values().iterator();
    while (iterator.hasNext()) {
      missingCount += iterator.next();
    }
    return missingCount;
  }
}
