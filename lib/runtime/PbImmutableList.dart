// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/*
 * This is a wrapper around a fixed-length list with modifications disabled.
 */
class PbImmutableList<T> extends ImmutableList<T> {
  PbImmutableList.from(List<T> list) : super.from(list);

  String toString() {
    return "PbImmutableList";
  }
}
