// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * An object representing a protobuf message field.
 */
class FieldInfo {
  final String name;
  final int tagNumber;
  final int type;
  final MakeDefaultFunc makeDefault;
  final CreateBuilderFunc subBuilder;
  final ValueOfFunc valueOf;

  FieldInfo(String this.name, int this.tagNumber, int type,
      [MakeDefaultFunc makeDefault, CreateBuilderFunc this.subBuilder = null,
      ValueOfFunc this.valueOf = null])
      : this.type = type, this.makeDefault =
        makeDefault == null ? Builder._defaultForType(type) : makeDefault;

  String toString() => name;
}
