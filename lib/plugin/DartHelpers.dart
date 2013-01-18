// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

String dotsToCamelCase(String input, [bool capitalize = false]) =>
    _toCamelCase(input, ".", capitalize);
String underscoresToCamelCase(String input, [bool capitalize = false]) =>
    _toCamelCase(input, "_", capitalize);
String _toCamelCase(String input, String separator, bool capitalize) {
  bool capNextLetter = capitalize;
  int separatorCode = separator.charCodes[0];
  List<int> sb = [];
  for (int i = 0; i < input.length; i++) {
    int char = input.charCodeAt(i);
    if (_StringUtils.isUppercaseLetter(char)) {
      if (capNextLetter) {
        sb.add(char);
      } else {
        sb.add(_StringUtils.toLowercase(char));
      }
      capNextLetter = false;
    } else if (_StringUtils.isLowercaseLetter(char)) {
      if (capNextLetter) {
        sb.add(_StringUtils.toUppercase(char));
      } else {
        sb.add(char);
      }
      capNextLetter = false;
    } else {
      if (char != separatorCode) {
        sb.add(char);
      }
      capNextLetter = true;
    }
  }

  return new String.fromCharCodes(sb);
}

String titlecase(String input) {
  if (input.length > 0) {
    int initial = input.charCodeAt(0);
    if (_StringUtils.isLowercaseLetter(initial)) {
      return "${new String.fromCharCodes([_StringUtils.toUppercase(initial)])}"
          "${input.substring(1)}";
    }
  }
  return input;
}

class FilenameUtils {
  static String basename(String filename) {
    int b = filename.lastIndexOf("/", filename.length - 1);
    int e = filename.lastIndexOf(".", filename.length - 1);
    if (e <= 0) e = filename.length - 1;
    return filename.substring(b + 1, e);
  }
}

class _StringUtils {
  static final int char_A = 65; // "A".charCodeAt(0);
  static final int char_Z = 90; // "Z".charCodeAt(0);

  static final int char_a = 97; // "a".charCodeAt(0);
  static final int char_z = 122; // "z".charCodeAt(0);

  static final int char_0 = 48; // "0".charCodeAt(0);
  static final int char_9 = 58; // "9".charCodeAt(0);

  static bool isLowercaseLetter(int char) =>
      (char_a <= char) && (char <= char_z);
  static bool isNumeric(int char) => (char_0 <= char) && (char <= char_9);
  static bool isUppercaseLetter(int char) =>
      (char_A <= char) && (char <= char_Z);
  static int toLowercase(int char) => char + (char_a - char_A);
  static int toUppercase(int char) => char - (char_a - char_A);
}

class _Bitmask {
  _Bitmask();
  String operator[](int index) => "0x${(1 << (index - 1)).toRadixString(16)}";
}

class _BitmaskUtils {
  static _Bitmask _bitmask;

  static _Bitmask get bit_masks {
    if (_bitmask == null) {
      _bitmask = new _Bitmask();
    }
    return _bitmask;
  }
}
