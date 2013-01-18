// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

abstract class Writer {
  void print(String out);
  void println([String out]);
}

class AbstractWriter {
  static String NEWLINE = "\n";
  static List<int> NEWLINE_CHARS;
  AbstractWriter() {
    if(null == NEWLINE_CHARS) NEWLINE_CHARS = NEWLINE.charCodes;
  }
}

class MemoryWriter extends AbstractWriter implements Writer {
  MemoryWriter(): super(), _buffer = new StringBuffer();

  void print(String out) {
    _buffer.add(out);
  }

  void println([String out = null]) {
    _buffer.add(out);
    _buffer.add(AbstractWriter.NEWLINE);
  }

  String toString() {
    return _buffer.toString();
  }

  StringBuffer _buffer;
}

class OutputStreamWriter extends AbstractWriter implements Writer {
  OutputStreamWriter(OutputStream this._outStream) : super();
  void print(String str) {
    _outStream.write(str.charCodes);
  }
  void println([String out = null]) {
    if(null != out) print(out);
    _outStream.write(AbstractWriter.NEWLINE_CHARS);
  }
  OutputStream _outStream;
}
