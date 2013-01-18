// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class WireFormat {

  static const int TAG_TYPE_BITS = 3;
  static const int TAG_TYPE_MASK = (1 << TAG_TYPE_BITS) - 1;

  static const int WIRETYPE_VARINT = 0;
  static const int WIRETYPE_FIXED64 = 1;
  static const int WIRETYPE_LENGTH_DELIMITED = 2;
  static const int WIRETYPE_START_GROUP = 3;
  static const int WIRETYPE_END_GROUP = 4;
  static const int WIRETYPE_FIXED32 = 5;

  static int getTagFieldNumber(int tag) {
    return (tag & 0x7fffffff) >> TAG_TYPE_BITS; // >>>
  }

  static int getTagWireType(final int tag) {
    return tag & TAG_TYPE_MASK;
  }

  static int makeTag(int fieldNumber, final int wireType) {
    return (fieldNumber << TAG_TYPE_BITS) | wireType;
  }
}
