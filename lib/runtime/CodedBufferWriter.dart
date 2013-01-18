// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class CodedBufferWriter {

  static int computeBoolSize(int fieldNumber, bool value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfBool;

  static int computeBoolSizeNoTag(bool value) => PbCodec.sizeOfBool;

  static int computeBytesSize(int fieldNumber, List<int> value) =>
      computeTagSize(fieldNumber) + computeBytesSizeNoTag(value);

  static int computeBytesSizeNoTag(List<int> value) =>
      PbCodec.sizeOfInt32(value.length) + value.length;

  static int computeFloatSize(int fieldNumber, double value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed32;

  static int computeFloatSizeNoTag(double value) => PbCodec.sizeOfFixed32;

  static int computeDoubleSize(int fieldNumber, double value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed64;

  static int computeDoubleSizeNoTag(double value) => PbCodec.sizeOfFixed64;

  static int computeEnumSize(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfInt32(value);

  static int computeEnumSizeNoTag(ProtobufEnum value) =>
      PbCodec.sizeOfInt32(value.value);

  static int computeFixed32Size(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed32;

  static int computeFixed32SizeNoTag(int value) => PbCodec.sizeOfFixed32;

  static int computeFixed64Size(int fieldNumber, var value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed64;

  static int computeFixed64SizeNoTag(var value) => PbCodec.sizeOfFixed64;

  static int computeGroupSize(int fieldNumber, Message value) =>
      computeTagSize(fieldNumber) * 2 + value.getSerializedSize();

  static int computeGroupSizeNoTag(Message value) => value.getSerializedSize();

  static int computeInt32Size(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfInt32(value);

  static int computeInt32SizeNoTag(int value) => PbCodec.sizeOfInt32(value);

  static int computeInt64Size(int fieldNumber, var value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfInt64(value);

  static int computeInt64SizeNoTag(var value) => PbCodec.sizeOfInt64(value);

  static int computeMessageSize(int fieldNumber, Message value) =>
      computeTagSize(fieldNumber) + computeMessageSizeNoTag(value);

  static int computeMessageSizeNoTag(Message value) {
    final int size = value.getSerializedSize();
    return PbCodec.sizeOfInt32(size) + size;
  }

  static int computeSfixed32Size(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed32;

  static int computeSfixed32SizeNoTag(int value) => PbCodec.sizeOfFixed32;

  static int computeSfixed64Size(int fieldNumber, var value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfFixed64;

  static int computeSfixed64SizeNoTag(var value) => PbCodec.sizeOfFixed64;

  static int computeSint32Size(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfSint32(value);

  static int computeSint32SizeNoTag(int value) => PbCodec.sizeOfSint32(value);

  static int computeSint64Size(int fieldNumber, var value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfSint64(value);

  static int computeSint64SizeNoTag(var value) => PbCodec.sizeOfSint64(value);

  static int computeStringSize(int fieldNumber, String value) =>
      computeTagSize(fieldNumber) + computeStringSizeNoTag(value);

  static int computeStringSizeNoTag(String value) =>
      PbCodec.sizeOfInt32(value.length) +
          encodeUtf8(value).length;

  static int computeUint32Size(int fieldNumber, int value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfUint32(value);

  static int computeUint64Size(int fieldNumber, var value) =>
      computeTagSize(fieldNumber) + PbCodec.sizeOfUint64(value);

  static int computeUint64SizeNoTag(var value) =>
      PbCodec.sizeOfUint64(value);

  static int computeUint32SizeNoTag(int value) => PbCodec.sizeOfUint32(value);

  static int computeTagSize(int fieldNumber) =>
      PbCodec.sizeOfInt32(WireFormat.makeTag(fieldNumber, 0));

  CodedBufferWriter(int length) :
    _position = 0,
    buffer = createIntArray(length);

  int get length => _position;

  void writeBool(int fieldNumber, bool value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeBoolNoTag(value);
  }

  void writeBoolNoTag(bool value) => writeRawByte(value ? 1 : 0);

  void writeBytes(int fieldNumber, List<int> value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_LENGTH_DELIMITED);
    writeBytesNoTag(value);
  }

  void writeBytesNoTag(List<int> value) {
    writeRawBytes(PbCodec.int32ToBytes(value.length));
    writeRawBytes(value);
  }

  void writeDouble(int fieldNumber, double value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED64);
    writeDoubleNoTag(value);
  }

  void writeDoubleNoTag(double value) =>
    writeRawBytes(PbCodec.doubleToBytes(value));

  void writeEnum(int fieldNumber, ProtobufEnum value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeEnumNoTag(value);
  }

  void writeEnumNoTag(ProtobufEnum value) =>
    writeRawBytes(PbCodec.int32ToBytes(value.value));

  void writeFixed32(int fieldNumber, int value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED32);
    writeFixed32NoTag(value);
  }

  void writeFixed32NoTag(int value) =>
      writeRawBytes(PbCodec.fixed32ToBytes(value));

  void writeFixed64(int fieldNumber, var value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED64);
    writeFixed64NoTag(value);
  }

  void writeFixed64NoTag(var value) =>
      writeRawBytes(PbCodec.fixed64ToBytes(value));

  void writeFloat(int fieldNumber, double value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED32);
    writeFloatNoTag(value);
  }

  void writeFloatNoTag(double value) =>
    writeRawBytes(PbCodec.floatToBytes(value));

  void writeGroup(int fieldNumber, Message value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_START_GROUP);
    writeGroupNoTag(value);
    writeTag(fieldNumber, WireFormat.WIRETYPE_END_GROUP);
  }

  void writeGroupNoTag(Message value) {
    value.writeToCodedBufferWriter(this);
  }

  void writeInt32(int fieldNumber, int value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeInt32NoTag(value);
  }

  void writeInt32NoTag(int value) =>
      writeRawBytes(PbCodec.int32ToBytes(value));

  void writeInt64(int fieldNumber, var value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeInt64NoTag(value);
  }

  void writeInt64NoTag(var value) =>
      writeRawBytes(PbCodec.int64ToBytes(value));

  void writeMessage(int fieldNumber, Message value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_LENGTH_DELIMITED);
    writeMessageNoTag(value);
  }

  void writeMessageNoTag(Message value) {
    writeInt32NoTag(value.getSerializedSize());
    value.writeToCodedBufferWriter(this);
  }

  void writeSfixed32(int fieldNumber, int value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED32);
    writeSfixed32NoTag(value);
  }

  void writeSfixed32NoTag(int value) =>
      writeRawBytes(PbCodec.sfixed32ToBytes(value));

  void writeSfixed64(int fieldNumber, var value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_FIXED64);
    writeSfixed64NoTag(value);
  }

  void writeSfixed64NoTag(var value) =>
      writeRawBytes(PbCodec.sfixed64ToBytes(value));

  void writeSint32(int fieldNumber, int value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeSint32NoTag(value);
  }

  void writeSint32NoTag(int value) =>
      writeRawBytes(PbCodec.sint32ToBytes(value));

  void writeSint64(int fieldNumber, var value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeSint64NoTag(value);
  }

  void writeSint64NoTag(var value) =>
      writeRawBytes(PbCodec.sint64ToBytes(value));

  void writeString(int fieldNumber, String value) =>
      writeBytes(fieldNumber, encodeUtf8(value));

  void writeStringNoTag(String value) =>
      writeBytesNoTag(encodeUtf8(value));

  void writeUint32(int fieldNumber, int value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeUint32NoTag(value);
  }

  void writeUint32NoTag(int value) =>
      writeRawBytes(PbCodec.uint32ToBytes(value));

  void writeUint64(int fieldNumber, var value) {
    writeTag(fieldNumber, WireFormat.WIRETYPE_VARINT);
    writeUint64NoTag(value);
  }

  void writeUint64NoTag(var value) =>
      writeRawBytes(PbCodec.uint64ToBytes(value));

  void writeTag(int fieldNumber, int wireFormat) =>
      writeRawBytes(PbCodec.int32ToBytes(
          WireFormat.makeTag(fieldNumber, wireFormat)));

  void writeRawByte(int value) {
    buffer[_position++] = value & 0xff;
  }

  void writeRawBytes(List<int> value, [int offset = 0, int length = null]) {
    if (length == null) {
      length = value.length - offset;
    }
    buffer.setRange(_position, length, value, offset);
    _position += length;
  }

  final List<int> buffer;
  int _position;
}
