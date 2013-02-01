// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class ProtobufEnum {
  final int _index;
  final int _value;
  final String _name;

  const ProtobufEnum(this._index, this._value, this._name);

  static Map<int, ProtobufEnum> initByValue(List<ProtobufEnum> byIndex) {
    Map<int, ProtobufEnum> byValue = new Map<int, dynamic>();
    for (ProtobufEnum v in byIndex) {
      byValue[v.value] = v;
    }
    return byValue;
  }



//TODO FIX THIS
  int get hashCode => _value;


  String get name => _name;
  int get value => _value;
  int get index => _index;
}
