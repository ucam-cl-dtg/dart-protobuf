// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * Provides an implementation of 'noSuchMethod' that may be used as a
 * substitute for fixed getter and setter methods.
 */
class DynamicBuilder extends Builder {

  /**
   * Implement getXxx, setXxx, and hasXxx methods dynamically.
   */
  Dynamic noSuchMethod(String name, List args) {
    if (name.startsWith("get:")) {
      int tagNumber = info_.tagNumber(name.substring(4));
      if (tagNumber !== null) {
        return getField(tagNumber);
      }
    } else if (name.startsWith("set:")) {
      int tagNumber = info_.tagNumber(name.substring(4));
      if (tagNumber !== null) {
        setField(tagNumber, args[0]);
        return;
      }
    } else if (name.startsWith("has") && name.length > 3) {
      String fieldName = "${name[3].toLowerCase()}${name.substring(4)}";
      int tagNumber = info_.tagNumber(fieldName);
      if (tagNumber !== null) {
        return hasField(tagNumber);
      }
    }
    // Throw an exception like what would have occurred if not intercepted here
    throw new NoSuchMethodException(this, name, args);
  }
}
