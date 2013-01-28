// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

typedef Builder CreateBuilderFunc();
typedef Object MakeDefaultFunc();
typedef ProtobufEnum ValueOfFunc(int value);

abstract class Builder implements ChangeListener {
  static const int _REQUIRED_BIT      = 0x1;
  static const int _REPEATED_BIT      = 0x2;
  static const int _PACKED_BIT        = 0x4;

  static const int _BOOL_BIT         = 0x10;
  static const int _BYTES_BIT        = 0x20;
  static const int _STRING_BIT       = 0x40;
  static const int _DOUBLE_BIT       = 0x80;
  static const int _FLOAT_BIT       = 0x100;
  static const int _ENUM_BIT        = 0x200;
  static const int _GROUP_BIT       = 0x400;
  static const int _INT32_BIT       = 0x800;
  static const int _INT64_BIT      = 0x1000;
  static const int _SINT32_BIT     = 0x2000;
  static const int _SINT64_BIT     = 0x4000;
  static const int _UINT32_BIT     = 0x8000;
  static const int _UINT64_BIT    = 0x10000;
  static const int _FIXED32_BIT   = 0x20000;
  static const int _FIXED64_BIT   = 0x40000;
  static const int _SFIXED32_BIT  = 0x80000;
  static const int _SFIXED64_BIT = 0x100000;
  static const int _MESSAGE_BIT  = 0x200000;

  static const int _OPTIONAL_BOOL = _BOOL_BIT;
  static const int _OPTIONAL_BYTES = _BYTES_BIT;
  static const int _OPTIONAL_STRING = _STRING_BIT;
  static const int _OPTIONAL_FLOAT = _FLOAT_BIT;
  static const int _OPTIONAL_DOUBLE = _DOUBLE_BIT;
  static const int _OPTIONAL_ENUM = _ENUM_BIT;
  static const int _OPTIONAL_GROUP = _GROUP_BIT;
  static const int _OPTIONAL_INT32 = _INT32_BIT;
  static const int _OPTIONAL_INT64 = _INT64_BIT;
  static const int _OPTIONAL_SINT32 = _SINT32_BIT;
  static const int _OPTIONAL_SINT64 = _SINT64_BIT;
  static const int _OPTIONAL_UINT32 = _UINT32_BIT;
  static const int _OPTIONAL_UINT64 = _UINT64_BIT;
  static const int _OPTIONAL_FIXED32 = _FIXED32_BIT;
  static const int _OPTIONAL_FIXED64 = _FIXED64_BIT;
  static const int _OPTIONAL_SFIXED32 = _SFIXED32_BIT;
  static const int _OPTIONAL_SFIXED64 = _SFIXED64_BIT;
  static const int _OPTIONAL_MESSAGE = _MESSAGE_BIT;

  static const int _REQUIRED_BOOL = _REQUIRED_BIT | _BOOL_BIT;
  static const int _REQUIRED_BYTES = _REQUIRED_BIT | _BYTES_BIT;
  static const int _REQUIRED_STRING = _REQUIRED_BIT | _STRING_BIT;
  static const int _REQUIRED_FLOAT = _REQUIRED_BIT | _FLOAT_BIT;
  static const int _REQUIRED_DOUBLE = _REQUIRED_BIT | _DOUBLE_BIT;
  static const int _REQUIRED_ENUM = _REQUIRED_BIT | _ENUM_BIT;
  static const int _REQUIRED_GROUP = _REQUIRED_BIT | _GROUP_BIT;
  static const int _REQUIRED_INT32 = _REQUIRED_BIT | _INT32_BIT;
  static const int _REQUIRED_INT64 = _REQUIRED_BIT | _INT64_BIT;
  static const int _REQUIRED_SINT32 = _REQUIRED_BIT | _SINT32_BIT;
  static const int _REQUIRED_SINT64 = _REQUIRED_BIT | _SINT64_BIT;
  static const int _REQUIRED_UINT32 = _REQUIRED_BIT | _UINT32_BIT;
  static const int _REQUIRED_UINT64 = _REQUIRED_BIT | _UINT64_BIT;
  static const int _REQUIRED_FIXED32 = _REQUIRED_BIT | _FIXED32_BIT;
  static const int _REQUIRED_FIXED64 = _REQUIRED_BIT | _FIXED64_BIT;
  static const int _REQUIRED_SFIXED32 = _REQUIRED_BIT | _SFIXED32_BIT;
  static const int _REQUIRED_SFIXED64 = _REQUIRED_BIT | _SFIXED64_BIT;
  static const int _REQUIRED_MESSAGE = _REQUIRED_BIT | _MESSAGE_BIT;

  static const int _REPEATED_BOOL = _REPEATED_BIT | _BOOL_BIT;
  static const int _REPEATED_BYTES = _REPEATED_BIT | _BYTES_BIT;
  static const int _REPEATED_STRING = _REPEATED_BIT | _STRING_BIT;
  static const int _REPEATED_FLOAT = _REPEATED_BIT | _FLOAT_BIT;
  static const int _REPEATED_DOUBLE = _REPEATED_BIT | _DOUBLE_BIT;
  static const int _REPEATED_ENUM = _REPEATED_BIT | _ENUM_BIT;
  static const int _REPEATED_GROUP = _REPEATED_BIT | _GROUP_BIT;
  static const int _REPEATED_INT32 = _REPEATED_BIT | _INT32_BIT;
  static const int _REPEATED_INT64 = _REPEATED_BIT | _INT64_BIT;
  static const int _REPEATED_SINT32 = _REPEATED_BIT | _SINT32_BIT;
  static const int _REPEATED_SINT64 = _REPEATED_BIT | _SINT64_BIT;
  static const int _REPEATED_UINT32 = _REPEATED_BIT | _UINT32_BIT;
  static const int _REPEATED_UINT64 = _REPEATED_BIT | _UINT64_BIT;
  static const int _REPEATED_FIXED32 = _REPEATED_BIT | _FIXED32_BIT;
  static const int _REPEATED_FIXED64 = _REPEATED_BIT | _FIXED64_BIT;
  static const int _REPEATED_SFIXED32 = _REPEATED_BIT | _SFIXED32_BIT;
  static const int _REPEATED_SFIXED64 = _REPEATED_BIT | _SFIXED64_BIT;
  static const int _REPEATED_MESSAGE = _REPEATED_BIT | _MESSAGE_BIT;

  static const int _PACKED_BOOL = _REPEATED_BIT | _PACKED_BIT | _BOOL_BIT;
  static const int _PACKED_FLOAT = _REPEATED_BIT | _PACKED_BIT | _FLOAT_BIT;
  static const int _PACKED_DOUBLE = _REPEATED_BIT | _PACKED_BIT | _DOUBLE_BIT;
  static const int _PACKED_ENUM = _REPEATED_BIT | _PACKED_BIT | _ENUM_BIT;
  static const int _PACKED_INT32 = _REPEATED_BIT | _PACKED_BIT | _INT32_BIT;
  static const int _PACKED_INT64 = _REPEATED_BIT | _PACKED_BIT | _INT64_BIT;
  static const int _PACKED_SINT32 = _REPEATED_BIT | _PACKED_BIT | _SINT32_BIT;
  static const int _PACKED_SINT64 = _REPEATED_BIT | _PACKED_BIT | _SINT64_BIT;
  static const int _PACKED_UINT32 = _REPEATED_BIT | _PACKED_BIT | _UINT32_BIT;
  static const int _PACKED_UINT64 = _REPEATED_BIT | _PACKED_BIT | _UINT64_BIT;
  static const int _PACKED_FIXED32 = _REPEATED_BIT | _PACKED_BIT | _FIXED32_BIT;
  static const int _PACKED_FIXED64 = _REPEATED_BIT | _PACKED_BIT | _FIXED64_BIT;
  static const int _PACKED_SFIXED32 = _REPEATED_BIT | _PACKED_BIT |
      _SFIXED32_BIT;
  static const int _PACKED_SFIXED64 = _REPEATED_BIT | _PACKED_BIT |
      _SFIXED64_BIT;

  // Short names for use in generated code

  // _O_ptional
  static const int OB = _OPTIONAL_BOOL;
  static const int OY = _OPTIONAL_BYTES;
  static const int OS = _OPTIONAL_STRING;
  static const int OF = _OPTIONAL_FLOAT;
  static const int OD = _OPTIONAL_DOUBLE;
  static const int OE = _OPTIONAL_ENUM;
  static const int OG = _OPTIONAL_GROUP;
  static const int O3 = _OPTIONAL_INT32;
  static const int O6 = _OPTIONAL_INT64;
  static const int OS3 = _OPTIONAL_SINT32;
  static const int OS6 = _OPTIONAL_SINT64;
  static const int OU3 = _OPTIONAL_UINT32;
  static const int OU6 = _OPTIONAL_UINT64;
  static const int OF3 = _OPTIONAL_FIXED32;
  static const int OF6 = _OPTIONAL_FIXED64;
  static const int OSF3 = _OPTIONAL_SFIXED32;
  static const int OSF6 = _OPTIONAL_SFIXED64;
  static const int OM = _OPTIONAL_MESSAGE;

  // re_Q_uired
  static const int QB = _REQUIRED_BOOL;
  static const int QY = _REQUIRED_BYTES;
  static const int QS = _REQUIRED_STRING;
  static const int QF = _REQUIRED_FLOAT;
  static const int QD = _REQUIRED_DOUBLE;
  static const int QE = _REQUIRED_ENUM;
  static const int QG = _REQUIRED_GROUP;
  static const int Q3 = _REQUIRED_INT32;
  static const int Q6 = _REQUIRED_INT64;
  static const int QS3 = _REQUIRED_SINT32;
  static const int QS6 = _REQUIRED_SINT64;
  static const int QU3 = _REQUIRED_UINT32;
  static const int QU6 = _REQUIRED_UINT64;
  static const int QF3 = _REQUIRED_FIXED32;
  static const int QF6 = _REQUIRED_FIXED64;
  static const int QSF3 = _REQUIRED_SFIXED32;
  static const int QSF6 = _REQUIRED_SFIXED64;
  static const int QM = _REQUIRED_MESSAGE;

  // re_P_eated
  static final int PB = _REPEATED_BOOL;
  static final int PY = _REPEATED_BYTES;
  static final int PS = _REPEATED_STRING;
  static final int PF = _REPEATED_FLOAT;
  static final int PD = _REPEATED_DOUBLE;
  static final int PE = _REPEATED_ENUM;
  static final int PG = _REPEATED_GROUP;
  static final int P3 = _REPEATED_INT32;
  static final int P6 = _REPEATED_INT64;
  static final int PS3 = _REPEATED_SINT32;
  static final int PS6 = _REPEATED_SINT64;
  static final int PU3 = _REPEATED_UINT32;
  static final int PU6 = _REPEATED_UINT64;
  static final int PF3 = _REPEATED_FIXED32;
  static final int PF6 = _REPEATED_FIXED64;
  static final int PSF3 = _REPEATED_SFIXED32;
  static final int PSF6 = _REPEATED_SFIXED64;
  static final int PM = _REPEATED_MESSAGE;

  // pac_K_ed
  static final int KB = _PACKED_BOOL;
  static final int KE = _PACKED_ENUM;
  static final int KF = _PACKED_FLOAT;
  static final int KD = _PACKED_DOUBLE;
  static final int K3 = _PACKED_INT32;
  static final int K6 = _PACKED_INT64;
  static final int KS3 = _PACKED_SINT32;
  static final int KS6 = _PACKED_SINT64;
  static final int KU3 = _PACKED_UINT32;
  static final int KU6 = _PACKED_UINT64;
  static final int KF3 = _PACKED_FIXED32;
  static final int KF6 = _PACKED_FIXED64;
  static final int KSF3 = _PACKED_SFIXED32;
  static final int KSF6 = _PACKED_SFIXED64;

  // Closures commonly used by initializers
  static MakeDefaultFunc __STRING_EMPTY; // () => ''
  static MakeDefaultFunc __BYTES_EMPTY; // () => <int>[]
  static MakeDefaultFunc __BOOL_FALSE; // () => false
  static MakeDefaultFunc __INT_ZERO; // () => 0
  static MakeDefaultFunc __DOUBLE_ZERO; // () => 0.0

  static MakeDefaultFunc get _STRING_EMPTY {
    if (__STRING_EMPTY == null) {
      __STRING_EMPTY = () => '';
    }
    return __STRING_EMPTY;
  }

  static MakeDefaultFunc get _BYTES_EMPTY {
    if (__BYTES_EMPTY == null) {
      __BYTES_EMPTY = () => <int>[];
    }
    return __BYTES_EMPTY;
  }

  static MakeDefaultFunc get _BOOL_FALSE {
    if (__BOOL_FALSE == null) {
      __BOOL_FALSE = () => false;
    }
    return __BOOL_FALSE;
  }

  static MakeDefaultFunc get _INT_ZERO {
    if (__INT_ZERO == null) {
      __INT_ZERO = () => 0;
    }
    return __INT_ZERO;
  }

  static MakeDefaultFunc get _DOUBLE_ZERO {
    if (__DOUBLE_ZERO == null) {
      __DOUBLE_ZERO = () => 0.0;
    }
    return __DOUBLE_ZERO;
  }

  static MakeDefaultFunc _defaultForType(int type) {
    switch (type) {
    case _OPTIONAL_BOOL: case _REQUIRED_BOOL:
      return _BOOL_FALSE;
    case _OPTIONAL_BYTES: case _REQUIRED_BYTES:
      return _BYTES_EMPTY;
    case _OPTIONAL_STRING: case _REQUIRED_STRING:
      return _STRING_EMPTY;
    case _OPTIONAL_FLOAT: case _REQUIRED_FLOAT:
    case _OPTIONAL_DOUBLE: case _REQUIRED_DOUBLE:
      return _DOUBLE_ZERO;
    case _OPTIONAL_INT32: case _REQUIRED_INT32:
    case _OPTIONAL_INT64: case _REQUIRED_INT64:
    case _OPTIONAL_SINT32: case _REQUIRED_SINT32:
    case _OPTIONAL_SINT64: case _REQUIRED_SINT64:
    case _OPTIONAL_UINT32: case _REQUIRED_UINT32:
    case _OPTIONAL_UINT64: case _REQUIRED_UINT64:
    case _OPTIONAL_FIXED32: case _REQUIRED_FIXED32:
    case _OPTIONAL_FIXED64: case _REQUIRED_FIXED64:
    case _OPTIONAL_SFIXED32: case _REQUIRED_SFIXED32:
    case _OPTIONAL_SFIXED64: case _REQUIRED_SFIXED64:
      return _INT_ZERO;
    default:
      return null;
    }
  }

  static Function _converterForType(int type) {
    if (((type & _REPEATED_BIT) != 0)  || ((type & _PACKED_BIT) != 0)) {
      return ((type & _BYTES_BIT) != 0) ?
          _toImmutableListNonGrowable : _toImmutableListIdentity;
    } else {
      return ((type & _BYTES_BIT) != 0) ? _toNonGrowableList : _identity;
    }
  }

  static Object _identity(Object source) => source;

  static List _toNonGrowableList(List source) {
    if (source is PbImmutableList) {
      return source;
    } else {
      return new PbImmutableList.from(source);
    }
  }

  static List _toImmutableListIdentity(PbList source) {
    return source.asImmutable();
  }

  static List _toImmutableListNonGrowable(PbList source) {
    return source.asImmutable(_toNonGrowableList);
  }

  Map<int, dynamic> _fieldValues;
  bool _isClean;
  UnknownFieldSet _unknownFields;
  Map<int, Extension> _extensions;

  Builder()
    : _unknownFields = UnknownFieldSet.defaultInstance,
      _fieldValues = new Map<int, dynamic>() {
    initialize_();
  }

  /**
   * Add an extension field value to a repeated field.  The backing
   * [List] will be created if necessary.
   */
  void addExtension(Extension extension, var value) {
    _checkExtension(extension);
    if ((extension.type & _REPEATED_BIT) == 0) {
      throw new PbException(
          "Cannot add to a non-repeated field (use 'setExtension()')");
    }
    // Validate type and range
    value = _validate(extension.tagNumber, extension.type & ~0x7, value);

    var list = _fieldValues[extension.tagNumber];
    if (list == null) {
      list = extension.makeDefault();
      _setExtension(extension, list);
    }

    list.add(value);
    onChanged();
  }

  Message build() {
    Message result = buildPartial();
    if (!isInitialized()) {
      List<String> invalidFields = <String>[];
      _findInvalidFields(invalidFields);
      throw new UninitializedMessageException(invalidFields);
    }
    return result;
  }

  Message buildParsed() {
    Message result = buildPartial();
    if (!isInitialized()) {
      List<String> invalidFields = <String>[];
      _findInvalidFields(invalidFields);
      throw new UninitializedMessageException(invalidFields);
    }
    return result;
  }

  Message buildPartial();

  // Shorthand for clearField
  void c_(int tagNumber) {
    clearField(tagNumber);
  }

  void clear() {
    _unknownFields = UnknownFieldSet.defaultInstance;
    _fieldValues = new Map<int, dynamic>();
    _isClean = true;
  }

  void clearExtension(Extension extension) {
    _checkExtension(extension);
    _fieldValues.remove(extension.tagNumber);
    Object value = extension.makeDefault();
    if (value is List) {
      _setExtension(extension, value);
    } else {
      _extensions.remove(extension.tagNumber);
    }
  }

  void clearField(int tagNumber) {
    _fieldValues.remove(tagNumber);
    // Restore the default value for the field
    // For repeated fields, the default is an empty list
    // For required/optional fields, the BuilderInfo contains the initializer
    int fieldType = _getFieldType(tagNumber);
    if ((fieldType & _REPEATED_BIT) != 0) {
      _fieldValues[tagNumber] = new PbList(this);
    } else {
      Object defaultValue = info_.defaultValue(tagNumber);
      if (defaultValue != null) {
        _fieldValues[tagNumber] = defaultValue;
      }
    }
  }

  bool extensionsAreInitialized() {
    if (_extensions == null) {
      return true;
    }
    return _extensions.keys.every((int tagNumber) {
      return info_._isFieldInitialized(_fieldValues, tagNumber,
          _extensions[tagNumber].type);
    });
  }

  // Allow the contents of each map or set to be changed, but not its reference
  Map<int, Object> get fieldValues {
    // Force initialization of field values to defaults
    if (info_ != null) {
      for (FieldInfo i in info_.fieldInfo.values) {
        if (i.makeDefault != null) fieldValues [i.tagNumber] = i.makeDefault();
      }
    }
    return _fieldValues;
  }

  /**
   * Shorthand for [:getField(tagNumber):].
   */
  g_(int tagNumber) => getField(tagNumber);

  /**
   * Returns the value of the given extension.  For repeated fields that have
   * not been set previously, [:null:] is returned.
   */
  getExtension(Extension extension) {
    _checkExtension(extension);
    return getField(extension.tagNumber);
  }

  /**
   * Returns the number of elements in the given extension.  For repeated fields
   * that have not been set previously, or for non-repeated fields, [:0:] is
   * returned.
   */
  int getExtensionCount(Extension extension) {
    _checkExtension(extension);
    List list = _fieldValues[extension.tagNumber];
    return (list == null || list is! List) ? 0 : list.length;
  }

  Object getField(int tagNumber) {
    Object value = _fieldValues[tagNumber];
    // Initialize the field
    if (value == null) {
      MakeDefaultFunc makeDefaultFunc = info_.makeDefault(tagNumber);
      if (makeDefaultFunc == null) {
        makeDefaultFunc = _extensions[tagNumber].makeDefault;
        if (makeDefaultFunc == null) {
          throw new PbException("Can't make default for field "
            "${info_.fieldName(tagNumber)} in message ${info_.messageName}");
        }
      }
      value = makeDefaultFunc();
      _fieldValues[tagNumber] = value;
    }
    return value;
  }

  // Shorthand for hasField
  bool h_(int tagNumber) => hasField(tagNumber);

  /**
   * Return [:true:] if a value of the given extension is present.
   */
  bool hasExtension(Extension extension) {
    _checkExtension(extension);
    return hasField(extension.tagNumber);
  }

  bool hasField(int tagNumber) {
    int fieldType = info_.fieldType(tagNumber);
    if (!_fieldValues.containsKey(tagNumber)) {
      return false;
    }
    var value = _fieldValues[tagNumber];
    if (value is List && value.isEmpty()) {
      return false;
    }
    return true;
  }

  // Overriden by subclasses
  BuilderInfo get info_;

  void initialize_();

  bool isInitialized() {
    if (!info_.hasRequiredFields) {
      return true;
    }
    return info_.isInitialized(_fieldValues) && extensionsAreInitialized();
  }

  Builder mergeFromBuffer(List<int> input,
      [ExtensionRegistry extensionRegistry]) {
    CodedBufferReader codedInput = new CodedBufferReader.fromBuffer(input);
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    mergeFromCodedBufferReader(codedInput, extensionRegistry);
    codedInput.checkLastTagWas(0);
    return this;
  }

  Builder mergeFromCodedBufferReader(CodedBufferReader input,
      [ExtensionRegistry extensionRegistry]) {
    UnknownFieldSet_Builder unknownFieldSetBuilder =
        new UnknownFieldSet_Builder(unknownFields);
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;

    void readPackableIoc(int wireType, int tagNumber, var iocReadFunc) {
      List list = getField(tagNumber);
      if (wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
        // Packed
        int length = input.readInt32();
        int limit = input._pushLimit(length);
        while (input.getBytesUntilLimit() > 0) {
          iocReadFunc((var v) => list.add(v));
        }
        input._popLimit(limit);
      } else {
        // Not-packed
        iocReadFunc((var v) => list.add(v));
      }
    }

    void readPackable(int wireType, int tagNumber, var readFunc) {
      readPackableIoc(wireType, tagNumber,
          (var assigner) => assigner(readFunc()));
    }

    bool wireTypeMatch(int tagNumber, int fieldType, int wireType) {
      int fieldDataType = fieldType &
          ~(_REQUIRED_BIT | _REPEATED_BIT | _PACKED_BIT);
      switch (fieldDataType) {
        case _BOOL_BIT:
        case _ENUM_BIT:
        case _INT32_BIT:
        case _INT64_BIT:
        case _SINT32_BIT:
        case _SINT64_BIT:
        case _UINT32_BIT:
        case _UINT64_BIT:
          return wireType == WireFormat.WIRETYPE_VARINT ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case _FLOAT_BIT:
        case _FIXED32_BIT:
        case _SFIXED32_BIT:
          return wireType == WireFormat.WIRETYPE_FIXED32 ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case _DOUBLE_BIT:
        case _FIXED64_BIT:
        case _SFIXED64_BIT:
          return wireType == WireFormat.WIRETYPE_FIXED64 ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case _BYTES_BIT:
        case _STRING_BIT:
        case _MESSAGE_BIT:
          return wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case _GROUP_BIT:
          return wireType == WireFormat.WIRETYPE_START_GROUP;
        default:
          return false;
      }
    }

    while (true) {
      int tag = input.readTag();
      if (tag == 0) {
        unknownFields = unknownFieldSetBuilder.build();
        onChanged();
        return this;
      }
      int wireType = tag & 0x7;
      int tagNumber = tag >> 3;
      int fieldType = -1;

      if (info_ != null) {
        if (info_.containsTagNumber(tagNumber)) {
          fieldType = info_.fieldType(tagNumber);
        } else {
          Extension extension = extensionRegistry
              .getExtension(info_.messageName, tagNumber);
          if (extension != null) {
            _addExtensionToMap(extension);
            fieldType = extension.type;
          }
        }
      }
      if (fieldType == -1 || !wireTypeMatch(tagNumber, fieldType, wireType)) {
        if (!parseUnknownFieldFromBuffer(input, unknownFieldSetBuilder, tag)) {
          unknownFields = unknownFieldSetBuilder.build();
          onChanged();
          return this;
        } else {
          continue;
        }
      }

      // ignore required/optional packed/unpacked
      fieldType &= ~(_PACKED_BIT | _REQUIRED_BIT);
      switch (fieldType) {
        case _OPTIONAL_BOOL:
          _fieldValues[tagNumber] = input.readBool();
          break;
        case _OPTIONAL_BYTES:
          _fieldValues[tagNumber] = input.readBytes();
          break;
        case _OPTIONAL_STRING:
          _fieldValues[tagNumber] = input.readString();
          break;
        case _OPTIONAL_FLOAT:
          _fieldValues[tagNumber] = input.readFloat();
          break;
        case _OPTIONAL_DOUBLE:
          _fieldValues[tagNumber] = input.readDouble();
          break;
        case _OPTIONAL_ENUM:
          int rawValue = input.readEnum();
          ProtobufEnum value = _getValueOfFunc(tagNumber, extensionRegistry)(rawValue);
          if (value == null) {
            unknownFieldSetBuilder.mergeVarintField(tagNumber, rawValue);
          } else {
            _fieldValues[tagNumber] = value;
          }
          break;
        case _OPTIONAL_GROUP:
          Builder subBuilder = _getSubBuilder(tagNumber, extensionRegistry);
          if (_fieldValues.containsKey(tagNumber)) {
            subBuilder.mergeFromMessage(getField(tagNumber));
          }
          input.readGroup(tagNumber, subBuilder, extensionRegistry);
          _fieldValues[tagNumber] = subBuilder.buildPartial();
          break;
        case _OPTIONAL_INT32:
          _fieldValues[tagNumber] = input.readInt32();
          break;
        case _OPTIONAL_INT64:
          _fieldValues[tagNumber] = input.readInt64();
          break;
        case _OPTIONAL_SINT32:
          _fieldValues[tagNumber] = input.readSint32();
          break;
        case _OPTIONAL_SINT64:
          _fieldValues[tagNumber] = input.readSint64();
          break;
        case _OPTIONAL_UINT32:
          _fieldValues[tagNumber] = input.readUint32();
          break;
        case _OPTIONAL_UINT64:
          _fieldValues[tagNumber] = input.readUint64();
          break;
        case _OPTIONAL_FIXED32:
          _fieldValues[tagNumber] = input.readFixed32();
          break;
        case _OPTIONAL_FIXED64:
          _fieldValues[tagNumber] = input.readFixed64();
          break;
        case _OPTIONAL_SFIXED32:
          _fieldValues[tagNumber] = input.readSfixed32();
          break;
        case _OPTIONAL_SFIXED64:
          _fieldValues[tagNumber] = input.readSfixed64();
          break;
        case _OPTIONAL_MESSAGE:
          Builder subBuilder = _getSubBuilder(tagNumber, extensionRegistry);
          if (_fieldValues.containsKey(tagNumber)) {
            subBuilder.mergeFromMessage(getField(tagNumber));
          }
          input.readMessage(subBuilder, extensionRegistry);
          _fieldValues[tagNumber] = subBuilder.buildPartial();
          break;
        case _REPEATED_BOOL:
          readPackable(wireType, tagNumber, input.readBool);
          break;
        case _REPEATED_BYTES:
          List list = getField(tagNumber);
          list.add(input.readBytes());
          break;
        case _REPEATED_STRING:
          List list = getField(tagNumber);
          list.add(input.readString());
          break;
        case _REPEATED_FLOAT:
          readPackable(wireType, tagNumber, input.readFloat);
          break;
        case _REPEATED_DOUBLE:
          readPackable(wireType, tagNumber, input.readDouble);
          break;
        case _REPEATED_ENUM:
          readPackableIoc(wireType, tagNumber, (var assigner){
            int rawValue = input.readEnum();
            ProtobufEnum value = _getValueOfFunc(tagNumber, extensionRegistry)(rawValue);
            if (value == null) {
              unknownFieldSetBuilder.mergeVarintField(tagNumber, rawValue);
            } else {
              assigner(value);
            }
          });
          break;
        case _REPEATED_GROUP:
          Builder subBuilder = _getSubBuilder(tagNumber, extensionRegistry);
          input.readGroup(tagNumber, subBuilder, extensionRegistry);
          List list = getField(tagNumber);
          list.add(subBuilder.buildPartial());
          break;
        case _REPEATED_INT32:
          readPackable(wireType, tagNumber, input.readInt32);
          break;
        case _REPEATED_INT64:
          readPackable(wireType, tagNumber, input.readInt64);
          break;
        case _REPEATED_SINT32:
          readPackable(wireType, tagNumber, input.readSint32);
          break;
        case _REPEATED_SINT64:
          readPackable(wireType, tagNumber, input.readSint64);
          break;
        case _REPEATED_UINT32:
          readPackable(wireType, tagNumber, input.readUint32);
          break;
        case _REPEATED_UINT64:
          readPackable(wireType, tagNumber, input.readUint64);
          break;
        case _REPEATED_FIXED32:
          readPackable(wireType, tagNumber, input.readFixed32);
          break;
        case _REPEATED_FIXED64:
          readPackable(wireType, tagNumber, input.readFixed64);
          break;
        case _REPEATED_SFIXED32:
          readPackable(wireType, tagNumber, input.readSfixed32);
          break;
        case _REPEATED_SFIXED64:
          readPackable(wireType, tagNumber, input.readSfixed64);
          break;
        case _REPEATED_MESSAGE:
          Builder subBuilder = _getSubBuilder(tagNumber, extensionRegistry);
          input.readMessage(subBuilder, extensionRegistry);
          List list = getField(tagNumber);
          list.add(subBuilder.buildPartial());
          break;
        default:
          throw "Unknown field type $fieldType";
      }
    }
  }

  /**
   * Merge field values from a JSON object, encoded as described by
   * [GeneratedMessage.writeToJson].
   */
  Builder mergeFromJson(String json, [ExtensionRegistry extensionRegistry]) {
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    Map<String, Object> parsed = JSON.parse(json);
    _mergeFromJson(parsed, extensionRegistry);
    return this;
  }

  Builder mergeFromMessage(GeneratedMessage other) {
    for (int tagNumber in other._fieldValues.keys) {
      var fieldValue = other._fieldValues[tagNumber];

      int fieldType = other._builderInfo.fieldType(tagNumber);
      if (fieldType != null) {
        if ((fieldType & _REPEATED_BIT) != 0) {
          List otherList = fieldValue;
          if (!otherList.isEmpty) {
            List thisList = getField(tagNumber);
            thisList.addAll(otherList);
            onChanged();
          }
        } else {
          setField(tagNumber, fieldValue);
        }
      } else {
        Extension extension = other._extensions[tagNumber];
        _addExtensionToMap(extension);
        fieldType = extension.type;
        if ((fieldType & _REPEATED_BIT) != 0) {
          List otherList = fieldValue;
          if (!otherList.isEmpty) {
            List thisList = extension.makeDefault();
            thisList.addAll(otherList);
            _fieldValues[tagNumber] = thisList;
            onChanged();
          }
        } else {
          setField(tagNumber, fieldValue, fieldType);
        }
      }
    }

    mergeUnknownFields(other.unknownFields);
    return this;
  }

  Future<Builder> mergeFromCodedStreamReader(CodedStreamReader input,
    [ExtensionRegistry extensionRegistry]) {
    UnknownFieldSet_Builder unknownFieldSetBuilder =
      new UnknownFieldSet_Builder(unknownFields);
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    Completer<Builder> c = new Completer<Builder>();

    Function merge;

    Function appendAndMerge(int tagNumber) {
      return (value) {
        List list = getField(tagNumber);
        list.add(value);
        return merge();
      };
    }

    Function assignAndMerge(int tagNumber) {
      return (value) {
        _fieldValues[tagNumber] = value;
        return merge();
      };
    }

    // readPackableIoc inverts control in that it takes in a read function
    // that itself takes a function parameter. This function actually sets the
    // value in the current message. This is important because the setter method
    // may need to be substituted in the case that an enum is unresolved.
    Future readPackableIoc(int wireType, int tagNumber, var iocReadFunc) {
      List list = getField(tagNumber);
      if (wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
        // Packed
        return input.readInt32().then((int length) {
          int limit = input._pushLimit(length);
          Future readUntilLimit() {
            if (input.getBytesUntilLimit() > 0) {
              return iocReadFunc((var v) => list.add(v))
                  .then(() => readUntilLimit());
            } else {
              input._popLimit(limit);
              return merge();
            }
          }
        });
      } else {
        // Not-packed
        return iocReadFunc((var v) => list.add(v)).then((_) => merge());
      }
    }

    Future readPackable(int wireType, int tagNumber, var readFunc) =>
      readPackableIoc(wireType, tagNumber, (var assigner) =>
        readFunc().then((v) => assigner(v))
      );

    bool wireTypeMatch(int tagNumber, int fieldType, int wireType) {
      int fieldDataType = fieldType &
          ~(Builder._REQUIRED_BIT | Builder._REPEATED_BIT |
              Builder._PACKED_BIT);
      switch (fieldDataType) {
        case Builder._BOOL_BIT:
        case Builder._ENUM_BIT:
        case Builder._INT32_BIT:
        case Builder._INT64_BIT:
        case Builder._SINT32_BIT:
        case Builder._SINT64_BIT:
        case Builder._UINT32_BIT:
        case Builder._UINT64_BIT:
          return wireType == WireFormat.WIRETYPE_VARINT ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case Builder._FLOAT_BIT:
        case Builder._FIXED32_BIT:
        case Builder._SFIXED32_BIT:
          return wireType == WireFormat.WIRETYPE_FIXED32 ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case Builder._DOUBLE_BIT:
        case Builder._FIXED64_BIT:
        case Builder._SFIXED64_BIT:
          return wireType == WireFormat.WIRETYPE_FIXED64 ||
              wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case Builder._BYTES_BIT:
        case Builder._STRING_BIT:
        case Builder._MESSAGE_BIT:
          return wireType == WireFormat.WIRETYPE_LENGTH_DELIMITED;
        case Builder._GROUP_BIT:
          return wireType == WireFormat.WIRETYPE_START_GROUP;
        default:
          return false;
      }
    }

    Future readField(int tagNumber, int wireType, int fieldType) {
      // ignore required/optional packed/unpacked
      fieldType &= ~(Builder._PACKED_BIT | Builder._REQUIRED_BIT);
      switch (fieldType) {
        case Builder._OPTIONAL_BOOL:
          return input.readBool().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_BYTES:
          return input.readBytes().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_STRING:
          return input.readString().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_FLOAT:
          return input.readFloat().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_DOUBLE:
          return input.readDouble().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_ENUM:
          return input.readEnum().then((int rawValue) {
            ProtobufEnum value = _getValueOfFunc(tagNumber, extensionRegistry)(rawValue);
            if (value == null) {
              unknownFieldSetBuilder.mergeVarintField(tagNumber, rawValue);
            } else {
              _fieldValues[tagNumber] = value;
            }
            return merge();
          });
        case Builder._OPTIONAL_GROUP:
          Builder subBuilder = info_.subBuilder(tagNumber)();
          if (_fieldValues.containsKey(tagNumber)) {
            subBuilder.mergeFromMessage(getField(tagNumber));
          }
          return input.readGroup(tagNumber, subBuilder, extensionRegistry)
              .then((_) {
                _fieldValues[tagNumber] = subBuilder.buildPartial();
                return merge();
              });
        case Builder._OPTIONAL_INT32:
          return input.readInt32().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_INT64:
          return input.readInt64().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_SINT32:
          return input.readSint32().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_SINT64:
          return input.readSint64().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_UINT32:
          return input.readUint32().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_UINT64:
          return input.readUint64().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_FIXED32:
          return input.readFixed32().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_FIXED64:
          return input.readFixed64().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_SFIXED32:
          return input.readSfixed32().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_SFIXED64:
          return input.readSfixed64().then(assignAndMerge(tagNumber));
        case Builder._OPTIONAL_MESSAGE:
          Builder subBuilder = info_.subBuilder(tagNumber)();
          if (_fieldValues.containsKey(tagNumber)) {
            subBuilder.mergeFromMessage(getField(tagNumber));
          }
          return input.readMessage(subBuilder, extensionRegistry).then((_) {
            _fieldValues[tagNumber] = subBuilder.buildPartial();
            return merge();
          });
        case Builder._REPEATED_BOOL:
          return readPackable(wireType, tagNumber, input.readBool);
        case Builder._REPEATED_BYTES:
          return input.readBytes().then(appendAndMerge(tagNumber));
        case Builder._REPEATED_STRING:
          return input.readString().then(appendAndMerge(tagNumber));
        case Builder._REPEATED_FLOAT:
          return readPackable(wireType, tagNumber, input.readFloat);
        case Builder._REPEATED_DOUBLE:
          return readPackable(wireType, tagNumber, input.readDouble);
        case Builder._REPEATED_ENUM:
          return readPackableIoc(wireType, tagNumber, (var assigner) =>
            input.readEnum().then((int rawValue) {
              ProtobufEnum value =
                  _getValueOfFunc(tagNumber, extensionRegistry)(rawValue);
              if (value == null) {
                unknownFieldSetBuilder.mergeVarintField(tagNumber, rawValue);
              } else {
                assigner(value);
              }
              return null;
            })
          );
        case Builder._REPEATED_GROUP:
          Builder subBuilder = info_.subBuilder(tagNumber)();
          return input.readGroup(tagNumber, subBuilder, extensionRegistry)
              .then((_) {
                List list = getField(tagNumber);
                list.add(subBuilder.buildPartial());
                return merge();
              });
        case Builder._REPEATED_INT32:
          return readPackable(wireType, tagNumber, input.readInt32);
        case Builder._REPEATED_INT64:
          return readPackable(wireType, tagNumber, input.readInt64);
        case Builder._REPEATED_SINT32:
          return readPackable(wireType, tagNumber, input.readSint32);
        case Builder._REPEATED_SINT64:
          return readPackable(wireType, tagNumber, input.readSint64);
        case Builder._REPEATED_UINT32:
          return readPackable(wireType, tagNumber, input.readUint32);
        case Builder._REPEATED_UINT64:
          return readPackable(wireType, tagNumber, input.readUint64);
        case Builder._REPEATED_FIXED32:
          return readPackable(wireType, tagNumber, input.readFixed32);
        case Builder._REPEATED_FIXED64:
          return readPackable(wireType, tagNumber, input.readFixed64);
        case Builder._REPEATED_SFIXED32:
          return readPackable(wireType, tagNumber, input.readSfixed32);
        case Builder._REPEATED_SFIXED64:
          return readPackable(wireType, tagNumber, input.readSfixed64);
        case Builder._REPEATED_MESSAGE:
          Builder subBuilder = info_.subBuilder(tagNumber)();
          return input.readMessage(subBuilder, extensionRegistry).then((_) {
            List list = getField(tagNumber);
            list.add(subBuilder.buildPartial());
            return merge();
          });
        default:
          throw "Unknown field type $fieldType";
      }
    };

    Future mergeImpl() {
      return input.readTag().then((int tag) {
        if (tag == 0) {
          unknownFields = unknownFieldSetBuilder.build();
          onChanged();
          return new Future.immediate(null);
        }
        int wireType = tag & 0x7;
        int tagNumber = tag >> 3;
        int fieldType = -1;

        if (info_.containsTagNumber(tagNumber)) {
          fieldType = info_.fieldType(tagNumber);
        } else {
          Extension extension =
              extensionRegistry.getExtension(info_.messageName, tagNumber);
          if (extension != null) {
            _addExtensionToMap(extension);
            fieldType = extension.type;
          }
        }
        if (fieldType == -1 || !wireTypeMatch(tagNumber, fieldType, wireType)) {
          return parseUnknownFieldFromStream(input, unknownFieldSetBuilder,
              extensionRegistry, tag).then((bool unknownTag) {
                if (!unknownTag) {
                  unknownFields = unknownFieldSetBuilder.build();
                  onChanged();
                  return new Future.immediate(null);
                } else {
                  return merge();
                }
            });
        }
        return readField(tagNumber, wireType, fieldType);
      });
    };
    merge = mergeImpl;
    return merge().then((_) => this);
  }

  Future<Builder> mergeFromStream(InputStream input,
      [ExtensionRegistry extensionRegistry]) {
    extensionRegistry = extensionRegistry == null ?
        ExtensionRegistry.EMPTY_REGISTRY : extensionRegistry;
    CodedStreamReader codedInput = new CodedStreamReader(input);
    return mergeFromCodedStreamReader(codedInput, extensionRegistry)
        .then((_) {
          codedInput.checkLastTagWas(0);
          return this;
        });
  }

  Builder mergeUnknownFields(UnknownFieldSet unknownFields) {
    _unknownFields =
        (new UnknownFieldSet_Builder(_unknownFields))
            .mergeFromUnknownFieldSet(unknownFields).build();
    onChanged();
    return this;
  }

  void onBuilt() {
//    if (builderParent !== null) {
//      markClean();
//    }
  }

  void onChanged() {
//    if (_isClean && builderParent !== null) {
//      builderParent.markDirty();
//
//      // Don't keep dispatching invalidations until build is called again.
//      _isClean = false;
//    }
  }

  bool parseUnknownFieldFromBuffer(CodedBufferReader input,
      UnknownFieldSet_Builder unknownFieldSetBuilder, int tag) {
    // If returns false, the tag is an "end group" which is expected
    // If returns true, the field is considered unknown.
    bool val = unknownFieldSetBuilder.mergeFieldFromBuffer(tag, input);
    return val;
  }

  Future<bool> parseUnknownFieldFromStream(CodedStreamReader input,
      UnknownFieldSet_Builder unknownFieldSetBuilder,
      ExtensionRegistry extensionRegistry, int tag) {
    // If returns false, the tag is an "end group" which is expected
    // If returns true, the field is considered unknown.
    return unknownFieldSetBuilder.mergeFieldFromStream(tag, input);
  }

  Message partial(GeneratedMessage result) {
    // Set empty repeating fields
    info_.fieldInfo.forEach(
      (int tagNumber, FieldInfo fieldInfo){
        int type = fieldInfo.type;
        if ((type & _REPEATED_BIT) != 0 && !hasField(tagNumber)) {
          result._fieldValues[tagNumber] = ImmutableList.EMPTY;
        }
      }
    );

    // Copy extensions
    if (_extensions != null) {
      for (int tagNumber in _extensions.keys) {
        if (result._extensions == null) {
          result._extensions = new Map<int, Extension>();
        }
        result._extensions[tagNumber] = _extensions[tagNumber];
      }
    }

    // Then copy fields that have been set
    for (int tagNumber in _fieldValues.keys) {
      if (hasField(tagNumber)) {
        int type = _getFieldType(tagNumber);
        result._fieldValues[tagNumber] =
            _converterForType(type)(_fieldValues[tagNumber]);
      }
    }

    onBuilt();
    return result;
  }

  // Shorthand for setField
  void s_(int tagNumber, Object value) {
    setField(tagNumber, value);
  }

  /**
   * Set the value of a non-repeated extension field.
   */
  void setExtension(Extension extension, var value) {
    _checkExtension(extension);
    _addExtensionToMap(extension);
    setField(extension.tagNumber, value, extension.type);
  }

  /**
   * Sets the value of a given field by its [tagNumber]. Can throw an
   * [:IllegalArgumentException:] if the value does not match the type
   * associated with [tagNumber].
   */
  void setField(int tagNumber, var value, [int fieldType = null]) {
    if (value == null) {
      throw new ArgumentError("null value");
    }
    if (fieldType == null) {
      if (!info_.containsTagNumber(tagNumber)) {
        throw new ArgumentError("Unknown tag: $tagNumber");
      }
      fieldType = info_.fieldType(tagNumber);
    }
    if ((fieldType & _REPEATED_BIT) != 0) {
      throw new ArgumentError(_generateMessage(tagNumber, value,
          "repeating field (use get + .add())"));
    }

    // Validate type and range
    value = _validate(tagNumber, fieldType & ~0x7, value);
    _fieldValues[tagNumber] = value;
    onChanged();
  }

  UnknownFieldSet get unknownFields => _unknownFields;

  void set unknownFields(UnknownFieldSet unknownFields) {
    _unknownFields = unknownFields;
    onChanged();
  }

  void _addExtensionToMap(Extension extension) {
    if (_extensions == null) {
      _extensions = new Map<int, Extension>();
    }
    _extensions[extension.tagNumber] = extension;
  }

  void _checkExtension(Extension extension) {
    if (extension.extendee != info_.messageName) {
      throw new ArgumentError(
          "Extension $extension not legal for message ${info_.messageName}");
    }
  }

  // dart2js's implementation of 'x is int' is not reliable
  bool _isInt(var value) {
    return (value is num) && (value == value.floor());
  }

  // Extract a value from its JSON representation
  _convertJsonValue(var value, int tagNumber, int fieldType,
      ExtensionRegistry extensionRegistry) {
    // Mask off 'required', 'repeated' and 'packed' bits to obtain base type
    fieldType &= ~(_REQUIRED_BIT | _REPEATED_BIT | _PACKED_BIT);

    String expectedType; // for exception message
    switch (fieldType) {
    case _BOOL_BIT:
      if (value is bool) {
        return value;
      } else if (value is String) {
        if (value == "true") {
          return true;
        } else if (value == "false") {
          return false;
        }
      }
      expectedType = 'bool, "true", or "false"';
      break;
    case _BYTES_BIT:
      if (value is String) {
        return Base64Codec.defaultInstance.decodeAsList(value);
      }
      expectedType = 'Base64 String';
      break;
    case _STRING_BIT:
      if (value is String) {
        return value;
      }
      expectedType = "String";
      break;
    case _FLOAT_BIT:
    case _DOUBLE_BIT:
      // Allow quoted values, although we don't emit them
      if (value is double) {
        return value;
      } else if (value is num) {
        return value.toDouble();
      } else if (value is String) {
        return double.parse(value);
      }
      expectedType = "num or stringified num";
      break;
    case _ENUM_BIT:
      // Allow quoted values, although we don't emit them
      if (value is String) {
        value = int.parse(value);
      }
      if (_isInt(value)) {
        return _getValueOfFunc(tagNumber, extensionRegistry)(value.toInt());
      }
      expectedType = "int or stringified int";
      break;
    case _INT32_BIT:
    case _SINT32_BIT:
    case _UINT32_BIT:
    case _FIXED32_BIT:
    case _SFIXED32_BIT:
      // Allow quoted values, although we don't emit them
      if (_isInt(value)) {
        return value.toInt();
      } else if (value is String) {
        return int.parse(value);
      }
      expectedType = "int or stringified int";
      break;
    case _INT64_BIT:
    case _SINT64_BIT:
    case _UINT64_BIT:
    case _FIXED64_BIT:
    case _SFIXED64_BIT:
      // Allow unquoted values, although we don't emit them
      // TODO - decode large numbers as Packed64 on JavaScript platforms
      if (value is String) {
        return int.parse(value);
      } else if (_isInt(value)) {
        return value.toInt();
      }
      expectedType = "int or stringified int";
      break;
    case _GROUP_BIT:
    case _MESSAGE_BIT:
      if (value is Map<String, Object>) {
        Builder subBuilder = _getSubBuilder(tagNumber, extensionRegistry);
        subBuilder._mergeFromJson(value, extensionRegistry);
        return subBuilder.build();
      }
      expectedType = "nested message or group";
      break;
    default:
      throw new PbException("Unknown type $fieldType");
    }
    throw new PbException("Expected type $expectedType, got $value");
  }

  void _findInvalidFields(List<String> invalidFields) {
    info_._findInvalidFields(_fieldValues, invalidFields);
    invalidFields.sort((a, b) => a.compareTo(b));
  }

  /**
   * Returns the type associated with a given tag number, either from the
   * [BuilderInfo] associated with this [Builder], or from a known extension.
   * If the type is unknown, [null] is returned.
   */
  int _getFieldType(int tagNumber) {
    int type = info_.fieldType(tagNumber);
    if (type == null && _extensions != null &&
        _extensions.containsKey(tagNumber)) {
      type = _extensions[tagNumber].type;
    }
    return type;
  }

  Builder _getSubBuilder(int tagNumber, ExtensionRegistry extensionRegistry) {
    CreateBuilderFunc subBuilderFunc = info_.subBuilder(tagNumber);
    if (subBuilderFunc == null && extensionRegistry != null) {
      subBuilderFunc = extensionRegistry.getExtension(info_.messageName,
          tagNumber).subBuilder;
    }
    if (subBuilderFunc == null) {
      throw new PbException("No subbuilder for tag $tagNumber");
    }
    return subBuilderFunc();
  }

  ValueOfFunc _getValueOfFunc(int tagNumber,
      ExtensionRegistry extensionRegistry) {
    ValueOfFunc valueOfFunc = info_.valueOfFunc(tagNumber);
    if (valueOfFunc == null && extensionRegistry != null) {
      valueOfFunc = extensionRegistry.getExtension(info_.messageName,
        tagNumber).valueOf;
    }
    if (valueOfFunc == null) {
      throw new PbException("No valueOf for tag $tagNumber");
    }
    return valueOfFunc;
  }

  // Merge fields from a previously decoded JSON object
  Builder _mergeFromJson(Map<String, Object> json,
      ExtensionRegistry extensionRegistry) {
    List<int> tags = new List<int>.from(
        json.keys.mappedBy((x) => int.parse(x)));
    tags.sort((a, b) => a.compareTo(b));

    for (int tagNumber in tags) {
      var fieldValue = json[tagNumber.toString()];
      int fieldType = -1;

      Extension extension = null;
      if (info_.containsTagNumber(tagNumber)) {
        fieldType = info_.fieldType(tagNumber);
      } else if (extensionRegistry != null) {
        extension = extensionRegistry.getExtension(info_.messageName,
            tagNumber);
        if (extension == null) {
          // Unknown extensions can be skipped.
          continue;
        }
        _addExtensionToMap(extension);
        fieldType = extension.type;
      }
      if (fieldType == -1) {
        throw new PbException("Unknown field type for tag number $tagNumber");
      }
      if ((fieldType & _REPEATED_BIT) != 0) {
        List thisList = getField(tagNumber);
        if (thisList == null) {
          thisList = extension.makeDefault();
        }
        for (var value in fieldValue) {
          value = _convertJsonValue(value, tagNumber, fieldType,
              extensionRegistry);
          thisList.add(value);
        }
        _fieldValues[tagNumber] = thisList;
        onChanged();
      } else {
        var value = _convertJsonValue(fieldValue, tagNumber, fieldType,
            extensionRegistry);
        setField(tagNumber, value, fieldType);
      }
    }
  }

  // does not perform validation
  void _setExtension(Extension extension, var value) {
    _addExtensionToMap(extension);
    _fieldValues[extension.tagNumber] = value;
  }

  String _generateMessage(int tagNumber, var value, String detail) {
    String fieldName;
    if (_extensions != null && _extensions[tagNumber] != null) {
      fieldName = _extensions[tagNumber].name;
    } else {
      fieldName = info_.fieldName(tagNumber);
    }
    String messageType = info_.messageName;
    return "Illegal to set field $fieldName ($tagNumber) of $messageType"
        " to value ($value): $detail";
  }

  // For int values, force coercion to int since there isn't a reliable
  // check for int-ness that works in both the VM and dart2js
  _validate(int tagNumber, int fieldType, var value) {
    switch (fieldType) {
      case _BOOL_BIT:
        if (value is !bool) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type bool"));
        }
        break;
      case _BYTES_BIT:
        if (value is !List<int>) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not List<int>"));
        }
        break;
      case _STRING_BIT:
        if (value is !String) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type String"));
        }
        break;
      case _FLOAT_BIT:
        if (value is !double) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type double"));
        }
        if (value < -_Constants.MAX_FLOAT || value > _Constants.MAX_FLOAT) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for float"));
        }
        break;
      case _DOUBLE_BIT:
        if (value is !double) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type double"));
        }
        break;
      case _ENUM_BIT:
        if (value is !ProtobufEnum) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type ProtobufEnum"));
        }
        break;
      case _INT32_BIT:
        if (!_isInt(value)) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type int"));
        }
        if (value < _Constants.MIN_SINT32 || value > _Constants.MAX_SINT32) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for int32"));
        }
        value = value.toInt();
        break;
      case _INT64_BIT:
        if (!_isInt(value) && value is !Packed64) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not int or Packed64"));
        }
        if (_isInt(value) &&
            (value < _Constants.MIN_SINT64 || value > _Constants.MAX_SINT64)) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for int64"));
        }
        if (value is !Packed64) {
          value = value.toInt();
        }
        break;
      case _SINT32_BIT:
        if (!_isInt(value)) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type int"));
        }
        if (value < _Constants.MIN_SINT32 || value > _Constants.MAX_SINT32) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for sint32"));
        }
        value = value.toInt();
        break;
      case _SINT64_BIT:
        if (!_isInt(value) && value is !Packed64) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not int or Packed64"));
        }
        if (_isInt(value) &&
            (value < _Constants.MIN_SINT64 || value > _Constants.MAX_SINT64)) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for sint64"));
        }
        if (value is !Packed64) {
          value = value.toInt();
        }
        break;
      case _UINT32_BIT:
        if (!_isInt(value)) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type int"));
        }
        if (value < 0 || value > _Constants.MAX_UINT32) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for uint32"));
        }
        value = value.toInt();
        break;
      case _UINT64_BIT:
        if (!_isInt(value) && value is !Packed64) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not int or Packed64"));
        }
        if ((_isInt(value)) && (value < 0 || value > _Constants.MAX_UINT64)) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for uint64"));
        }
        if (value is !Packed64) {
          value = value.toInt();
        }
        break;
      case _FIXED32_BIT:
        if (!_isInt(value)) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type int"));
        }
        if (value < 0 || value > _Constants.MAX_UINT32) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for fixed32"));
        }
        break;
      case _FIXED64_BIT:
        if (!_isInt(value) && value is !Packed64) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not int or Packed64"));
        }
        if ((_isInt(value)) && (value < 0 || value > _Constants.MAX_UINT64)) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for fixed64"));
        }
        if (value is !Packed64) {
          value = value.toInt();
        }
        break;
      case _SFIXED32_BIT:
        if (!_isInt(value)) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not type int"));
        }
        if (value < _Constants.MIN_SINT32 || value > _Constants.MAX_SINT32) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for sfixed32"));
        }
        break;
      case _SFIXED64_BIT:
        if (!_isInt(value) && value is !Packed64) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not int or Packed64"));
        }
        if ((_isInt(value)) && (value < _Constants.MIN_SINT64 ||
            value > _Constants.MAX_SINT64)) {
          throw new ArgumentError(_generateMessage(tagNumber, value,
              "out of range for sfixed64"));
        }
        if (value is !Packed64) {
          value = value.toInt();
        }
        break;
      case _GROUP_BIT:
      case _MESSAGE_BIT:
        if (value is !GeneratedMessage) {
          throw new ArgumentError(
              _generateMessage(tagNumber, value, "not a GeneratedMessage"));
        }
        break;
      default:
        throw new ArgumentError(
            _generateMessage(tagNumber, value, "field has unknown type "
            "$fieldType"));
    }
    return value;
  }
}
