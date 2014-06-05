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

import java.math.BigDecimal;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 * Class modeling a row in a ResultSet. It also stores a list of types of each
 * cell shared by all rows in a given ResultSet.
 * 
 * @author Zhiyong Liu
 * 
 */
public class ColumnList {
  private final List<Object> list = new ArrayList<Object>();
  private static List<Object> types = null;

  /**
   * Constructor that takes a variable number of objects representing cells in a
   * row.
   * 
   * @param objects
   *          typed values in a row
   */
  public ColumnList(Object... objects) {
    for (Object o : objects) {
      list.add(o);
    }
  }

  /**
   * Sets data types for a ResultSet row.
   * 
   * @param dataTypes
   *          data types
   */
  public static void setTypes(Object... dataTypes) {
    types = new ArrayList<Object>();
    for (Object type : dataTypes) {
      types.add(type);
    }
  }

  /**
   * Returns list of types
   * 
   * @return list of types
   */
  public static List<Object> getTypes() {
    return types;
  }

  /**
   * Overrides the equals() method in Object that compares two objects using the
   * "loosened" logic to handle float, double and decimal types. The algorithm
   * used for the comparison follows:
   * 
   * Floats: f1 equals f2 iff ((f1-f2)/(average(f1,f2))) < 0.000001
   * 
   * Doubles: d1 equals d2 iff ((d1-d2)/(average(d1,d2))) < 0.000000000001
   * 
   * Decimals: dec1 equals dec2 iff value(dec1) == value(dec2) and scale(dec1)
   * == scale(dec2)
   */
  @Override
  public boolean equals(Object object) {
    return compare(this, (ColumnList) object);
  }

  @Override
  public int hashCode() {
    int hash = 3;
    hash = 37 * hash + (this.list != null ? this.list.hashCode() : 0);
    return hash;
  }

  /**
   * String representation of the ColumnList object
   */
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    for (Object o : list) {
      sb.append(o + "\t");
    }
    return sb.toString().trim();
  }

  private boolean compare(ColumnList o1, ColumnList o2) {
    boolean result = true;
    List<Object> list1 = o1.list;
    List<Object> list2 = o2.list;
    for (int i = 0; i < list1.size(); i++) {
      int type = (Integer) (types.get(i));
      switch (type) {
      case Types.FLOAT:
        float f1 = (Float) list1.get(i);
        float f2 = (Float) list2.get(i);
        result = result && Math.abs(f1 - f2) / ((f1 + f2) / 2) < 0.000001;
        break;
      case Types.DOUBLE:
        double d1 = (Double) list1.get(i);
        double d2 = (Double) list2.get(i);
        result = result && Math.abs(d1 - d2) / ((d1 + d2) / 2) < 0.000000000001;
        break;
      case Types.DECIMAL:
        BigDecimal bd1 = (BigDecimal) list1.get(i);
        BigDecimal bd2 = (BigDecimal) list2.get(i);
        result = result && bd1.compareTo(bd2) == 0;
        break;
      default:
        result = list1.get(i).equals(list2.get(i));
        break;
      }
    }
    return result;
  }
}
