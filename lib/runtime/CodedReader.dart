// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

abstract class CodedReader {
  //static final int DEFAULT_RECURSION_LIMIT = 64;
  //static final int DEFAULT_SIZE_LIMIT = 64 << 20;

  static const int DEFAULT_RECURSION_LIMIT = 64;
  static const int DEFAULT_SIZE_LIMIT = 64 << 20;

  int _bufferPos = 0;
  int _bufferSize = 0;
  int _bufferSizeAfterLimit = 0;
  int _currentLimit = -1;
  int _lastTag = 0;
  int _recursionDepth = 0;
  int _recursionLimit;
  int _sizeLimit;
  int _totalBytesRetired = 0;

  CodedReader(this._recursionLimit, this._sizeLimit);

  void checkLastTagWas(int value) {
    if (_lastTag != value) {
      throw InvalidProtocolBufferException.invalidEndTag();
    }
  }

  int getBytesUntilLimit() =>
      _currentLimit >= 0 ? _currentLimit - (_totalBytesRetired + _bufferPos) :
      -1;

  bool isAtEnd();

  /**
   * Restores the limit to a particular absolute position as returned from
   * [_pushLimit].
   */
  void _popLimit(int oldLimit) {
    _currentLimit = oldLimit;
  }

  /**
   * Push a new limit that includes [size] bytes past the current cursor
   * location. The method returns the current limit (absolute position).
   */
  int _pushLimit(int byteLimit) {
    if (byteLimit < 0) {
      throw InvalidProtocolBufferException.negativeSize();
    }
    if (_currentLimit == -1) _enableReadAhead(byteLimit);
    byteLimit += _bufferPos;
    int oldLimit = _currentLimit;
    if ((oldLimit != -1 && byteLimit > oldLimit) || byteLimit > _sizeLimit) {
      throw InvalidProtocolBufferException.truncatedMessage();
    }
    _currentLimit = byteLimit;
    return oldLimit;
  }

  void _enableReadAhead(int numberOfBytes) {}

  void _checkLimit() {
    if ((_currentLimit != -1 && _bufferPos > _currentLimit) ||
        _bufferPos > _sizeLimit) {
      throw InvalidProtocolBufferException.truncatedMessage();
    }
  }
}
