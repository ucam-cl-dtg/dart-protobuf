// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//interface Message {
class Message {
  int getSerializedSize();
  bool hasRequiredFields();
  bool isInitialized();
  void writeToCodedBufferWriter(CodedBufferWriter output);
  String writeToJson();
  void _findInvalidFields(List<String> invalidFields, String prefix);
}
