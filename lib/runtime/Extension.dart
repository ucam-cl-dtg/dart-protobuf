// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * An object representing an extension field.
 */
class Extension extends FieldInfo {

  final String extendee;

  Extension(String this.extendee, String name, int tagNumber, int fieldType,
    [MakeDefaultFunc makeDefault, CreateBuilderFunc subBuilder = null,
     ValueOfFunc valueOf = null]) :
     super(name, tagNumber, fieldType, makeDefault, subBuilder, valueOf);


  int get hashCode => extendee.hashCode * 31 + tagNumber;

  bool operator ==(Extension o) {
    if (o is! Extension) {
      return false;
    }
    return extendee == o.extendee && tagNumber == o.tagNumber;
  }

}

