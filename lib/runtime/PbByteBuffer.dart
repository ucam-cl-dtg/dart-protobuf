// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * A dynamic byte buffer that acts as a buffering pipe/queue for data.
 */
class PbByteBuffer {
  /**
   * Build empty buffer
   */
  PbByteBuffer() : _buffer = new Queue<List<int>>();

  /**
   * Build with an optional queue of lists (the initial buffer).
   */
  PbByteBuffer.fromQueueOfLists([Queue<List<int>> this._buffer]) {
    if (null != _buffer) {
      for (List<int> l in _buffer) {
        _length += l.length;
      }
    } else {
      _buffer = new Queue<List<int>>();
    }
    _updateBuffers();
  }

  /**
   * Build buffer from a single list.
   */
  PbByteBuffer.fromList(List<int> buffer) {
    _buffer = new Queue<List<int>>();
    _buffer.add(buffer);
    _length = buffer.length;
    _updateBuffers();
  }

  /**
   * Add a list of bytes to the internal buffer queue.
   */
  void add(List<int> more) {
    _length += more.length;
    _buffer.add(more);
  }

  /**
   * Read a single byte.
   */
  int readByte() {
    if(isEmpty) {
      return null;
    } else {
      int value = _buffer.first[_index++];
      _length--;
      _updateBuffers();
      return value;
    }
  }

  /**
   * Read the specified bytes (or as many as are available) and
   * return these as a list of int.
   */
  List<int> readBytes([int count = -1]) {
    List<int> result;

    // USe temporary variables to work around
    // http://code.google.com/p/dart/issues/detail?id=3806
    int c = count;
    int l = _length;
    if (l == 0) return [];
    int remaining = (c < 0 || l < c) ? l : c;

    // optimization -- perhaps you can just pass back the top list.
    if (_index == 0 && _buffer.first.length == remaining) {
      _length -= remaining;
      return _buffer.removeFirst();
    }

    result = createIntArray(remaining);
    int cursor = 0;
    while (remaining > 0) {
      int bytesInFirst = _buffer.first.length - _index;
      if (bytesInFirst <= remaining) {
        result.setRange(cursor,
                        bytesInFirst,
                        _buffer.first,
                        _index);
        _buffer.removeFirst();
        _index = 0;
        _length -= bytesInFirst;
        cursor += bytesInFirst;
        remaining -= bytesInFirst;
      } else {
        result.setRange(cursor,
                        remaining,
                        _buffer.first,
                        _index);
        _index += remaining;
        _length -= remaining;
        remaining = 0;
        _updateBuffers();
        assert(_index < _buffer.first.length);
      }
    }
    return result;
  }

  /**
   * Return the length (remaining bytes available).
   */
  int get length => _length;

  /**
   * Return true if no more data is available in the buffer.
   */
  bool get isEmpty {
    return _buffer.isEmpty;
  }

  /**
   * Provide the remainder of the byte buffer as a list.
   */
  List<int> toList() => readBytes(length);

  void _updateBuffers() {
    while (!_buffer.isEmpty && _index == _buffer.first.length) {
      _buffer.removeFirst();
      _index = 0;
    }
  }

  /**
   * Data structure for buffered bytes.
   */
  Queue<List<int>> _buffer;

  /**
   * Index within the current buffer ([List<int>]).
   */
  int _index = 0;

  /**
   * Total number of bytes remaining in buffers.
   */
  int _length = 0;
}
