// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

class ProtocException {
  String message;

  ProtocException(this.message) { }

  String toString() => message;
}

class InvalidDefaultValue extends ProtocException {
  InvalidDefaultValue(String message) :
      super("InvalidDefaultValue: $message") { }

  static InvalidDefaultValue invalidDoubleValue(String fieldName,
      String invalidValue) {
    return new InvalidDefaultValue(
        "Protoc found invalid default value ($invalidValue) for the "
            "'double' field ${fieldName}");
  }
}

