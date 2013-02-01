// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class UnknownFieldSet implements Message {

  static UnknownFieldSet _defaultInstance;

  static UnknownFieldSet get defaultInstance {
    if (_defaultInstance == null) {
      _defaultInstance =
          new UnknownFieldSet
          ._fromBuilder(new Map<int, UnknownFieldSet_Field>());
    }
    return _defaultInstance;
  }

  Map<int, UnknownFieldSet_Field> _fields;

  UnknownFieldSet._fromBuilder(Map<int, UnknownFieldSet_Field> this._fields);

  Map<int, UnknownFieldSet_Field> asMap() => new Map.from(_fields);

  UnknownFieldSet_Field getField(int tagNumber) => _fields[tagNumber];

  int getSerializedSize() {
    int result = 0;
    for (int key in _fields.keys) {
      result += _fields[key].getSerializedSize(key);
    }
    return result;
  }

  bool hasField(int tagNumber) => _fields.containsKey(tagNumber);

  bool hasRequiredFields() => false;

  bool operator ==(Object other) {
    if (other is! UnknownFieldSet) return false;
    UnknownFieldSet o = other;
    if (_fields.length != o._fields.length) return false;
    for (int key in _fields.keys) {
      if (_fields[key] != o._fields[key]) {
        return false;
      }
    }
    return true;
  }



  int get hashCode {
    int hash = 0;
    _fields.forEach((key, value) {
      hash = (19 * hash) + key;
      hash = (27 * hash) + value.hashCode;
    });
    return hash;
  }


  bool isInitialized() => true;

  String toString() => _toString("");

  String _toString(String indent) {
    StringBuffer s = new StringBuffer();

    // Sort output by tag number

    List<int> tags = _fields.keys;
    tags.sort((a, b) => a.compareTo(b));

    for (int tag in tags) {
      UnknownFieldSet_Field field = _fields[tag];
      for (var value in field.values) {
        if (value is UnknownFieldSet) {
          s.add("${indent}${tag}: {\n");
          s.add(value._toString("$indent  "));
          s.add("${indent}}\n");
        } else {
          s.add("${indent}${tag}: ${value}\n");
        }
      }
    }
    return s.toString();
  }

  void writeToCodedBufferWriter(CodedBufferWriter output) {
    for (int key in _fields.keys) {
      _fields[key].writeTo(key, output);
    }
  }

  void _findInvalidFields(List<String> invalidFields, String prefix) {
    // no-op
  }

  // This method is never called from library code, it exists to satisfy the
  // [Message] interface.
  String writeToJson() {
    throw new PbException("JSON output of unknown fields is not supported");
  }
}

class UnknownFieldSet_Builder {

  Map<int, UnknownFieldSet_Field> _fields;
  UnknownFieldSet_Field_Builder _lastField;
  int _lastFieldNumber;

  UnknownFieldSet_Builder([UnknownFieldSet copyFrom]) {
    initialize_();
    if (copyFrom != null) mergeFromUnknownFieldSet(copyFrom);
  }

  UnknownFieldSet_Builder addField(int number, UnknownFieldSet_Field field) {
    _checkFieldNumber(number);
    if (_lastField != null && _lastFieldNumber == number) {
      // Discard this.
      _lastField = null;
      _lastFieldNumber = 0;
    }
    if (_fields == null || _fields.isEmpty) {
      _fields = new Map<int, UnknownFieldSet_Field>();
    }
    _fields[number] = field;
    return this;
  }

  UnknownFieldSet build() {
    _getFieldBuilder(0);  // Force lastField to be built.
    UnknownFieldSet result;
    if (_fields.isEmpty) {
      result = UnknownFieldSet.defaultInstance;
    } else {
      result = new UnknownFieldSet._fromBuilder(_fields);
    }
    return result;
  }

  void clear() {
    initialize_();
  }

  bool isInitialized() => true;

  UnknownFieldSet_Builder mergeField(int number, UnknownFieldSet_Field field) {
    _checkFieldNumber(number);
    if (number == _lastFieldNumber || _fields.containsKey(number)) {
      _getFieldBuilder(number).mergeFromField(field);
    } else {
      // Optimization:  We could call getFieldBuilder(number).mergeFrom(field)
      // in this case, but that would create a copy of the Field object.
      // We'd rather reuse the one passed to us, so call addField() instead.
      addField(number, field);
    }
    return this;
  }

  bool mergeFieldFromBuffer(int tag, CodedBufferReader input) {
    int number = WireFormat.getTagFieldNumber(tag);
    switch (WireFormat.getTagWireType(tag)) {
      case WireFormat.WIRETYPE_VARINT:
        mergeVarintField(number, input.readInt64());
        return true;
      case WireFormat.WIRETYPE_FIXED64:
        Packed64 packed = new Packed64.fromBytes(input.readRaw64());
        mergeFixed64Field(number, packed);
        return true;
      case WireFormat.WIRETYPE_LENGTH_DELIMITED:
        mergeLengthDelimitedField(number, input.readBytes());
        return true;
      case WireFormat.WIRETYPE_START_GROUP:
        UnknownFieldSet_Builder subBuilder = new UnknownFieldSet_Builder();
        input.readUnknownFieldSetGroup(number, subBuilder);
        mergeGroupField(number, subBuilder.build());
        return true;
      case WireFormat.WIRETYPE_END_GROUP:
        return false;
      case WireFormat.WIRETYPE_FIXED32:
        mergeFixed32Field(number, input.readFixed32());
        return true;
      default:
        throw InvalidProtocolBufferException.invalidWireType();
    }
  }

  Future<bool> mergeFieldFromStream(int tag, CodedStreamReader input) {
    int number = WireFormat.getTagFieldNumber(tag);
    switch (WireFormat.getTagWireType(tag)) {
    case WireFormat.WIRETYPE_VARINT:
      return input.readInt64().then((varint) {
        mergeVarintField(number, varint);
        return true;
      });
    case WireFormat.WIRETYPE_FIXED64:
      return input.readFixed64().then((int fixed64) {
        Packed64 packed = new Packed64.fromInt(fixed64);
        mergeFixed64Field(number, packed);
        return true;
      });
    case WireFormat.WIRETYPE_LENGTH_DELIMITED:
      return input.readBytes().then((List<int> bytes) {
        mergeLengthDelimitedField(number, bytes);
        return true;
      });
    case WireFormat.WIRETYPE_START_GROUP:
      UnknownFieldSet_Builder subBuilder = new UnknownFieldSet_Builder();
      return input.readUnknownFieldSetGroup(number, subBuilder,
          ExtensionRegistry.EMPTY_REGISTRY).then( (_) {
            mergeGroupField(number, subBuilder.build());
            return true;
          });
    case WireFormat.WIRETYPE_END_GROUP:
      return new Future<bool>.immediate(false);
    case WireFormat.WIRETYPE_FIXED32:
      return input.readFixed32().then((int fixed32) {
        mergeFixed32Field(number, fixed32);
        return true;
      });
    default:
      throw InvalidProtocolBufferException.invalidWireType();
    }
  }

  void mergeFromCodedBufferReader(CodedBufferReader input) {
    while (true) {
      int tag = input.readTag();
      if (tag == 0 || !mergeFieldFromBuffer(tag, input)) {
        break;
      }
    }
  }

  Future mergeFromCodedStreamReader(CodedStreamReader input) {
    return input.readTag().then((int tag) {
      Future<bool> done;
      if (tag != 0) {
        done = mergeFieldFromStream(tag, input);
      } else {
        done = new Future.immediate(false);
      }
      return done.then((bool result) {
        if(result) {
          return mergeFromCodedStreamReader(input);
        } else {
          return new Future.immediate(null);
        }
      });
    });
  }

  UnknownFieldSet_Builder mergeFromUnknownFieldSet(UnknownFieldSet other) {
    if (other != UnknownFieldSet.defaultInstance) {
      for (int key in other._fields.keys) {
        mergeField(key, other._fields[key]);
      }
    }
    return this;
  }

  _checkFieldNumber(int number) {
    if (number == 0) {
      throw 'new IllegalArgumentException("Zero is not a valid field number.")';
    }
  }

  UnknownFieldSet_Builder mergeFixed32Field(int number, int value) {
    _checkFieldNumber(number);
    _getFieldBuilder(number).addFixed32(value);
    return this;
  }

  UnknownFieldSet_Builder mergeFixed64Field(int number, Packed64 value) {
    _checkFieldNumber(number);
    _getFieldBuilder(number).addFixed64(value);
    return this;
  }

  UnknownFieldSet_Builder mergeGroupField(int number, UnknownFieldSet value) {
    _checkFieldNumber(number);
    _getFieldBuilder(number).addGroup(value);
    return this;
  }

  UnknownFieldSet_Builder mergeLengthDelimitedField(int number,
      List<int> value) {
    _checkFieldNumber(number);
    _getFieldBuilder(number).addLengthDelimited(value);
    return this;
  }

  UnknownFieldSet_Builder mergeVarintField(int number, var value) {
    _checkFieldNumber(number);
    _getFieldBuilder(number).addVarint(value);
    return this;
  }

  void initialize_() {
    _fields = new Map<int, UnknownFieldSet_Field>();
    _lastFieldNumber = 0;
    _lastField = null;
  }

  UnknownFieldSet_Field_Builder _getFieldBuilder(int number) {
    if (_lastField != null) {
      if (number == _lastFieldNumber) {
        return _lastField;
      }
      // Note:  addField() will reset lastField and lastFieldNumber.
      addField(_lastFieldNumber, _lastField.buildField());
    }
    if (number == 0) {
      return null;
    } else {
      UnknownFieldSet_Field existing = _fields != null ? _fields[number] : null;
      _lastFieldNumber = number;
      _lastField = new UnknownFieldSet_Field_Builder();
      if (existing != null) {
        _lastField.mergeFromField(existing);
      }
      return _lastField;
    }
  }
}

class UnknownFieldSet_Field {

  List<List<int>> _lengthDelimited;
  List<dynamic> _varint;
  List<int> _fixed32;
  List<Packed64> _fixed64;
  List<UnknownFieldSet> _group;

  UnknownFieldSet_Field();

  bool operator ==(Object other) {
    if (other is! UnknownFieldSet_Field) return false;
    UnknownFieldSet_Field o = other;
    if (_lengthDelimited.length != o._lengthDelimited.length) return false;
    for (int i = 0; i < _lengthDelimited.length; i++) {
      List<int> myLengthDelimited = _lengthDelimited[i];
      List<int> theirLengthDelimited = o._lengthDelimited[i];
      if (myLengthDelimited.length != theirLengthDelimited.length) {
        return false;
      }
      for (int j = 0; j < myLengthDelimited.length; j++) {
        if (myLengthDelimited[j] != theirLengthDelimited[j]) return false;
      }
    }
    if (_varint != o._varint) return false;
    if (_fixed32 != o._fixed32) return false;
    if (_fixed64 != o._fixed64) return false;
    if (_group != o._group) return false;
    return true;
  }


  int get hashCode {
    int hash = 7;
    _lengthDelimited.forEach((List<int> e) {
      hash += 5;
      e.forEach((int f) => hash = (hash * 11) + f);
    });
    _varint.forEach((e) => hash = (hash * 13) + e.hashCode);
    _fixed32.forEach((int e) => hash = (hash * 17) + e);
    _fixed64.forEach((Packed64 e) => hash = (hash * 23) + e.hashCode);
    _group.forEach((UnknownFieldSet e) => hash = (hash * 29) + e.hashCode);
    return hash;
  }


  List<List<int>> get lengthDelimitedList => _lengthDelimited;
  List get varintList => _varint;
  List<int> get fixed32List => _fixed32;
  List<Packed64> get fixed64List => _fixed64;
  List<UnknownFieldSet> get groupList => _group;
  List get values {
    List v = [];
    if (_lengthDelimited != null) v.addAll(_lengthDelimited);
    if (_varint != null) v.addAll(_varint);
    if (_fixed32 != null) v.addAll(_fixed32);
    if (_fixed64 != null) v.addAll(_fixed64);
    if (_group != null) v.addAll(_group);
    return v;
  }

  int getSerializedSize(int fieldNumber) {
    int result = 0;
    for (var value in _varint) {
      result += CodedBufferWriter.computeUint64Size(fieldNumber, value);
    }
    for (int value in _fixed32) {
      result += CodedBufferWriter.computeFixed32Size(fieldNumber, value);
    }
    for (Packed64 value in _fixed64) {
      result += CodedBufferWriter.computeFixed64Size(fieldNumber, value);
    }
    for (List<int> value in _lengthDelimited) {
      result += CodedBufferWriter.computeBytesSize(fieldNumber, value);
    }
    for (UnknownFieldSet value in _group) {
      result += CodedBufferWriter.computeGroupSize(fieldNumber, value);
    }
    return result;
  }

  void writeTo(int fieldNumber, CodedBufferWriter output) {
    for (var value in _varint) {
      output.writeUint64(fieldNumber, value);
    }
    for (int value in _fixed32) {
      output.writeFixed32(fieldNumber, value);
    }
    for (Packed64 value in _fixed64) {
      output.writeFixed64(fieldNumber, value);
    }
    for (List<int> value in _lengthDelimited) {
      output.writeBytes(fieldNumber, value);
    }
    for (UnknownFieldSet value in _group) {
      output.writeGroup(fieldNumber, value);
    }
  }

  void _findInvalidFields(List<String> invalidFields, String prefix) {
    // no-op
  }
}

class UnknownFieldSet_Field_Builder {

  static UnknownFieldSet_Field_Builder create() {
    UnknownFieldSet_Field_Builder builder = new UnknownFieldSet_Field_Builder();
    builder._result = new UnknownFieldSet_Field();
    return builder;
  }

  UnknownFieldSet_Field _result;

  UnknownFieldSet_Field_Builder() : _result = new UnknownFieldSet_Field();

  void initialize_() {
    if (_result == null) _result = new UnknownFieldSet_Field();
  }

  UnknownFieldSet_Field_Builder addGroup(UnknownFieldSet value) {
    initialize_();
    if (_result._group == null) _result._group = new List<UnknownFieldSet>();
    _result._group.add(value);
    return this;
  }

  UnknownFieldSet_Field_Builder addLengthDelimited(List<int> value) {
    initialize_();
    if (_result._lengthDelimited == null) {
      _result._lengthDelimited = new List<List<int>>();
    }
    _result._lengthDelimited.add(value);
    return this;
  }

  UnknownFieldSet_Field_Builder addFixed32(int value) {
    initialize_();
    if (_result._fixed32 == null) _result._fixed32 = new List<int>();
    _result._fixed32.add(value);
    return this;
  }

  UnknownFieldSet_Field_Builder addFixed64(Packed64 value) {
    initialize_();
    if (_result._fixed64 == null) _result._fixed64 = new List<Packed64>();
    _result._fixed64.add(value);
    return this;
  }

  UnknownFieldSet_Field_Builder addVarint(value) {
    initialize_();
    if (_result._varint == null) _result._varint = new List();
    _result._varint.add(value);
    return this;
  }

  UnknownFieldSet_Field build() => buildField();

  UnknownFieldSet_Field buildField() {
    UnknownFieldSet_Field returnMe = new UnknownFieldSet_Field();
    if (_result._varint == null) {
      returnMe._varint = new List(0);
    } else {
      returnMe._varint = new PbImmutableList.from(_result._varint);
    }
    if (_result._fixed32 == null) {
      returnMe._fixed32 = new List<int>(0);
    } else {
      returnMe._fixed32 = new PbImmutableList.from(_result._fixed32);
    }
    if (_result._fixed64 == null) {
      returnMe._fixed64 = new List<Packed64>(0);
    } else {
      returnMe._fixed64 = new PbImmutableList.from(_result._fixed64);
    }
    if (_result._lengthDelimited == null) {
      returnMe._lengthDelimited = new List<List<int>>(0);
    } else {
      returnMe._lengthDelimited =
          new PbImmutableList.from(_result._lengthDelimited);
    }
    if (_result._group == null) {
      returnMe._group = new List<UnknownFieldSet>(0);
    } else {
      returnMe._group = new PbImmutableList.from(_result._group);
    }
    return returnMe;
  }

  Message buildPartial() => null;

  bool hasRequiredFields() => false;

  bool isInitialized() => true;

  int get length => _result.values.length;

  UnknownFieldSet_Field_Builder mergeFromField(UnknownFieldSet_Field other) {
    if (!other._varint.isEmpty) {
      if (_result._varint == null) {
        _result._varint = new List();
      }
      _result._varint.addAll(other._varint);
    }
    if (!other._fixed32.isEmpty) {
      if (_result._fixed32 == null) {
        _result._fixed32 = new List<int>();
      }
      _result._fixed32.addAll(other._fixed32);
    }
    if (!other._fixed64.isEmpty) {
      if (_result._fixed64 == null) {
        _result._fixed64 = new List<Packed64>();
      }
      _result._fixed64.addAll(other._fixed64);
    }
    if (!other._lengthDelimited.isEmpty) {
      if (_result._lengthDelimited == null) {
        _result._lengthDelimited = new List<List<int>>();
      }
      _result._lengthDelimited.addAll(other._lengthDelimited);
    }
    if (!other._group.isEmpty) {
      if (_result._group == null) {
        _result._group = new List<UnknownFieldSet>();
      }
      _result._group.addAll(other._group);
    }
    return this;
  }
}
