// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf_generator;

class MessageGenerator implements ProtobufContainer {

  // Variables controlling output prettiness
  static final String sp = " ";
  static final bool _blankLines = true;
  static final bool _fieldComments = true;

  String _builderClassname;
  String _classname;
  GenerationContext _context;
  final GoogleProtobuf_DescriptorProto _descriptor;
  List<EnumGenerator> _enumGenerators;
  List<ProtobufField> _fieldList;
  String _fqname;
  List<MessageGenerator> _messageGenerators;
  List<ExtensionGenerator> _extensionGenerators;
  GoogleProtobuf_FileOptions_OptimizeMode _optimizeFor;
  ProtobufContainer _parent;

  String get classname => _classname;
  String get fqname => _fqname;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => _optimizeFor;

  MessageGenerator(GoogleProtobuf_DescriptorProto this._descriptor,
      ProtobufContainer this._parent, GenerationContext this._context) {
    String name = _descriptor.name;
    _classname = (_parent == null || _parent.classname == "") ?
        name :
        "${_parent.classname}_${name}";

    _builderClassname = "${_classname}_Builder";
    _fqname = (_parent == null || _parent.fqname == null) ? _descriptor.name :
        ( _parent.fqname == "." ?
            ".${_descriptor.name}" :
            "${_parent.fqname}.${_descriptor.name}" );
    _optimizeFor = _parent != null ? _parent.optimizeFor : null;
    _context.register(this);

    _fieldList = [];

    _enumGenerators = new List<EnumGenerator>();
    for (GoogleProtobuf_EnumDescriptorProto e in _descriptor.enumType) {
      _enumGenerators.add(new EnumGenerator(e, this, _context));
    }

    _messageGenerators = new List<MessageGenerator>();
    for (GoogleProtobuf_DescriptorProto n in _descriptor.nestedType) {
      _messageGenerators.add(new MessageGenerator(n, this, _context));
    }

    _extensionGenerators = new List<ExtensionGenerator>();
    for (GoogleProtobuf_FieldDescriptorProto x in _descriptor.extension) {
      _extensionGenerators.add(new ExtensionGenerator(x, this, _context));
    }
  }

  void initializeFields() {
    _fieldList = [];
    ProtobufField._resetIndices();
    for (GoogleProtobuf_FieldDescriptorProto field in _descriptor.field) {
      _fieldList.add(new ProtobufField(field, _context));
    }
    for (MessageGenerator m in _messageGenerators) {
      m.initializeFields();
    }
  }

  void generate(IndentingWriter out,
      [List<ExtensionGenerator> allExtensions = null]) {
    for (EnumGenerator e in _enumGenerators) {
      e.generate(out);
    }

    for (MessageGenerator m in _messageGenerators) {
      m.generate(out, allExtensions);
    }

    out.addBlock("class ${_classname} extends GeneratedMessage${sp}{", "}", (){
      for (ExtensionGenerator x in _extensionGenerators) {
        if (allExtensions != null) {
          allExtensions.add(x);
        }
        x.generate(out);
      }

      out.println("static ${_classname} _d;");
      out.println("static ${_builderClassname} newBuilder()${sp}=>"
          "${sp}new ${_builderClassname}();");
      out.println("static ${_classname} get defaultInstance  ${sp}=>"
          "${sp}null${sp}==${sp}_d${sp}?${sp}(_d${sp}=${sp}newBuilder()."
          "buildPartial())${sp}:${sp}_d;");
      out.println("static ${_classname} parseFromBuffer(List<int> i,"
          "${sp}[ExtensionRegistry r])"
          "${sp}=>${sp}GeneratedMessage.parseBuffer(newBuilder(),"
          "${sp}i,${sp}r);");
      out.println("static Future<${_classname}> parseFromStream("
          "InputStream i,${sp}[ExtensionRegistry r])${sp}=>${sp}"
          "GeneratedMessage.parseStream(newBuilder(),${sp}i,${sp}r);");
      out.println("static ${_classname} parseFromJson("
          "String i,"
        "${sp}[ExtensionRegistry r])"
        "${sp}=>${sp}GeneratedMessage.parseJson(newBuilder(),${sp}i,${sp}r);");
      out.println("${_classname}._fromBuilder(${_builderClassname} b)"
          "${sp}:${sp}super(b);");
      out.println("${_builderClassname} toBuilder()"
          "${sp}=>${sp}newBuilder().mergeFromMessage(this);");

      generateFields(out);
    });

    // -------------------------- BUILDER --------------------------
    out.blankLine();
    out.addBlock("class ${_builderClassname} extends Builder${sp}{",
        "}", ()
      {
      out.println("static BuilderInfo _i;");

      if (_blankLines) {
        out.blankLine();
      }
      out.addBlock("void initialize_()${sp}{","}",(){
        out.addBlock("if${sp}(null${sp}==${sp}_i)${sp}{", "}", () {
          out.println("_i${sp}=${sp}new BuilderInfo(this,${sp}"
            "\"${_classname}\");");

        for (ProtobufField field in _fieldList) {
          String type = field.shortTypeName;

          String makeDefault = null;
          if (field.hasInitialization) {
            makeDefault = "${field.initialization}";
          }
          String subBuilder = null;
          if (field.message || field.group) {
            subBuilder = "()${sp}=>${sp}new ${field.baseType}_Builder()";
          }
          String valueOf = null;
          if (field.enum) {
            valueOf = "(var v)${sp}=>${sp}${field.baseType}.valueOf(v)";
          }
          if ("PM" == type) {
            // Repeated message: default is an empty list
            out.println("_i.m(${field.number},${sp}'"
                "${field.externalFieldName}',${sp}$subBuilder,"
                "${sp}()${sp}=>${sp}new PbList<${field.baseType}>(this));");
          } else if (type[0] == "P" && type != "PG" && type != "PE") {
            // Repeated, not a message or enum: default is an empty list,
            // subBuilder is null, valueOf is null
            out.println("_i.p(${field.number},${sp}"
                "'${field.externalFieldName}',${sp}Builder.$type);");
          } else if (type == "OE" || type == "QE") {
            out.println("_i.e(${field.number},${sp}"
                "'${field.externalFieldName}',${sp}Builder.$type,"
                "${sp}$makeDefault,${sp}$valueOf);");
          } else {
            if (makeDefault == null && subBuilder == null && valueOf == null) {
              out.println("_i.a(${field.number},${sp}"
                  "'${field.externalFieldName}',${sp}Builder.$type);");
            } else if (subBuilder == null && valueOf == null) {
              out.println("_i.a(${field.number},${sp}"
                  "'${field.externalFieldName}',${sp}Builder.$type,"
                  "${sp}$makeDefault);");
            } else if (valueOf == null) {
              out.println("_i.a(${field.number},${sp}"
                  "'${field.externalFieldName}',${sp}Builder.$type,"
                  "${sp}$makeDefault,${sp}$subBuilder);");
            } else {
              out.println("_i.a(${field.number},${sp}"
                  "'${field.externalFieldName}',${sp}Builder.$type,"
                  "${sp}$makeDefault,${sp}$subBuilder,${sp}$valueOf);");
            }
          }
        }

        if (_descriptor.extensionRange.length > 0) {
          out.println("_i.hasExtensions${sp}=${sp}true;");
        }
        if (!_hasRequiredFields(this, new Set())) {
          out.println("_i.hasRequiredFields${sp}=${sp}false;");
        }
        });
      });

      if (_blankLines) {
        out.blankLine();
      }
      out.println("$_classname build()${sp}=>${sp}super.build();");
      out.println("$_classname buildPartial()${sp}=>${sp}"
          "partial(new ${_classname}._fromBuilder(this));");
      out.println("BuilderInfo get info_  ${sp}=>${sp}_i;");

      generateFieldsAccessorsMutators(out);
    });
    out.blankLine();
  }

  void generateFields(IndentingWriter out) {

//
// Disable 'noSuchMethod' dependency for now until dart2js code generation
// improves
//

//    if (optimizeFor == GoogleProtobuf_FileOptions_OptimizeMode.SPEED) {
      for (ProtobufField field in _fieldList) {
        if (_blankLines) {
          out.blankLine();
        }

        String label = field.label.name.substring(6).toLowerCase();
        String type = field.type.name.substring(5).toLowerCase();
        if ("message" == type || "group" == type) {
          type = field.typeName.substring(1);
        }
        String options = "";
        if ((field.options != null) && field.options.packed) {
          if (options.length == 0) {
            options = " [";
          }
          options = "${options}packed=true";
        }
        if (options.length > 0) {
          options = "${options}]";
        }
        if (_fieldComments) {
          out.println("// $label $type ${field.name}${sp}=${sp}"
              "${field.number}${options};");
        }
        out.println(
            "${field.typeString} get ${field.externalFieldName}  ${sp}=>"
            "${sp}g_(${field.number});");
        if (field.single) {
          out.println("bool has${field.titlecaseFieldName}()${sp}=>"
              "${sp}h_(${field.number});");
        }
//      }
    }
  }

  // Returns true if the message type has any required fields.  If it doesn't,
  // we can optimize out calls to its isInitialized()/_findInvalidFields()
  // methods.
  //
  // already_seen is used to avoid checking the same type multiple times
  // (and also to protect against unbounded recursion).
  bool _hasRequiredFields(MessageGenerator type, Set alreadySeen) {
    if (alreadySeen.contains(type._fqname)) {
      // The type is already in cache.  This means that either:
      // a. The type has no required fields.
      // b. We are in the midst of checking if the type has required fields,
      //    somewhere up the stack.  In this case, we know that if the type
      //    has any required fields, they'll be found when we return to it,
      //    and the whole call to HasRequiredFields() will return true.
      //    Therefore, we don't have to check if this type has required fields
      //    here.
      return false;
    }
    alreadySeen.add(type._fqname);
    // If the type has extensions, an extension with message type could contain
    // required fields, so we have to be conservative and assume such an
    // extension exists.
    if (type._descriptor.extensionRange.length > 0) {
      return true;
    }

    for (ProtobufField field in type._fieldList) {
      if (field.required) {
        return true;
      }
      if (field.message) {
        ProtobufContainer messageType = _context[field.typeName];
        if (messageType != null && messageType is MessageGenerator) {
          if (_hasRequiredFields(messageType, alreadySeen)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  void generateFieldsAccessorsMutators(IndentingWriter out) {
    for (ProtobufField field in _fieldList) {
//
// Disable code size optimization for now until dart2js code generation
// is better able to handle 'noSuchMethod'
//

//      if (optimizeFor == GoogleProtobuf_FileOptions_OptimizeMode.SPEED) {
        if (_blankLines) {
          out.blankLine();
        }
        out.println("${field.typeString} get ${field.externalFieldName}  "
            "${sp}=>${sp}g_(${field.number});");
        if (field.single) {
          out.println("void set ${field.externalFieldName}"
              "(${field.typeString} v)${sp}"
              "{${sp}s_(${field.number},${sp}v);${sp}}");
          out.println("bool has${field.titlecaseFieldName}()${sp}=>"
              "${sp}h_(${field.number});");
          out.println("void clear${field.titlecaseFieldName}()${sp}=>"
              "${sp}c_(${field.number});");
        }
//      }
    }
  }
}
