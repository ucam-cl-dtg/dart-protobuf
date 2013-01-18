// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

/**
 * Represents the configuration of a Protoc call to dart to generate code.
 */
class ProtocGenDartConfig {
  ProtocGenDartConfig() : protoFiles = [], valid = true;
  String out;
  String parameter;
  bool valid;
  List<String> protoFiles;
  String toString() {
    String files = Strings.join(protoFiles,', ');
    return "ProtocGenDartConfig: $out, $parameter [$files]";
  }
}

