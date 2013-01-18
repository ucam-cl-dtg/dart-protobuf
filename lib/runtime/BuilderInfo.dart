// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/**
 * Per-message type setup.
 */
class BuilderInfo {
  Builder _builder;
  final String messageName;
  final Map<int, FieldInfo> fieldInfo;
  final Map<String, FieldInfo> byName;
  bool hasExtensions = false;
  bool hasRequiredFields = true;

  BuilderInfo(Builder this._builder, String this.messageName)
    : fieldInfo = new Map<int, FieldInfo>(),
      byName = new Map<String, FieldInfo>();

  void add(int tagNumber_, String name, int fieldType_,
      [MakeDefaultFunc makeDefault_ = null,
      CreateBuilderFunc subBuilder_ = null, ValueOfFunc valueOf = null]) {
    FieldInfo i = new FieldInfo(name, tagNumber_, fieldType_, makeDefault_,
        subBuilder_, valueOf);
    fieldInfo[tagNumber_] = i;
    byName[name] = i;
  }

  void a(int tagNumber_, String name, int fieldType_,
      [MakeDefaultFunc makeDefault_ = null,
      CreateBuilderFunc subBuilder_ = null,
      ValueOfFunc valueOf = null]) {
    add(tagNumber_, name, fieldType_, makeDefault_, subBuilder_, valueOf);
  }

  // Enum
  void e(int tagNumber_, String name, int fieldType_,
      MakeDefaultFunc makeDefault_, ValueOfFunc valueOf) {
    add(tagNumber_, name, fieldType_, makeDefault_, null, valueOf);
  }

  // Repeated message
  void m(int tagNumber_, String name, CreateBuilderFunc subBuilder_,
      [var newListFunc = null]) {
    add(tagNumber_, name, Builder._REPEATED_MESSAGE,
        newListFunc != null ? newListFunc : () =>
            new PbList<GeneratedMessage>(_builder), subBuilder_, null);
  }

  // Repeated non-message
  void p(int tagNumber_, String name, int fieldType_) {
    Function createFunc;
    switch (fieldType_ & ~0x7) {
    case Builder._BOOL_BIT:
      createFunc = () => new PbList<bool>(_builder);
      break;
    case Builder._BYTES_BIT:
      createFunc = () => new PbList<List<int>>(_builder);
      break;
    case Builder._STRING_BIT:
      createFunc = () => new PbList<String>(_builder);
      break;
    case Builder._FLOAT_BIT:
      createFunc = () => new PbFloatList(_builder);
      break;
    case Builder._DOUBLE_BIT:
      createFunc = () => new PbList<double>(_builder);
      break;
    case Builder._ENUM_BIT:
      createFunc = () => new PbList<ProtobufEnum>(_builder);
      break;
    case Builder._INT32_BIT:
    case Builder._SINT32_BIT:
    case Builder._SFIXED32_BIT:
      createFunc = () => new PbSint32List(_builder);
      break;
    case Builder._UINT32_BIT:
    case Builder._FIXED32_BIT:
      createFunc = () => new PbUint32List(_builder);
      break;
    case Builder._INT64_BIT:
    case Builder._SINT64_BIT:
    case Builder._SFIXED64_BIT:
      // Allow either int or Packed64 entries
      createFunc = () => new PbSint64List(_builder);
      break;
    case Builder._UINT64_BIT:
    case Builder._FIXED64_BIT:
      // Allow either int or Packed64 entries
      createFunc = () => new PbUint64List(_builder);
      break;
    case Builder._MESSAGE_BIT:
      throw new ArgumentError(
          "use BuilderInfo.m() for repeated messages");
    default:
      throw new ArgumentError("unknown type ${fieldType_}");
    }

    add(tagNumber_, name, fieldType_, createFunc, null, null);
  }

  bool containsTagNumber(int tagNumber_) => fieldInfo.containsKey(tagNumber_);

  Object defaultValue(int tagNumber_) {
    MakeDefaultFunc func = makeDefault(tagNumber_);
    return func == null ? null : func();
  }

  // Returns the field name for a given tag number, for debugging purposes.
  String fieldName(int tagNumber_) {
    FieldInfo i = fieldInfo[tagNumber_];
    return i != null ? i.name : null;
  }

  int fieldType(int tagNumber_) {
    FieldInfo i = fieldInfo[tagNumber_];
    return i != null ? i.type : null;
  }

  MakeDefaultFunc makeDefault(int tagNumber_) {
    FieldInfo i = fieldInfo[tagNumber_];
    return i != null ? i.makeDefault : null;
  }

  bool isInitialized(Map<int, Object> fieldValues) {
    return fieldInfo.keys.every((int tagNumber_) {
      return _isFieldInitialized(fieldValues, tagNumber_);
    });
  }

  CreateBuilderFunc subBuilder(int tagNumber_) {
    FieldInfo i = fieldInfo[tagNumber_];
    return i != null ? i.subBuilder : null;
  }

  int tagNumber(String fieldName_) {
    FieldInfo i = byName[fieldName_];
    return i != null ? i.tagNumber : null;
  }

  ValueOfFunc valueOfFunc(int tagNumber_) {
    FieldInfo i = fieldInfo[tagNumber_];
    return i != null ? i.valueOf : null;
  }

  bool _isFieldInitialized(Map<int, Object> fieldValues, int tagNumber_,
      [int fieldType_ = null]) {
    if (fieldType_ == null) {
      fieldType_ = fieldInfo[tagNumber_].type;
    }
    if ((fieldType_ &
        (Builder._MESSAGE_BIT | Builder._GROUP_BIT)) != 0) {
      if ((fieldType_ & Builder._REQUIRED_BIT) != 0) {
        Message message = fieldValues[tagNumber_];
        // required message/group must be present and initialized
        if (message == null || !message.isInitialized()) {
          return false;
        }
      } else if ((fieldType_ & Builder._REPEATED_BIT) != 0) {
        if (fieldValues.containsKey(tagNumber_)) {
          // repeated message/group must have all its members initialized
          List list = fieldValues[tagNumber_];
          // For message types that (recursively) contain no required fields,
          // short-circuit the loop
          if (!list.isEmpty && list[0].hasRequiredFields()) {
            for (Message message in list) {
              if (!message.isInitialized()) {
                return false;
              }
            }
          }
        }
      } else {
        Message message = fieldValues[tagNumber_];
        // optional message/group must be initialized if it is present
        if (message != null && !message.isInitialized()) {
          return false;
        }
      }

    } else if ((fieldType_ & Builder._REQUIRED_BIT) != 0) {
      // required 'primitive' must be present
      if (fieldValues[tagNumber_] == null) {
        return false;
      }
    }
    return true;
  }

  List<String> _findInvalidFields(Map<int, Object> fieldValues,
      List<String> invalidFields, [String prefix = ""]) {
    fieldInfo.forEach((int tagNumber_, FieldInfo field) {
      int fieldType_ = field.type;
      if ((fieldType_ &
          (Builder._MESSAGE_BIT | Builder._GROUP_BIT)) != 0) {
        if ((fieldType_ & Builder._REQUIRED_BIT) != 0) {
          Message message = fieldValues[tagNumber_];
          // required message/group must be present
          if (message == null) {
            invalidFields.add("${prefix}${field.name}");
          } else {
            message._findInvalidFields(invalidFields,
                "${prefix}${field.name}.");
          }
        } else if ((fieldType_ & Builder._REPEATED_BIT) != 0) {
          if (fieldValues.containsKey(tagNumber_)) {
            // repeated message/group must have all its members initialized
            List list = fieldValues[tagNumber_];
            // For messages that (recursively) contain no required fields,
            // short-circuit the loop
            if (!list.isEmpty && list[0].hasRequiredFields()) {
              int position = 0;
              for (Message message in list) {
                if (message.hasRequiredFields()) {
                  message._findInvalidFields(invalidFields,
                      "${prefix}${field.name}[${position}].");
                }
                position++;
              }
            }
          }
        } else {
          Message message = fieldValues[tagNumber_];
          // required message/group must be present
          if (message != null) {
            message._findInvalidFields(invalidFields, "${prefix}${field.name}.");
          }
        }

      } else if((fieldType_ & Builder._REQUIRED_BIT) != 0) {
        // required 'primitive' must be present
        if (fieldValues[tagNumber_] == null) {
          invalidFields.add("${prefix}${field.name}");
        }
      }
    });
    return invalidFields;
  }
}
