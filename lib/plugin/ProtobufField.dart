// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

class ProtobufField {

  // Whitespace
  static final String sp = MessageGenerator.sp;

  static final RegExp HEX_LITERAL_REGEX =
      new RegExp(r"^0x[0-9a-f]+$",ignoreCase : true);
  static final RegExp INTEGER_LITERAL_REGEX = new RegExp(r"^[+-]?[0-9]+$");
  static final RegExp DECIMAL_LITERAL_REGEX_A =
      new RegExp(r"^[+-]?([0-9]*)\.[0-9]+(e[+-]?[0-9]+)?$", ignoreCase : true);
  static final RegExp DECIMAL_LITERAL_REGEX_B =
      new RegExp(r"^[+-]?[0-9]+e[+-]?[0-9]+$", ignoreCase : true);

  static int _maxIndex = 0;

  static void _resetIndices() {
    _maxIndex = 0;
  }

  static int _getIndex() {
    _maxIndex++;
    return _maxIndex;
  }

  GoogleProtobuf_FieldDescriptorProto _field;
  GenerationContext _context;

  int _index;
  int get index => _index;

  String _baseType;
  String get baseType => _baseType;

  String _typeString;
  String get typeString => _typeString;

  String _codedStreamType;
  String get codedStreamType => _codedStreamType;

  bool _repeats = false;
  bool get repeats => _repeats;
  bool get single => !repeats;

  bool get group => type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_GROUP;
  bool get message => type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_MESSAGE;
  bool get enum => type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_ENUM;
  bool get primitive => !group && !message;

  // Initializer to be applied in the initialize() function
  String _initialization = null;
  String get initialization => _initialization;
  bool get hasInitialization => _initialization != null;

  bool _required = false;
  bool get required => _required;
  bool get optional => !required; // includes repeated

  // True if the field is to be encoded with [packed=true] encoding
  bool _packed = false;
  bool get packed => _packed;

  // True if the fields's type can handle [packed=true] encoding
  bool _packable = false;
  bool get packable => _packable;

  // delegate methods
  String get name => _field.name;
  int get number => _field.number;
  GoogleProtobuf_FieldDescriptorProto_Label get label => _field.label;
  GoogleProtobuf_FieldDescriptorProto_Type get type => _field.type;
  GoogleProtobuf_FieldOptions get options => _field.options;
  String get typeName => _field.typeName;

  String _shortName(String name) {
    switch (name) {
      case "OPTIONAL_BOOL": return "OB";
      case "OPTIONAL_BYTES": return "OY";
      case "OPTIONAL_STRING": return "OS";
      case "OPTIONAL_FLOAT": return "OF";
      case "OPTIONAL_DOUBLE": return "OD";
      case "OPTIONAL_ENUM": return "OE";
      case "OPTIONAL_GROUP": return "OG";
      case "OPTIONAL_INT32": return "O3";
      case "OPTIONAL_INT64": return "O6";
      case "OPTIONAL_UINT32": return "OU3";
      case "OPTIONAL_UINT64": return "OU6";
      case "OPTIONAL_SINT32": return "OS3";
      case "OPTIONAL_SINT64": return "OS6";
      case "OPTIONAL_FIXED32": return "OF3";
      case "OPTIONAL_FIXED64": return "OF6";
      case "OPTIONAL_SFIXED32": return "OSF3";
      case "OPTIONAL_SFIXED64": return "OSF6";
      case "OPTIONAL_MESSAGE": return "OM";

      case "REQUIRED_BOOL": return "QB";
      case "REQUIRED_BYTES": return "QY";
      case "REQUIRED_STRING": return "QS";
      case "REQUIRED_FLOAT": return "QF";
      case "REQUIRED_DOUBLE": return "QD";
      case "REQUIRED_ENUM": return "QE";
      case "REQUIRED_GROUP": return "QG";
      case "REQUIRED_INT32": return "Q3";
      case "REQUIRED_INT64": return "Q6";
      case "REQUIRED_UINT32": return "QU3";
      case "REQUIRED_UINT64": return "QU6";
      case "REQUIRED_SINT32": return "QS3";
      case "REQUIRED_SINT64": return "QS6";
      case "REQUIRED_FIXED32": return "QF3";
      case "REQUIRED_FIXED64": return "QF6";
      case "REQUIRED_SFIXED32": return "QSF3";
      case "REQUIRED_SFIXED64": return "QSF6";
      case "REQUIRED_MESSAGE": return "QM";

      case "REPEATED_BOOL": return "PB";
      case "REPEATED_BYTES": return "PY";
      case "REPEATED_STRING": return "PS";
      case "REPEATED_FLOAT": return "PF";
      case "REPEATED_DOUBLE": return "PD";
      case "REPEATED_ENUM": return "PE";
      case "REPEATED_GROUP": return "PG";
      case "REPEATED_INT32": return "P3";
      case "REPEATED_INT64": return "P6";
      case "REPEATED_UINT32": return "PU3";
      case "REPEATED_UINT64": return "PU6";
      case "REPEATED_SINT32": return "PS3";
      case "REPEATED_SINT64": return "PS6";
      case "REPEATED_FIXED32": return "PF3";
      case "REPEATED_FIXED64": return "PF6";
      case "REPEATED_SFIXED32": return "PSF3";
      case "REPEATED_SFIXED64": return "PSF6";
      case "REPEATED_MESSAGE": return "PM";

      case "PACKED_INT32": return "K3";
      case "PACKED_INT64": return "K6";

      case "PACKED_BOOL": return "KB";
      case "PACKED_ENUM": return "KE";
      case "PACKED_FLOAT": return "KF";
      case "PACKED_DOUBLE": return "KD";
      case "PACKED_INT32": return "K3";
      case "PACKED_INT64": return "K6";
      case "PACKED_SINT32": return "KS3";
      case "PACKED_SINT64": return "KS6";
      case "PACKED_UINT32": return "KU3";
      case "PACKED_UINT64": return "KU6";
      case "PACKED_FIXED32": return "KF3";
      case "PACKED_FIXED64": return "KF6";
      case "PACKED_SFIXED32": return "KSF3";
      case "PACKED_SFIXED64": return "KSF6";
    }
    return name;
  }

  String get shortTypeName {
    String type;
    if (required) {
      type = "REQUIRED_";
    } else if (packed) {
      type = "PACKED_";
    } else if (repeats) {
      type = "REPEATED_";
    } else if (optional) {
      type = "OPTIONAL_";
    } else {
      throw "$this";
    }
    type = "${type}${codedStreamType.toUpperCase()}";
    return _shortName(type);
  }

  ProtobufField(GoogleProtobuf_FieldDescriptorProto this._field, this._context) {
    String _singleFieldType(String typeString) => typeString;
    String _repeatingFieldType(String typeString) => "List<$typeString>";

    _required =
        _field.label == GoogleProtobuf_FieldDescriptorProto_Label.LABEL_REQUIRED;
    _repeats =
        _field.label == GoogleProtobuf_FieldDescriptorProto_Label.LABEL_REPEATED;

    var write;
    if (repeats) {
      _packed = _field.options == null ? false : _field.options.packed;
      _index = -1;
      write = _repeatingFieldType;
    } else {
      _index = _getIndex();
      write = _singleFieldType;
    }

    switch (_field.type) {
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_BOOL:
        _baseType = "bool";
        _typeString = write("bool");
        _packable = true;
        _codedStreamType = "Bool";
        if (!repeats) {
          if (_field.hasDefaultValue() && "false" != _field.defaultValue) {
            _initialization = "()${sp}=>${sp}${_field.defaultValue}";
          }
        }
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FLOAT:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_DOUBLE:
        _baseType = "double";
        _typeString = write("double");
        _packable = true;
        _codedStreamType =
            (_field.type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FLOAT) ?
            "Float" : "Double";
        if (!repeats) {
          if (_field.hasDefaultValue() &&
              ("0.0" != _field.defaultValue || "0" != _field.defaultValue)) {
            if (_field.defaultValue == "inf") {
                _initialization = "()${sp}=>${sp}double.INFINITY";
            } else if (_field.defaultValue == "-inf") {
                _initialization = "()${sp}=>${sp}double.NEGATIVE_INFINITY";
            } else if (_field.defaultValue == "nan") {
                _initialization = "()${sp}=>${sp}double.NAN";
            } else if (HEX_LITERAL_REGEX.hasMatch(_field.defaultValue)){
                _initialization = "()${sp}=>${sp}(${_field.defaultValue})"
                    ".toDouble()";
            } else if (INTEGER_LITERAL_REGEX.hasMatch(_field.defaultValue)) {
                _initialization = "()${sp}=>${sp}${_field.defaultValue}.0";
            } else if (DECIMAL_LITERAL_REGEX_A.hasMatch(_field.defaultValue) || DECIMAL_LITERAL_REGEX_B.hasMatch(_field.defaultValue)) {
                _initialization = "()${sp}=>${sp}${_field.defaultValue}";
            } else {
                throw InvalidDefaultValue.invalidDoubleValue(_field.name,
                    _field.defaultValue);
            }
          }
        }
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED64:
        _baseType = "int";
        _typeString = write("int");
        _packable = true;
        switch (_field.type) {
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT32:
            _codedStreamType = "Int32";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT64:
            _codedStreamType = "Int64";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT32:
            _codedStreamType = "Uint32";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT64:
            _codedStreamType = "Uint64";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT32:
            _codedStreamType = "Sint32";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT64:
            _codedStreamType = "Sint64";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED32:
            _codedStreamType = "Fixed32";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED64:
            _codedStreamType = "Fixed64";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED32:
            _codedStreamType = "Sfixed32";
            break;
          case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED64:
            _codedStreamType = "Sfixed64";
            break;
        }
        if (!repeats) {
          if (_field.hasDefaultValue() && "0" != _field.defaultValue) {
            _initialization = "()${sp}=>${sp}${_field.defaultValue}";
          }
        }
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_STRING:
        _baseType = "String";
        _typeString = write("String");
        _codedStreamType = "String";
        if (!repeats) {
          if (_field.hasDefaultValue() && !_field.defaultValue.isEmpty) {
            _initialization = "()${sp}=>${sp}'${_field.defaultValue}'";
          }
        }
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_BYTES:
        _baseType = "List<int>";
        _typeString = write("List<int>");
        _codedStreamType = "Bytes";
        if (!repeats) {
          if (_field.hasDefaultValue() && !_field.defaultValue.isEmpty) {
            List<int> bytes = _field.defaultValue.charCodes;
            bool firstTime = true;

            StringBuffer sb = new StringBuffer();
            sb.add("<int>[");
            for (int b in bytes) {
              if (!firstTime) {
                sb.add(",");
              }
              firstTime = false;
              sb.add("0x${b.toRadixString(16)}");
            }
            sb.add("]");
            _initialization = "()${sp}=>${sp}$sb";
          }
        }
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_GROUP:
        ProtobufContainer groupType = _context[typeName];
        if (groupType != null) {
          _baseType = groupType.classname;
          _typeString = write(groupType.classname);
          _codedStreamType = "Group";
        } else {
          throw "FAILURE: Unknown group type reference ${_field.typeName}";
        }
        _initialization = "()${sp}=>${sp}${baseType}.defaultInstance";
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_MESSAGE:
        ProtobufContainer messageType = _context[typeName];
        if (messageType != null) {
          _baseType = messageType.classname;
          _typeString = write(messageType.classname);
          _codedStreamType = "Message";
        } else {
          throw "FAILURE: Unknown message type reference ${_field.typeName}";
        }
        _initialization = "()${sp}=>${sp}${baseType}.defaultInstance";
        break;
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_ENUM:
        EnumGenerator enumType = _context[typeName];
        if (enumType != null) {
          _baseType = enumType.classname;
          _typeString = write(enumType.classname);
          _codedStreamType = "Enum";
          _packable = true;
          if (!repeats) {
            if (_field.hasDefaultValue() && !_field.defaultValue.isEmpty) {
              _initialization =
                  "()${sp}=>${sp}${enumType.classname}.${_field.defaultValue}";
            } else if (enumType._canonicalValues.length > 0) {
              _initialization =
                  "()${sp}=>${sp}${enumType.classname}."
                  "${enumType._canonicalValues[0].name}";
            }
          }
        } else {
          throw "FAILURE: Unknown enum type reference ${_field.typeName}";
        }
        break;
      default:
        throw "Unknown type ${_field.type.name}";
      // no default -- should be an error
    }

    if (repeats) {
      _initialization = "()${sp}=>${sp}new PbList(this)";
    }
  }

  // camelCase field name
  String get externalFieldName {
    // For groups, use capitalization of 'typeName' rather than 'name'
    if (codedStreamType == "Group") {
      String name = _field.typeName;
      int index = name.lastIndexOf(".");
      if (index != -1) {
        name = name.substring(index + 1);
      }

      List<String> parts = name.split("_");
      parts = parts.map((String x) => "${x[0].toUpperCase()}${x.substring(1)}");
      name = Strings.join(parts, '');
      if (name.length > 0) {
        name = "${name[0].toLowerCase()}${name.substring(1)}";
      }
      return name;
    }
    return underscoresToCamelCase(_field.name);
  }

  // underscore-prefixed camelCase field name
  String get internalFieldName => "_${externalFieldName}";

  // TitleCase field name
  String get titlecaseFieldName {
    // For groups, use capitalization of 'typeName' rather than 'name'
    if (codedStreamType == "Group") {
      String name = externalFieldName;
      if (name.length > 0) {
        name = "${name[0].toUpperCase()}${name.substring(1)}";
      }
      return name;
    }
    return underscoresToCamelCase(_field.name, true);
  }

  int get wireType {
    switch (_field.type) {
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_INT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_UINT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SINT64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_BOOL:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_ENUM:
        return 0; // Varint
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_DOUBLE:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED64:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED64:
        return 1; // 64-bit
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_STRING:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_BYTES:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_MESSAGE:
        return 2; // Length-delimited
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_GROUP:
        return 3; // Start group
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FLOAT:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_FIXED32:
      case GoogleProtobuf_FieldDescriptorProto_Type.TYPE_SFIXED32:
        return 5; // 32-bit
    }
  }
}
