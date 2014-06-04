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

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Customized implementation of the HashMap data structure. Comparisons of keys
 * using this implementation can have specific evaluations of keys for equality.
 * 
 * @author Zhiyong Liu
 * 
 * @param <K>
 * @param <V>
 */
public class RelaxedMap<K, V> extends HashMap<K, V> {
  private static final long serialVersionUID = 5895683668689795830L;
  private K matchingKey;

  /**
   * Overrides the default implementation of the containsKey() method in HashMap
   * to use customized equals() method for specific data objects.
   */
  @Override
  public boolean containsKey(Object key) {
    for (Iterator<? extends Map.Entry<? extends K, ? extends V>> i = entrySet()
        .iterator(); i.hasNext();) {
      Map.Entry<? extends K, ? extends V> e = i.next();
      K approximate = e.getKey();
      if (approximate.equals(key)) {
        matchingKey = approximate;
        return true;
      }
    }
    return super.containsKey(key);
  }

  /**
   * Returns the approximate key that matches a compared key (as in
   * containsKey())
   * 
   * @return matchingKey for this map
   */
  public K getMatchingKey() {
    return matchingKey;
  }
}
