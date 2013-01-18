// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

class IndentingWriter implements Writer {
  IndentingWriter(String this._indentSequence, Writer this._writer)
    : _currentIndent = "";

  /*
   * nice shorthand for adding content
   */
  void addBlock(String start, String end, void body()) {
    println(start);
    indent();
    body();
    outdent();
    println(end);
  }
  /*
   * Shift the left-most character of new lines to the right by one
   * indentation stop (as set in the constructor).
   */
  void indent() {
    _currentIndent = _currentIndent.concat(_indentSequence);
  }

  /*
   * Shift the left-most character of new lines to the left by one
   * indentation stop (as set in the constructor).
   */
  void outdent() {
    _currentIndent = _currentIndent.substring(0,
        max(0,_currentIndent.length - _indentSequence.length));
  }

  void print(String stringToPrint) {
    if (_currentLine == null) {
      _currentLine = new StringBuffer();
    }
    _currentLine.add(stringToPrint);
  }

  /*
   * Add the specified line to the output buffer with the current
   * level of indent. If the input string is multiple lines,
   * split them and apply the indent to each line.
   *
   * Lines are effectively joined with new-lines (e.g. not appended
   * to every interim line).
   */
  void println([String out = null]) {
    // TODO - not clear how this plays cross-platform.
    // more sophisticated patterns don't seem to match.
    String string;
    if (_currentLine != null) {
      _currentLine.add(out == null ? "" : out);
      string = _currentLine.toString();
      _currentLine = null;
    } else {
      string = out == null ? "" : out;
    }

    List<String> lines = string.split("\n");
    for (String line in lines) {
      if (line.length > 0) _writer.print(_currentIndent);
      _writer.println(line);
    }
  }

  /*
   * Add a blank line to the output buffer.
   */
  void blankLine() {
    println("");
  }

  /*
   * Push out the current line (see print()) if non-empty.
   */
  void flushLine() {
    if (_currentLine != null && _currentLine.length > 0) println("");
  }

  StringBuffer _currentLine;
  Writer _writer;
  String _currentIndent;
  String _indentSequence;
}
