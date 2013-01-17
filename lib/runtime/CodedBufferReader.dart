// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class CodedBufferReader extends CodedReader {
  PbByteBuffer _input;

  CodedBufferReader.fromBuffer(List<int> _buffer, [
      int recursionLimit = CodedReader.DEFAULT_RECURSION_LIMIT,
      int sizeLimit = CodedReader.DEFAULT_SIZE_LIMIT]) :
      super(recursionLimit, sizeLimit),
      _input = new PbByteBuffer.fromList(_buffer);

  bool isAtEnd() =>
      (_currentLimit != -1 && _bufferPos >= _currentLimit) || _input.isEmpty;

  void readGroup(int fieldNumber, Builder builder,
      ExtensionRegistry extensionRegistry) {
    if (_recursionDepth >= _recursionLimit) {
      throw InvalidProtocolBufferException.recursionLimitExceeded();
    }
    ++_recursionDepth;
    builder.mergeFromCodedBufferReader(this);
    checkLastTagWas(WireFormat.makeTag(fieldNumber,
        WireFormat.WIRETYPE_END_GROUP));
    --_recursionDepth;
  }

  void readUnknownFieldSetGroup(int fieldNumber, UnknownFieldSet_Builder builder) {
    if (_recursionDepth >= _recursionLimit) {
      throw InvalidProtocolBufferException.recursionLimitExceeded();
    }
    ++_recursionDepth;
    builder.mergeFromCodedBufferReader(this);
    checkLastTagWas(WireFormat.makeTag(fieldNumber,
        WireFormat.WIRETYPE_END_GROUP));
    --_recursionDepth;
  }

  void readMessage(Builder builder, ExtensionRegistry extensionRegistry) {
    int length = readInt32();
    if (_recursionDepth >= _recursionLimit) {
      throw InvalidProtocolBufferException.recursionLimitExceeded();
    }
    int oldLimit = _pushLimit(length);
    ++_recursionDepth;
    builder.mergeFromCodedBufferReader(this);
    checkLastTagWas(0);
    --_recursionDepth;
    _popLimit(oldLimit);
  }

  int readEnum() => readInt32();
  int readInt32() => PbCodec.toInt32(readRawVarint());
  Dynamic readInt64() => PbCodec.toInt64(readRawVarint());
  int readUint32() => PbCodec.toUint32(readRawVarint());
  int readUint64() => PbCodec.toUint64(readRawVarint());
  int readSint32() => PbCodec.toSint32(readRawVarint());
  Dynamic readSint64() => PbCodec.toSint64(readRawVarint());
  int readFixed32() => PbCodec.toFixed32(readRaw32());
  Dynamic readFixed64() => PbCodec.toFixed64(readRaw64());
  int readSfixed32() => PbCodec.toSfixed32(readRaw32());
  Dynamic readSfixed64() => PbCodec.toSfixed64(readRaw64());
  bool readBool() => PbCodec.toBool(readRawVarint());
  List<int> readBytes() => readRawLengthDelimited();
  String readString() => decodeUtf8(readRawLengthDelimited());
  double readFloat() => PbCodec.toFloat(readRaw32());
  double readDouble() => PbCodec.toDouble(readRaw64());

  int readTag() {
    if (isAtEnd()) {
      _lastTag = 0;
      return 0;
    }

    _lastTag = readInt32();
    if (WireFormat.getTagFieldNumber(_lastTag) == 0) {
      throw InvalidProtocolBufferException.invalidTag();
    }
    return _lastTag;
  }

  List<int> readRawVarint() {
    List<int> rawBytes = [];
    rawBytes.add(_readRawByte());
    while (rawBytes.length < 10 && (rawBytes.last & 0x80) != 0) {
      int byte = _readRawByte();
      if (byte == null) {
        throw InvalidProtocolBufferException.truncatedMessage();
      }
      rawBytes.add(byte);
    }
    if ((rawBytes.last & 0x80) != 0) {
      throw InvalidProtocolBufferException.malformedVarint();
    }
    return rawBytes;
  }

  List<int> readRaw32() => readRawFixed(4);
  List<int> readRaw64() => readRawFixed(8);
  List<int> readRawFixed(int length) => _readRawBytes(length);

  List<int> readRawLengthDelimited() {
    int length = readInt32();
    return _readRawBytes(length);
  }

  int _readRawByte() {
    _bufferPos++;
    _checkLimit();
    int byte = _input.readByte();
    if (byte == null) {
      throw InvalidProtocolBufferException.truncatedMessage();
    }
    return byte;
  }

  List<int> _readRawBytes(int size) {
    _bufferPos += size;
    _checkLimit();
    List<int> bytes = _input.readBytes(size);
    return bytes;
  }

  void skipField(int tag) {
    int number = tag >> 3;
    int wireType = tag & 0x7;
    switch (wireType) {
      case WireFormat.WIRETYPE_VARINT:
        readRawVarint();
        return;
      case WireFormat.WIRETYPE_FIXED64:
        readRaw64();
        return;
      case WireFormat.WIRETYPE_LENGTH_DELIMITED:
        readRawLengthDelimited();
        return;
      case WireFormat.WIRETYPE_START_GROUP:
        UnknownFieldSet_Builder subBuilder = new UnknownFieldSet_Builder();
        readUnknownFieldSetGroup(number, subBuilder);
        return;
      case WireFormat.WIRETYPE_END_GROUP: // should not happen, but ignore?
        return;
      case WireFormat.WIRETYPE_FIXED32:
        readRaw32();
        return;
    }
  }

  void skipRawBytes(int number) {
    _readRawBytes(number);
  }
}
