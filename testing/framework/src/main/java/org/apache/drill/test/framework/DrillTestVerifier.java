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
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Verification of drill tests by comparing actual query output with expected
 * query result set.
 * 
 * @author Zhiyong Liu
 */
public class DrillTestVerifier {
  private static StringBuilder queryOutputString = new StringBuilder();
  private static final String BASELINE_FILE = Utils.getDrillTestProperties()
      .get("BASELINE_FILE_LOC");

  /**
   * Verifies output of a query. The verification is via checksum comparisons.
   * Current checksum values are stored in the baseline file, for all existing
   * expected output files. We first look into the stored file for the value,
   * and if the checksum exists for that file, we retrieve it and compare that
   * against that of the actual output file. Otherwise, we compute the checksum
   * for the new expected output file, add it to the baseline file and do the
   * comparison.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @return true if the outputs are identical
   * @throws IOException
   * @throws InterruptedException
   * @throws NoSuchAlgorithmException
   */
  public static boolean verify(String expectedOutput, String actualOutput,
      int outputFileHeaderSize) throws IOException, InterruptedException,
      NoSuchAlgorithmException {
    extactQueryOutput(actualOutput, outputFileHeaderSize);
    Map<String, String> map = loadBaselineHashcodeTable(BASELINE_FILE);
    String expectedChecksum = "";
    if (map.containsKey(expectedOutput)) {
      expectedChecksum = map.get(expectedOutput);
    } else {
      expectedChecksum = getFileChecksum(expectedOutput);
      updateBaselineHashcodeTable(map, expectedOutput, expectedChecksum,
          BASELINE_FILE, "\t");
    }
    return expectedChecksum.equals(getFileChecksum(actualOutput));
  }

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
   */
  public static boolean inMemoryVerify(String expectedOutput,
      String actualOutput) throws IOException {
    return getOutputMap(expectedOutput).equals(getOutputMap(actualOutput));
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

  private static void extactQueryOutput(String filename, int startLineNumber)
      throws InterruptedException, IOException {
    String[] commands = { "/bin/sh", "-c",
        "sed -i '1," + startLineNumber + "d;N;$!P;$!D;$d' " + filename };
    Runtime.getRuntime().exec(commands).waitFor();
  }

  private static String getFileChecksum(String filename)
      throws NoSuchAlgorithmException, IOException {
    MessageDigest digest = MessageDigest.getInstance("MD5");
    InputStream fis = new FileInputStream(filename);
    byte[] dataBytes = new byte[1024];
    int bytesRead = 0;
    while ((bytesRead = fis.read(dataBytes)) != -1) {
      digest.update(dataBytes, 0, bytesRead);
    }
    fis.close();
    byte[] digestBytes = digest.digest();
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i < digestBytes.length; i++) {
      builder.append(Integer.toString((digestBytes[i] & 0xff) + 0x100, 16)
          .substring(1));
    }
    return builder.toString();
  }

  /**
   * Outputs the content of the actual query results. This is maintained in the
   * verifier to keep it as the only processor of the output file.
   * 
   * @return the dump of content of the output file
   */
  public static String getQueryOutputString() {
    return queryOutputString.toString();
  }

  private static Map<String, String> loadBaselineHashcodeTable(
      String baselineFile) throws IOException {
    return loadBaselineHashcodeTable(baselineFile, "\t");
  }

  private static Map<String, String> loadBaselineHashcodeTable(
      String baselineFile, String delimiter) throws IOException {
    Map<String, String> map = new HashMap<String, String>();
    BufferedReader reader = new BufferedReader(new FileReader(baselineFile));
    String line = "";
    while ((line = reader.readLine()) != null) {
      if (!line.contains(delimiter)) {
        continue;
      }
      map.put(line.split(delimiter)[0], line.split(delimiter)[1]);
    }
    reader.close();
    return map;
  }

  private static void updateBaselineHashcodeTable(Map<String, String> map,
      String key, String value, String baselineFile, String delimiter)
      throws IOException {
    if (map.containsKey(key)) {
      return;
    }
    BufferedWriter writer = new BufferedWriter(new FileWriter(baselineFile,
        true));
    writer.write(key + delimiter + value);
    writer.newLine();
    writer.close();
  }

  private static Map<String, Integer> getOutputMap(String filename)
      throws IOException {
    Map<String, Integer> map = new LinkedHashMap<String, Integer>();
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
}
