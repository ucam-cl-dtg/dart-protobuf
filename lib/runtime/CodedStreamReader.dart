// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class CodedStreamReader extends CodedReader {
  PbInputStreamReader _input;

  CodedStreamReader(InputStream input, {
      int recursionLimit: CodedReader.DEFAULT_RECURSION_LIMIT,
      int sizeLimit: CodedReader.DEFAULT_SIZE_LIMIT}) :
      super(recursionLimit, sizeLimit),
      _input = new PbInputStreamReader(input);

  bool isAtEnd() => (_currentLimit != -1 &&_bufferPos >= _currentLimit) ||
      _input.closed;

  Future readGroup(int fieldNumber, Builder builder,
      ExtensionRegistry extensionRegistry) {
    if (_recursionDepth >= _recursionLimit) {
      throw InvalidProtocolBufferException.recursionLimitExceeded();
    }
    ++_recursionDepth;
    return builder.mergeFromCodedStreamReader(this).then((_) {
      checkLastTagWas(WireFormat.makeTag(fieldNumber,
          WireFormat.WIRETYPE_END_GROUP));
      --_recursionDepth;
    });
  }

  Future readUnknownFieldSetGroup(int fieldNumber,
      UnknownFieldSet_Builder builder, ExtensionRegistry extensionRegistry) {
    if (_recursionDepth >= _recursionLimit) {
      throw InvalidProtocolBufferException.recursionLimitExceeded();
    }
    ++_recursionDepth;
    return builder.mergeFromCodedStreamReader(this).then((_) {
      checkLastTagWas(WireFormat.makeTag(fieldNumber,
          WireFormat.WIRETYPE_END_GROUP));
      --_recursionDepth;
    });
  }

  Future readMessage(Builder builder, ExtensionRegistry extensionRegistry) {
    int oldLimit;
    return readInt32().then((int length) {
      if(_recursionDepth >= _recursionLimit) {
        throw InvalidProtocolBufferException.recursionLimitExceeded();
      }
      oldLimit = _pushLimit(length);
      ++_recursionDepth;
      return builder.mergeFromCodedStreamReader(this);
    }).then((_){
      checkLastTagWas(0);
      --_recursionDepth;
      _popLimit(oldLimit);
      return null;
    });
  }

  Future<int> readEnum() => readInt32();

  Future<int> readInt32() =>
      readRawVarint().then((v) => PbCodec.toInt32(v));

  Future<int> readInt64() =>
      readRawVarint().then((v) => PbCodec.toInt64(v));

  Future<int> readUint32() =>
      readRawVarint().then((v) => PbCodec.toUint32(v));

  Future<int> readUint64() =>
      readRawVarint().then((v) => PbCodec.toUint64(v));

  Future<int> readSint32() =>
      readRawVarint().then((v) => PbCodec.toSint32(v));

  Future<int> readSint64() =>
      readRawVarint().then((v) => PbCodec.toSint64(v));

  Future<int> readFixed32() =>
      readRaw32().then((v) => PbCodec.toFixed32(v));

  Future<int> readFixed64() =>
      readRaw64().then((v) => PbCodec.toFixed64(v));

  Future<int> readSfixed32() =>
      readRaw32().then((v) => PbCodec.toSfixed32(v));

  Future<int> readSfixed64() =>
      readRaw64().then((v) => PbCodec.toSfixed64(v));

  Future<bool> readBool() =>
      readRawVarint().then((v) => PbCodec.toBool(v));

  Future<List<int>> readBytes() => readRawLengthDelimited();

  Future<String> readString() =>
      readRawLengthDelimited().then((v) => decodeUtf8(v));

  Future<double> readFloat() =>
      readRaw32().then((v) => PbCodec.toFloat(v));

  Future<double> readDouble() =>
      readRaw64().then((v) => PbCodec.toDouble(v));


  Future<int> readTag() {
    if (isAtEnd()) {
      _lastTag = 0;
      return new Future<int>.immediate(0);
    }
    return readInt32().then((int value) {
      _lastTag = value;
      if (WireFormat.getTagFieldNumber(_lastTag) == 0) {
        throw InvalidProtocolBufferException.invalidTag();
      } else {
        return _lastTag;
      }
    });
  }

  Future<List<int>> readRawVarint() {
    List<int> rawBytes = [];
    Future completeVarint() {
      return _readRawByte().then((int value) {
        if (value == null) {
          throw InvalidProtocolBufferException.truncatedMessage();
        }
        rawBytes.add(value);
        if (rawBytes.length < 10 && (value & 0x80) != 0) {
          return completeVarint();
        } else {
          return new Future.immediate(0);
        }
      });
    }
    return completeVarint().then((_) => rawBytes);
  }

  Future<List<int>> readRaw32() => _readRawBytes(4);
  Future<List<int>> readRaw64() => _readRawBytes(8);

  Future<List<int>> readRawLengthDelimited() =>
      readInt32().then((int length) => _readRawBytes(length));

  Future<int> _readRawByte() {
    try {
      _bufferPos++;
      _checkLimit();
    } on InvalidProtocolBufferException catch (e) {
      // add a Future.immediateException() construct...
      Completer<int> c = new Completer<int>();
      c.completeError(e);
      return c.future;
    }
    return _input.readByte().then((int byte) {
      if (byte == null) {
        throw InvalidProtocolBufferException.truncatedMessage();
      }
      return byte;
    });
  }

  Future<List<int>> _readRawBytes(int size) {
    try {
      _bufferPos += size;
      _checkLimit();
    } on InvalidProtocolBufferException catch (e) {
      // add a Future.immediateException() construct...
      Completer<int> c = new Completer<int>();
      c.completeError(e);
      return c.future;
    }
    return _input.readBytes(size);
  }

  Future skipField(int tag) {
    int number = tag >> 3;
    int wireType = tag & 0x7;
    switch (wireType) {
      case WireFormat.WIRETYPE_VARINT:
        return readRawVarint().then((_) => null);
      case WireFormat.WIRETYPE_FIXED64:
        return readRaw64().then((_) => null);
      case WireFormat.WIRETYPE_LENGTH_DELIMITED:
        return readRawLengthDelimited().then((_) => null);
      case WireFormat.WIRETYPE_START_GROUP:
        UnknownFieldSet_Builder subBuilder =
            new UnknownFieldSet_Builder();
        return readUnknownFieldSetGroup(number, subBuilder,
            ExtensionRegistry.EMPTY_REGISTRY).then((_) => null);
      case WireFormat.WIRETYPE_END_GROUP: // should not happen, but ignore?
        return new Future.immediate(null);
      case WireFormat.WIRETYPE_FIXED32:
        return readRaw32().then((_) => null);
    }
  }

  Future skipRawBytes(int number) {
    return _readRawBytes(number).then((_) => null);
  }

  void _enableReadAhead(int numberOfBytes) {
    _input.setReadAhead(numberOfBytes);
  }
}
