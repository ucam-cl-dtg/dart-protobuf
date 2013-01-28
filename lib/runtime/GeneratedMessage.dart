// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class GeneratedMessage implements Message {

  BuilderInfo _builderInfo;
  Map<int, dynamic> _fieldValues;
  int _memoizedHashCode = -1;
  int _memoizedIsInitialized = -1;
  int _memoizedSerializedSize = -1;
  Map<int, int> _serializedSize;
  Map<int, Extension> _extensions;
  UnknownFieldSet _unknownFields;

  static GeneratedMessage parseBuffer(Builder builder, List<int> input,
      [ExtensionRegistry extensionRegistry]) {
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    return builder.mergeFromBuffer(input, extensionRegistry).buildParsed();
  }

  static Future<GeneratedMessage> parseStream(Builder builder,
      InputStream input, [ExtensionRegistry extensionRegistry]) {
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    return builder.mergeFromStream(input, extensionRegistry)
        .then((var _) => builder.buildParsed());
  }

  GeneratedMessage(Builder builder)
    : _builderInfo = builder.info_,
      _fieldValues = new Map<int, dynamic>(),
      _serializedSize = new Map<int, int>(),
      _unknownFields = builder.unknownFields;

  bool operator ==(Object o) {
    if (!(o is GeneratedMessage)){
      return false;
    }
    GeneratedMessage om = o;
    if (om._builderInfo != _builderInfo) {
      return false;
    }

    if (_fieldValues.length != om._fieldValues.length) {
      return false;
    }

    // because lengths are equal, sufficient to test inclusion in 1 direction.
    for (int key in _fieldValues.keys) {
      if (!om._fieldValues.containsKey(key) ||
          _fieldValues[key] != om._fieldValues[key]) {
        return false;
      }
    }
    if (om._unknownFields != _unknownFields) return false;
    return true;
  }

  bool extensionsAreInitialized() {
    return true; // fixme
  }

  getField(int tagNumber) {
    Object value = _fieldValues[tagNumber];
    // Initialize the field
    if (value == null) {
      MakeDefaultFunc defaultFunc = _builderInfo.makeDefault(tagNumber);
      if (defaultFunc != null) {
        value = defaultFunc();
      }
    }
    return value;
  }

  int _getFieldType(int tagNumber) {
    int fieldType = _builderInfo.fieldType(tagNumber);
    if (fieldType == null) {
      fieldType = _extensions[tagNumber].type;
    }
    return fieldType;
  }

  // Shorthand for getField
  g_(int tagNumber) => getField(tagNumber);

  int getSerializedSize() {
    if (_memoizedSerializedSize != -1) return _memoizedSerializedSize;
    int size = 0;

    for (int tagNumber in _fieldValues.keys) {
      var fieldValue = _fieldValues[tagNumber];
      int fieldType = _getFieldType(tagNumber) & ~Builder._REQUIRED_BIT;
      size += _computeSize(tagNumber, fieldType, fieldValue);
    }

    size += unknownFields.getSerializedSize();
    _memoizedSerializedSize = size;
    return size;
  }

  int _computeSize(int tagNumber, int fieldType, var fieldValue) {
    int size = 0;
    switch (fieldType) {
      case Builder._OPTIONAL_BOOL:
        return CodedBufferWriter.computeBoolSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_BYTES:
        return CodedBufferWriter.computeBytesSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_STRING:
        return CodedBufferWriter.computeStringSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_FLOAT:
        return CodedBufferWriter.computeFloatSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_DOUBLE:
        return CodedBufferWriter.computeDoubleSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_ENUM:
        return CodedBufferWriter.computeEnumSize(tagNumber, fieldValue.value);
      case Builder._OPTIONAL_GROUP:
        return CodedBufferWriter.computeGroupSize(tagNumber, fieldValue);
      case Builder._OPTIONAL_INT32:
        return CodedBufferWriter.computeInt32Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_INT64:
        return CodedBufferWriter.computeInt64Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_SINT32:
        return CodedBufferWriter.computeSint32Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_SINT64:
        return CodedBufferWriter.computeSint64Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_UINT32:
        return CodedBufferWriter.computeUint32Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_UINT64:
        return CodedBufferWriter.computeUint64Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_FIXED32:
        return CodedBufferWriter.computeFixed32Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_FIXED64:
        return CodedBufferWriter.computeFixed64Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_SFIXED32:
        return CodedBufferWriter.computeSfixed32Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_SFIXED64:
        return CodedBufferWriter.computeSfixed64Size(tagNumber, fieldValue);
      case Builder._OPTIONAL_MESSAGE:
        return CodedBufferWriter.computeMessageSize(tagNumber, fieldValue);
      case Builder._REPEATED_BOOL:
        for (bool val in fieldValue) {
          size += CodedBufferWriter.computeBoolSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_BYTES:
        List<List<int>> list = fieldValue;
        for (List<int> val in list) {
          size += CodedBufferWriter.computeBytesSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_STRING:
        List<String> list = fieldValue;
        for (String val in list) {
          size += CodedBufferWriter.computeStringSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_FLOAT:
        List<double> list = fieldValue;
        for (double val in list) {
          size += CodedBufferWriter.computeFloatSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_DOUBLE:
        List<double> list = fieldValue;
        for (double val in list) {
          size += CodedBufferWriter.computeDoubleSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_ENUM:
        for (var val in fieldValue) {
          size += CodedBufferWriter.computeEnumSize(tagNumber, val.value);
        }
        return size;
      case Builder._REPEATED_GROUP:
        for (var val in fieldValue) {
          size += CodedBufferWriter.computeGroupSize(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_INT32:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeInt32Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_INT64:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeInt64Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_SINT32:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeSint32Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_SINT64:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeSint64Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_UINT32:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeUint32Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_UINT64:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeUint64Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_FIXED32:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeFixed32Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_FIXED64:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeFixed64Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_SFIXED32:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeSfixed32Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_SFIXED64:
        List<int> list = fieldValue;
        for (int val in list) {
          size += CodedBufferWriter.computeSfixed64Size(tagNumber, val);
        }
        return size;
      case Builder._REPEATED_MESSAGE:
        for (Message val in fieldValue) {
          size += CodedBufferWriter.computeMessageSize(tagNumber, val);
        }
        return size;
      case Builder._PACKED_BOOL:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeBoolSizeNoTag);
      case Builder._PACKED_FLOAT:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeFloatSizeNoTag);
      case Builder._PACKED_DOUBLE:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeDoubleSizeNoTag);
      case Builder._PACKED_ENUM:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeEnumSizeNoTag);
      case Builder._PACKED_INT32:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeInt32SizeNoTag);
      case Builder._PACKED_INT64:
       return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeInt64SizeNoTag);
      case Builder._PACKED_UINT32:
       return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeUint32SizeNoTag);
      case Builder._PACKED_UINT64:
       return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeUint64SizeNoTag);
      case Builder._PACKED_SINT32:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeSint32SizeNoTag);
      case Builder._PACKED_SINT64:
       return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeSint64SizeNoTag);
      case Builder._PACKED_FIXED32:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeFixed32SizeNoTag);
      case Builder._PACKED_FIXED64:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeFixed64SizeNoTag);
      case Builder._PACKED_SFIXED32:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeSfixed32SizeNoTag);
      case Builder._PACKED_SFIXED64:
        return _computePackedSize(tagNumber, fieldValue,
            CodedBufferWriter.computeSfixed64SizeNoTag);
      default:
        throw "Unknown type $fieldType";
    }
  }

  int _computePackedSize(int tagNumber, List values, var sizeFunc) {
    int dataSize = 0;
    for (var val in values) {
      dataSize += sizeFunc(val);
    }
    _serializedSize[tagNumber] = dataSize;
    if (!values.isEmpty) {
      dataSize += CodedBufferWriter.computeInt32Size(tagNumber, dataSize);
    }
    return dataSize;
  }

  int getTagNumber(String fieldName) => _builderInfo.tagNumber(fieldName);

  UnknownFieldSet get unknownFields => _unknownFields;

  bool hasField(int tagNumber) => _fieldValues.containsKey(tagNumber);

  // Shorthand for hasField
  bool h_(int tagNumber) => hasField(tagNumber);

  bool hasRequiredFields() => _builderInfo.hasRequiredFields;



  int get hashCode {
    if (_memoizedHashCode == -1) {
      _memoizedHashCode = 0;
      for (int tagNumber in _fieldValues.keys) {
        _memoizedHashCode = (17 * _memoizedHashCode) + tagNumber;
        var value = _fieldValues[tagNumber];
        _memoizedHashCode = (31 * _memoizedHashCode) + value.hashCode;
      }
      if (_unknownFields != null) {
        _memoizedHashCode =
            (23 * _memoizedHashCode) + _unknownFields.hashCode;
      }
    }
    return _memoizedHashCode;
  }


  void _findInvalidFields(List<String> invalidFields, String prefix) {
    _builderInfo._findInvalidFields(_fieldValues, invalidFields, prefix);
  }

  bool isInitialized() {
    if (!hasRequiredFields()) {
      return true;
    }
    if (_memoizedIsInitialized != -1) {
      return _memoizedIsInitialized == 1;
    }

    bool initialized = _builderInfo.isInitialized(_fieldValues);
    _memoizedIsInitialized = initialized ? 1 : 0;
    return initialized;
  }

  String toString() {
    return _toString();
  }

  String _toString({String indent: ""}) {
    StringBuffer s = new StringBuffer();
    void renderValue(key, value) {
      if (value is Message) {
        s.add("${indent}${key}: {\n");
        s.add(value._toString("$indent  "));
        s.add("${indent}}\n");
      } else {
        s.add("${indent}${key}: ${value}\n");
      }
    }

    // Sort output by tag number
    List<FieldInfo> fields = new List<FieldInfo>.from(_builderInfo.fieldInfo.values);
    fields.sort((a, b) => a.tagNumber.compareTo(b.tagNumber));
    List<String> keys = fields.mappedBy((FieldInfo field) => field.name);

    for (FieldInfo field in fields) {
      if (hasField(field.tagNumber)) {
        var fieldValue = _fieldValues[field.tagNumber];
        if (fieldValue is List) {
          // work around http://code.google.com/p/dart/issues/detail?id=3817
          for (int i = 0; i < fieldValue.length; i++) {
            renderValue(field.name, fieldValue[i]);
          }
        } else {
          renderValue(field.name, fieldValue);
        }
      }
    }
    if (_unknownFields != null) {
      s.add(_unknownFields.toString());
    }
    return s.toString();
  }

  List<int> writeToBuffer() {
    CodedBufferWriter out = new CodedBufferWriter(getSerializedSize());
    writeToCodedBufferWriter(out);
    return out.buffer;
  }

  void writeToCodedBufferWriter(CodedBufferWriter output) {
    getSerializedSize();

    List<int> keys = new List<int>.from(_fieldValues.keys);
    keys.sort((a, b) => a.compareTo(b));
    for (int tagNumber in keys) {
      var fieldValue = _fieldValues[tagNumber];
      int fieldType = _getFieldType(tagNumber) & ~Builder._REQUIRED_BIT;
      _writeField(output, tagNumber, fieldType, fieldValue);
    }
    unknownFields.writeToCodedBufferWriter(output);
  }

  void _writeField(CodedBufferWriter output, int tagNumber, int fieldType,
      var fieldValue) {
    switch (fieldType) {
      case Builder._OPTIONAL_BOOL:
        output.writeBool(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_BYTES:
        output.writeBytes(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_STRING:
        output.writeString(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_FLOAT:
        output.writeFloat(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_DOUBLE:
        output.writeDouble(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_ENUM:
        output.writeEnum(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_GROUP:
        output.writeGroup(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_INT32:
        output.writeInt32(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_INT64:
        output.writeInt64(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_SINT32:
        output.writeSint32(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_SINT64:
        output.writeSint64(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_UINT32:
        output.writeUint32(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_UINT64:
        output.writeUint64(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_FIXED32:
        output.writeFixed32(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_FIXED64:
        output.writeFixed64(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_SFIXED32:
        output.writeSfixed32(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_SFIXED64:
        output.writeSfixed64(tagNumber, fieldValue);
        break;
      case Builder._OPTIONAL_MESSAGE:
        output.writeMessage(tagNumber, fieldValue);
        break;
      case Builder._REPEATED_BOOL:
        for (bool val in fieldValue) {
          output.writeBool(tagNumber, val);
        }
        break;
      case Builder._REPEATED_BYTES:
        for (List<int> val in fieldValue) {
          output.writeBytes(tagNumber, val);
        }
        break;
      case Builder._REPEATED_STRING:
        for (String val in fieldValue) {
          output.writeString(tagNumber, val);
        }
        break;
      case Builder._REPEATED_FLOAT:
        for (double val in fieldValue) {
          output.writeFloat(tagNumber, val);
        }
        break;
      case Builder._REPEATED_DOUBLE:
        for (double val in fieldValue) {
          output.writeDouble(tagNumber, val);
        }
        break;
      case Builder._REPEATED_ENUM:
        for (var val in fieldValue) {
          output.writeEnum(tagNumber, val);
        }
        break;
      case Builder._REPEATED_GROUP:
        for (var val in fieldValue) {
          output.writeGroup(tagNumber, val);
        }
        break;
      case Builder._REPEATED_INT32:
        for (int val in fieldValue) {
          output.writeInt32(tagNumber, val);
        }
        break;
      case Builder._REPEATED_INT64:
        for (int val in fieldValue) {
          output.writeInt64(tagNumber, val);
        }
        break;
      case Builder._REPEATED_SINT32:
        for (int val in fieldValue) {
          output.writeSint32(tagNumber, val);
        }
        break;
      case Builder._REPEATED_SINT64:
        for (int val in fieldValue) {
          output.writeSint64(tagNumber, val);
        }
        break;
      case Builder._REPEATED_UINT32:
        for (int val in fieldValue) {
          output.writeUint32(tagNumber, val);
        }
        break;
      case Builder._REPEATED_UINT64:
        for (int val in fieldValue) {
          output.writeUint64(tagNumber, val);
        }
        break;
      case Builder._REPEATED_FIXED32:
        for (int val in fieldValue) {
          output.writeFixed32(tagNumber, val);
        }
        break;
      case Builder._REPEATED_FIXED64:
        for (int val in fieldValue) {
          output.writeFixed64(tagNumber, val);
        }
        break;
      case Builder._REPEATED_SFIXED32:
        for (int val in fieldValue) {
          output.writeSfixed32(tagNumber, val);
        }
        break;
      case Builder._REPEATED_SFIXED64:
        for (int val in fieldValue) {
          output.writeSfixed64(tagNumber, val);
        }
        break;
      case Builder._REPEATED_MESSAGE:
        for (Message val in fieldValue) {
          output.writeMessage(tagNumber, val);
        }
        break;
      case Builder._PACKED_BOOL:
        _writePacked(output, tagNumber, fieldValue,
          output.writeBoolNoTag);
        break;
      case Builder._PACKED_FLOAT:
        _writePacked(output, tagNumber, fieldValue,
            output.writeFloatNoTag);
        break;
      case Builder._PACKED_DOUBLE:
        _writePacked(output, tagNumber, fieldValue,
            output.writeDoubleNoTag);
        break;
      case Builder._PACKED_ENUM:
        _writePacked(output, tagNumber, fieldValue,
            output.writeEnumNoTag);
        break;
      case Builder._PACKED_INT32:
        _writePacked(output, tagNumber, fieldValue,
            output.writeInt32NoTag);
        break;
      case Builder._PACKED_INT64:
        _writePacked(output, tagNumber, fieldValue,
            output.writeInt64NoTag);
        break;
      case Builder._PACKED_UINT32:
        _writePacked(output, tagNumber, fieldValue,
            output.writeUint32NoTag);
        break;
      case Builder._PACKED_UINT64:
        _writePacked(output, tagNumber, fieldValue,
            output.writeUint64NoTag);
        break;
      case Builder._PACKED_SINT32:
        _writePacked(output, tagNumber, fieldValue,
            output.writeSint32NoTag);
        break;
      case Builder._PACKED_SINT64:
        _writePacked(output, tagNumber, fieldValue,
            output.writeSint64NoTag);
        break;
      case Builder._PACKED_FIXED32:
        _writePacked(output, tagNumber, fieldValue,
            output.writeFixed32NoTag);
        break;
      case Builder._PACKED_FIXED64:
        _writePacked(output, tagNumber, fieldValue,
            output.writeFixed64NoTag);
        break;
      case Builder._PACKED_SFIXED32:
        _writePacked(output, tagNumber, fieldValue,
            output.writeSfixed32NoTag);
        break;
      case Builder._PACKED_SFIXED64:
        _writePacked(output, tagNumber, fieldValue,
            output.writeSfixed64NoTag);
        break;
      default:
        throw "Unknown type $fieldType";
    }
  }

  void _writePacked(CodedBufferWriter output, int tagNumber, List values,
      var writeFunc) {
    if (values.length > 0) {
      output.writeTag(tagNumber, WireFormat.WIRETYPE_LENGTH_DELIMITED);
      output.writeInt32NoTag(_serializedSize[tagNumber]);
    }
    for (var val in values) {
      writeFunc(val);
    }
  }

  /**
   * Return [:true:] if the given extension field contains data.  Returns
   * [:false:] for a repeated field with no elements.
   */
  bool hasExtension(Extension extension) {
    return hasField(extension.tagNumber);
  }

  /**
   * Returns the value of the given extension.  For repeated fields that have
   * not been set previously, [:null:] is returned.
   */
  getExtension(Extension extension) {
    Object value = _fieldValues[extension.tagNumber];
    // Initialize the field
    if (value == null) {
      MakeDefaultFunc defaultFunc = extension.makeDefault;
      if (defaultFunc != null) {
        value = defaultFunc();
      }
      if (value != null) {
        _fieldValues[extension.tagNumber] = value;
      }
    }
    return value;
  }

  int getExtensionCount(Extension extension) {
    List list = _fieldValues[extension.tagNumber];
    return list == null ? 0 : list.length;
  }

  // JSON support

  // Append a JSON value to a StringBuffer
  void _writeJsonValue(var fieldValue, int fieldType, StringBuffer sb) {
    fieldType &= ~(Builder._REPEATED_BIT | Builder._PACKED_BIT);
    switch (fieldType) {
    case Builder._BOOL_BIT:
      sb.add(fieldValue == true ? "true" : "false");
      break;
    case Builder._BYTES_BIT:
      // Encode 'bytes' as a base64-encoded string
      sb.add('"');
      sb.add(Base64Codec.defaultInstance.encodeList(fieldValue));
      sb.add('"');
      break;
    case Builder._STRING_BIT:
      // Perform string escaping
      sb.add('"');
      sb.add(PbCodec.escapeString(fieldValue));
      sb.add('"');
      break;
    case Builder._FLOAT_BIT:
    case Builder._DOUBLE_BIT:
      // Force 'xxx.0' output for integral values
      if (fieldValue.floor() == fieldValue) {
        sb.add(fieldValue.floor().toInt());
        sb.add('.0');
      } else {
        sb.add(fieldValue);
      }
      break;
    case Builder._ENUM_BIT:
      ProtobufEnum enum = fieldValue;
      sb.add(enum.value); // assume |value| < 2^52
      break;
    case Builder._INT32_BIT:
    case Builder._SINT32_BIT:
    case Builder._UINT32_BIT:
    case Builder._FIXED32_BIT:
    case Builder._SFIXED32_BIT:
      sb.add(fieldValue);
      break;
    case Builder._INT64_BIT:
    case Builder._SINT64_BIT:
    case Builder._UINT64_BIT:
    case Builder._FIXED64_BIT:
    case Builder._SFIXED64_BIT:
      sb.add('"$fieldValue"');
      break;
    case Builder._GROUP_BIT:
    case Builder._MESSAGE_BIT:
      fieldValue._toJson(sb);
      break;
    default:
      throw "Unknown type $fieldType";
    }
  }

  // Convert this message to JSON, appending it to a StringBuffer
  String _toJson(StringBuffer sb) {
    List<int> keys = new List<int>.from(_fieldValues.keys);
    keys.sort((a, b) => a.compareTo(b));
    sb.add("{");
    bool firstTime = true;
    for (int tagNumber in keys) {
      if (!firstTime) {
        sb.add(",");
      }
      firstTime = false;
      String tagName = _builderInfo.fieldName(tagNumber);
      sb.add('\"$tagNumber\":');
      var fieldValue = _fieldValues[tagNumber];
      int fieldType = _getFieldType(tagNumber) & ~Builder._REQUIRED_BIT;
      if ((fieldType & Builder._REPEATED_BIT) != 0) {
        // Encoded repeated values as an array
        sb.add("[");
        bool ft = true;
        for (var value in fieldValue) {
          if (!ft) {
            sb.add(",");
          }
          ft = false;
          _writeJsonValue(value, fieldType, sb);
        }
        sb.add("]");
      } else {
        _writeJsonValue(fieldValue, fieldType, sb);
      }
    }
    sb.add("}");
  }

  /**
   * Return a JSON string that encodes this message.  Each message (top level
   * or nested) is represented as an object delimited by curly braces.  Within
   * a message, elements are indexed by tag number (surrounded by quotes).
   * Repeated elements are represented as arrays.
   *
   * Boolean values, strings, and floating-point values are represented as
   * literals.  Values with a 32-bit integer datatype are represented as integer
   * literals; values with a 64-bit integer datatype (regardless of their
   * actual runtime value) are represented as strings.  Enumerated values are
   * represented as their integer value.
   */
  String writeToJson() {
    StringBuffer sb = new StringBuffer();
    _toJson(sb);
    return sb.toString();
  }

  // Called from generated code
  static GeneratedMessage parseJson(Builder builder, String input,
      [ExtensionRegistry extensionRegistry]) {
    return builder.mergeFromJson(input, extensionRegistry).buildParsed();
  }
}
