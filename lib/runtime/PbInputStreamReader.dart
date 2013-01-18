// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class PbInputStreamReader implements PbReader {

  PbInputStreamReader(InputStream this._inputStream)
    : _buffer = new PbByteBuffer();

  bool get closed => _inputStream.closed && _buffer.isEmpty;

  int get position => _position;

  Future<int> readByte() =>
     readBytes(1).transform((List<int> b) => b.length > 0 ? b[0] : null);

  Future<List<int>> readBytes([int count = -1]) {
    if (_completer != null) throw new PbBufferBusyStateException();
    if (count == 0) {
      return new Future.immediate(<int>[]);
    } else if ((count > 0 && _buffer.length >= count) || _inputStream.closed) {
      return new Future.immediate(_buffer.readBytes(count));
    } else {
      _completer = new Completer<List<int>>();
      _bytesToReturn = count;
      _bytesToRead = (count >= 0) && (_bytesToRead >= 0) ?
          Math.max(count, _bytesToRead) : -1;
      _readIntoPbByteBuffer();
      return _completer.future;
    }
  }

  void setReadAhead([int count]) {
    _bytesToRead = (count >= 0) && (_bytesToRead >= 0) ?
        Math.max(count, _bytesToRead) : -1;
    _readIntoPbByteBuffer();
  }

  void _fulfillRequest() {
    if (_completer != null &&
        ((_bytesToReturn > 0 && _buffer.length >= _bytesToReturn) ||
        _inputStream.closed)) {
      Completer c = _completer;
      _completer = null;

      List<int> bytes = _buffer.readBytes(_bytesToReturn);
      _position += bytes.length;
      c.complete(bytes);
    }
  }

  void _handleDataReadToLength() {
    int availableBytes = _inputStream.available();
    if (availableBytes > 0) {
      int readSize = Math.min(availableBytes, _bytesToRead);
      List<int> data = _inputStream.read(readSize);
      if (null != data) {
        _buffer.add(data);
        _bytesToRead -= data.length;
        if (_bytesToRead == 0) {
          _reset();
        }
      }
    }
    _fulfillRequest();
  }

  void _handleDataReadToEnd() {
    if (_inputStream.available() > 0) {
      List<int> data = _inputStream.read();
      if (null != data) {
        _buffer.add(data);
      }
    }
    _fulfillRequest();
  }

  void _handleClose() {
    _reset();
    _fulfillRequest();
  }

  void _handleError(Exception e) {
    _reset();
    _completer.completeException(e);
  }

  /**
   * Reads the bytes requested and mark their availability with the
   * returned Future.
   */
  void _readIntoPbByteBuffer() {
    if(_bytesToRead < 0) {
      _inputStream.onClosed = _handleClose;
      _inputStream.onError = _handleError;
      _inputStream.onData = _handleDataReadToEnd;
    } else if (_bytesToRead > 0) {
      _inputStream.onClosed = _handleClose;
      _inputStream.onError = _handleError;
      _inputStream.onData = _handleDataReadToLength;
    }
  }

  void _reset() {
    _inputStream.onData = null;
    _inputStream.onClosed = null;
    _inputStream.onError = null;
  }

  InputStream _inputStream;
  PbByteBuffer _buffer;
  int _bytesToReturn;
  int _bytesToRead = 0;
  Completer<List<int>> _completer;
  int _position = 0;
}
