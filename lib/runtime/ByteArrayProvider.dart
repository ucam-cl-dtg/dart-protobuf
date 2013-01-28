// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * Provides a ByteArray based version of integer arrays.
 */

//#import 'dart:html';
//#import('dart:core');


List<int> createIntArray(int length) => new Uint8List(length);
List<int> createIntArrayFrom(List<int> source) {
  Uint8List array = new Uint8List(source.length);
  array.setRange(0, source.length, source, 0);
  return array;
}
