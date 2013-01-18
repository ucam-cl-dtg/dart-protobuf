// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class ByteListUtils {
  static String toRawBytesAsString(List<int> bytes) {
    List<String> _bytes = [];
    for(int b in bytes) {
      _bytes.add(toHex(b));
    }
    return Strings.join(_bytes, " ");
  }

  static final String HEX_CHARS = "0123456789abcdef";
  static String toHex(int dec, [int minLength = 2]) {
    List<int> hexCodes = [];
    int len = 0;
    while (len < minLength || dec > 0) {
      hexCodes.add(HEX_CHARS.charCodeAt(dec & 0xf));
      dec >>= 4;
      len ++;
    }
    List<int> strSrc = [];
    for (int i = hexCodes.length - 1; i >= 0; i--) {
      strSrc.add(hexCodes[i]);
    }
    return new String.fromCharCodes(strSrc);
  }

  static String toBits(int dec, [int minLength = 8]) {
    Queue<String> q = new Queue();
    int len = 0;
    while (len < minLength || dec > 0) {
      if(len > 0 && len % 4 == 0) q.addFirst(" ");
      q.addFirst("${dec & 0x1}");
      dec >>= 1;
      len ++;
    }
    StringBuffer sb = new StringBuffer();
    for(String i in q) {
      sb.add(i);
    }
    return sb.toString();
  }
}
