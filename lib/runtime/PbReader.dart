// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * The PbReader reads bytes from some source, careful not to read more bytes
 * than requested on destructive reads.
 */
//interface PbReader {
abstract class PbReader {
  /**
   * Returns whether more data may be available on this PbReader.
   */
  bool get closed;

  /**
   * Provides the position within the current PbReader.
   */
  int get position;

  /**
   * Reads a single byte and makes it available as a Future.
   */
  Future<int> readByte();

  /**
   * Reads the bytes requested and makes them available as a Future.
   * Unspecified byte count instructs the method to read to the end.
   */
  Future<List<int>> readBytes([int count]);

  /**
   * Permits reads beyond current readBytes target for efficiency
   */
  void setReadAhead([int count]);
}

class PbBufferReader {
  PbBufferReader(List<int> bytes) {
    _buffer = new PbByteBuffer();
    _buffer.add(bytes);
  }

  bool get closed => _buffer.isEmpty;

  int get position => _position;

  Future<int> readByte() {
    int byte = _buffer.readByte();
    if (byte != null) _position++;
    return new Future.immediate(byte);
  }

  Future<List<int>> readBytes([int count = -1]) {
    List<int> bytes = _buffer.readBytes(count);
    if (bytes != null) _position += bytes.length;
    return new Future.immediate(bytes);
  }

  void setReadAhead([int count = -1]) {}

  PbByteBuffer _buffer;
  int _position = 0;
}
