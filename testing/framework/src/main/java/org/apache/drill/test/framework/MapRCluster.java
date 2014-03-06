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
import java.util.Scanner;

/**
 * MapR cluster implementation of the Cluster interface.
 * 
 * @author Zhiyong Liu
 */
public class MapRCluster implements Cluster {
  private static final String MAPR_INSTALL_DIR = Utils.getDrillTestProperties()
      .get("HADOOP_INSTALL_LOC");

  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public MapRCluster(String name) {
    this.name = name;
  }

  /**
   * Obtains the version of the MapR instance.
   * 
   * @return version of MapR instance.
   */
  public String getVersion() throws IOException {
    String command = MAPR_INSTALL_DIR + "/bin/maprcli dashboard info -cluster "
        + name + " -version true";
    Scanner s = new Scanner(Runtime.getRuntime().exec(command).getInputStream())
        .useDelimiter("\\A");
    String output = s.hasNext() ? s.next() : "";
    return output.trim().split("\n")[1];
  }
}
