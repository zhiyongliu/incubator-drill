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
import java.lang.reflect.Field;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * Collection of utilities supporting the drill test framework.
 * 
 * @author Zhiyong Liu
 * 
 */
public class Utils {
  private static final String DRILL_TEST_CONFIG = "drillTestConfig";

  /**
   * Computes difference between two dates
   * 
   * @param date1
   *          newer date
   * @param date2
   *          older date
   * @param unit
   *          one of "second", "minute", "hour" and "day"
   * @return difference in time in accordance to the unit specified
   */
  public static int getDateDiff(Date date1, Date date2, String unit) {
    int diff = (int) (date1.getTime() - date2.getTime()) / 1000;
    if (unit.equals("second")) {
      return diff;
    }
    diff /= 60;
    if (unit.equals("minute")) {
      return diff;
    }
    diff /= 60;
    if (unit.equals("hour")) {
      return diff;
    }
    diff /= 24;
    if (unit.equals("day")) {
      return diff;
    }
    return 0;
  }

  /**
   * Returns the map containing all properties in the drill test properties
   * file.
   * 
   * @param drillPropertiesFilename
   *          name of drill properties file
   * @return map containing all properties in the drill test properties file.
   */
  public static Map<String, String> getDrillTestProperties() {
    Map<String, String> drillProperties = new HashMap<String, String>();
    ResourceBundle bundle = ResourceBundle.getBundle(DRILL_TEST_CONFIG);
    Enumeration<String> keys = bundle.getKeys();
    while (keys.hasMoreElements()) {
      String key = keys.nextElement();
      if (key != null) {
        drillProperties.put(key.trim(), bundle.getString(key).trim());
      }
    }
    return drillProperties;
  }

  /**
   * Returns name of invoking class.
   * 
   * @return name of invoking class.
   */
  public static String getInvokingClassName() {
    return new Throwable().getStackTrace()[1].getClassName();
  }

  /**
   * Constructs resolved path for a file. If the file starts with "/", it is
   * assumed to already be an absolute path.
   * 
   * @param filename
   *          name of file for which absolute path is being constructed.
   * @param propertyKey
   *          name of property to resolve absolute path from.
   * @return absolute path for a file.
   */
  public static String toResovedPath(String filename, String propertyKey) {
    if (filename.startsWith("/")) {
      return filename;
    }
    return Utils.getDrillTestProperties().get(propertyKey) + "/" + filename;
  }

  /**
   * Reads a query file and returns an array of queries.
   * 
   * @param queryFileName
   *          name of file containing queries
   * @return array of queries
   * @throws IOException
   */
  public static String[] getSqlStatements(String queryFileName)
      throws IOException {
    StringBuilder builder = new StringBuilder();
    BufferedReader reader = new BufferedReader(new FileReader(new File(
        queryFileName)));
    String line = null;
    while ((line = reader.readLine()) != null) {
      builder.append(line + "\n");
    }
    reader.close();
    String[] statements = builder.toString().trim().split(";");
    for (String statement : statements) {
      while (statement.endsWith(";")) {
        statement = statement.substring(0, statement.length() - 1);
      }
    }
    return statements;
  }

  private static final Map<Integer, String> getSqlTypesMap()
      throws IllegalArgumentException, IllegalAccessException {
    Map<Integer, String> map = new HashMap<Integer, String>();
    Field[] fields = Types.class.getDeclaredFields();
    for (int i = 0; i < fields.length; i++) {
      map.put((Integer) fields[i].get(Types.class), fields[i].getName());
    }
    return map;
  }

  /**
   * Turns a list of types in numerical values into one in strings with semantic
   * content.
   * 
   * @param typesInInteger
   *          list of types in numerical values.
   * @return
   * @throws IllegalArgumentException
   * @throws IllegalAccessException
   */
  public static List<String> getTypesInStrings(List<Object> typesInInteger)
      throws IllegalArgumentException, IllegalAccessException {
    List<String> typesInStrings = new ArrayList<String>();
    Map<Integer, String> map = getSqlTypesMap();
    for (int i = 0; i < typesInInteger.size(); i++) {
      Integer type = (Integer) typesInInteger.get(i);
      typesInStrings.add(map.get(type));
    }
    return typesInStrings;
  }
}
