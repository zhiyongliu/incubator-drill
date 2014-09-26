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
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
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
  private static List<ColumnList> resultSet = null;

  public enum TEST_STATUS {
    PASS, EXECUTION_FAILURE, VERIFICATION_FAILURE, ORDER_MISMATCH, TIMEOUT, UNASSIGNED
  };

  /**
   * Verifies output of a query. The verification is performed by comparing the
   * contents of the expected and actual query result files.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @return {@link TEST_STATUS}
   * @throws Exception
   */
  public static TEST_STATUS verifyResultSet(String expectedOutput,
      String actualOutput) throws Exception {
    return verifyResultSet(expectedOutput, actualOutput, false);
  }

  /**
   * Verifies output of a query. The verification is performed by comparing the
   * contents of the expected and actual query result files.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @param verifyOrderBy
   *          whether the query involves order by
   * @return {@link TEST_STATUS}
   * @throws Exception
   */
  public static TEST_STATUS verifyResultSet(String expectedOutput,
      String actualOutput, boolean verifyOrderBy) throws Exception {
    if (testStatus == TEST_STATUS.EXECUTION_FAILURE) {
      return testStatus;
    }
    Map<ColumnList, Integer> expectedMap = loadFromFileToMap(expectedOutput);
    if (expectedMap == null) {
      return TEST_STATUS.EXECUTION_FAILURE;
    }
    if (testStatus == TEST_STATUS.VERIFICATION_FAILURE) {
      return testStatus;
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
    testStatus = expectedMap.isEmpty() && unexpectedList.isEmpty() ? TEST_STATUS.PASS
        : TEST_STATUS.VERIFICATION_FAILURE;
    printSummary(unexpectedList, unexpectedCount, expectedMap, expectedCount,
        actualCount, verifyOrderBy);
    return testStatus;

  }

  private static Map<ColumnList, Integer> loadFromFileToMap(String filename)
      throws Exception {
    return loadFromFileToMap(filename, false);
  }

  /**
   * Loads content of a result set file into a Map object.
   * 
   * @param filename
   *          name of file containing result sets
   * @return map of result set
   * @throws Exception
   */
  private static Map<ColumnList, Integer> loadFromFileToMap(String filename,
      boolean ordered) throws Exception {
    List<Object> types = ColumnList.getTypes();
    if (types == null) {
      LOG.debug("Fatal: Types in the result set is null.  "
          + "This most likely resulted from failed execution.");
      return null;
    }
    int size = types.size();
    Map<ColumnList, Integer> map = null;
    if (ordered) {
      resultSet = new ArrayList<ColumnList>();
    } else {
      map = new HashMap<ColumnList, Integer>();
    }
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = "";
    mapSize = 0;
    while ((line = reader.readLine()) != null) {
      String[] fields = line.split("\t");
      if (fields.length != size) {
        LOG.fatal("Error: expected data and actual data have different number of columns.");
        LOG.fatal("Number of columns in expected data: " + fields.length);
        LOG.fatal("Number of columns in actual data: " + size);
        LOG.fatal("First row of expected data:\n" + line);
        LOG.fatal("Types in actual data: " + Utils.getTypesInStrings(types));
        testStatus = TEST_STATUS.VERIFICATION_FAILURE;
        reader.close();
        return map;
      }
      Object[] typedFields = new Object[fields.length];
      for (int i = 0; i < fields.length; i++) {
        if (types.size() == 0) {
          typedFields[i] = fields[i];
          continue;
        }
        int type = (Integer) (types.get(i));
        try {
          switch (type) {
          case Types.INTEGER:
          case Types.BIGINT:
          case Types.SMALLINT:
          case Types.TINYINT:
            typedFields[i] = new BigInteger(fields[i]);
            break;
          case Types.FLOAT:
            typedFields[i] = new Float(fields[i]);
            break;
          case Types.DOUBLE:
            typedFields[i] = new Double(fields[i]);
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
      if (ordered) {
        resultSet.add(cl);
      } else {
        if (map.containsKey(cl)) {
          map.put(cl, map.get(cl) + 1);
        } else {
          map.put(cl, 1);
        }
        mapSize++;
      }
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
      int expectedCount, int actualCount, boolean verifyOrderBy) {
    if (testStatus == TEST_STATUS.EXECUTION_FAILURE
        || testStatus == TEST_STATUS.TIMEOUT) {
      return;
    }
    int missingCount = getMissingCount(expectedMap);
    if (testStatus == TEST_STATUS.PASS) {
      if (!verifyOrderBy) {
        LOG.info("\nTest passed.");
      }
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

  private static int compareTo(ColumnList list1, ColumnList list2,
      Map<Integer, String> columnIndexAndOrder, int start) {
    if (start == columnIndexAndOrder.size()) {
      return 0;
    }
    int idx = (Integer) columnIndexAndOrder.keySet().toArray()[start];
    int result = -1;
    Object o1 = list1.getList().get(idx);
    Object o2 = list2.getList().get(idx);
    if (o1 instanceof Number) {
      Number number1 = (Number) o1;
      Number number2 = (Number) o2;
      double diff = number1.doubleValue() - number2.doubleValue();
      if (diff == 0) {
        return compareTo(list1, list2, columnIndexAndOrder, start + 1);
      } else {
        if (diff < 0) {
          result = -1;
        } else {
          result = 1;
        }
        if (columnIndexAndOrder.get(idx).equalsIgnoreCase("desc")) {
          result *= -1;
        }
        return result;
      }
    }
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable1 = (Comparable<Object>) list1.getList().get(
        idx);
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable2 = (Comparable<Object>) list2.getList().get(
        idx);
    result = comparable1.compareTo(comparable2);
    if (columnIndexAndOrder.get(idx).equalsIgnoreCase("desc")) {
      result *= -1;
    }
    if (result == 0) {
      return compareTo(list1, list2, columnIndexAndOrder, start + 1);
    } else {
      return result;
    }
  }

  /**
   * Verifies orders in the result set if a query involves order by in the final
   * output.
   * 
   * @param filename
   *          name of file of actual output
   * @param columnLabels
   *          list of labels of all returned columns
   * @param orderByColumns
   *          map of all order-by columns and their orders (ascending or
   *          descending)
   * @return {@link TEST_STATUS}
   * @throws Exception
   */
  public static TEST_STATUS verifyResultSetOrders(String filename,
      List<String> columnLabels, Map<String, String> orderByColumns)
      throws Exception {
    loadFromFileToMap(filename, true);
    Map<Integer, String> columnIndexAndOrder = getColumnIndexAndOrder(
        columnLabels, orderByColumns);
    if (columnIndexAndOrder == null) {
      LOG.debug("skipping order verification");
      LOG.info("\nTest passed.");
      return TEST_STATUS.PASS;
    }
    if (!isOrdered(columnIndexAndOrder)) {
      LOG.info("\nOrder mismatch in actual result set.");
      return TEST_STATUS.ORDER_MISMATCH;
    }
    LOG.info("\nTest passed.");
    return TEST_STATUS.PASS;
  }

  private static Map<Integer, String> getColumnIndexAndOrder(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    Map<Integer, String> columnIndexAndOrder = new LinkedHashMap<Integer, String>();
    List<Integer> indicesOfOrderByColumns = getIndicesOfOrderByColumns(
        columnLabels, orderByColumns);
    if (indicesOfOrderByColumns == null) {
      return null;
    }
    for (int i = 0; i < indicesOfOrderByColumns.size(); i++) {
      columnIndexAndOrder.put(indicesOfOrderByColumns.get(i),
          orderByColumns.get(orderByColumns.keySet().toArray()[i]));
    }
    return columnIndexAndOrder;
  }

  private static List<Integer> getIndicesOfOrderByColumns(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    List<Integer> indices = new ArrayList<Integer>();
    for (Map.Entry<String, String> entry : orderByColumns.entrySet()) {
      int index = columnLabels.indexOf(entry.getKey());
      if (index < 0) {
        return null;
      }
      indices.add(index);
    }
    return indices;
  }

  private static boolean isOrdered(Map<Integer, String> columnIndexAndOrder) {
    if (resultSet.size() <= 1) {
      return true;
    }
    ColumnList first = resultSet.get(0);
    for (int i = 1; i < resultSet.size(); i++) {
      ColumnList next = resultSet.get(i);
      int compared = compareTo(first, next, columnIndexAndOrder, 0);
      if (compared <= 0) {
        first = next;
        continue;
      } else {
        LOG.info(first + " : " + next);
        return false;
      }
    }
    return true;
  }
}
