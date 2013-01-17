// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class ExtensionGenerator implements ProtobufContainer {

  // Whitespace
  static final String sp = MessageGenerator.sp;

  // List of all ExtensionGenerators encountered during a compilation run
  static List<ExtensionGenerator> allExtensions;

  ExtensionGenerator(GoogleProtobuf_FieldDescriptorProto descriptor,
      ProtobufContainer parent, GenerationContext context)
      : this._descriptor = descriptor,
        this._parent = parent,
        this._context = context,
        fqname = parent.fqname == "." ?
            ".${descriptor.name}" :
            "${parent.fqname}.${descriptor.name}" {
    if (allExtensions == null) {
      allExtensions = new List<ExtensionGenerator>();
    }
    allExtensions.add(this);
  }

  String get classname {
    if (_classname == null) {
      String name = new ProtobufField(_descriptor, _context).externalFieldName;
      if (_parent is MessageGenerator) {
        MessageGenerator mg = _parent;
        _classname = "${mg._classname}.$name";
      } else {
        _classname = name;
      }
    }
    return _classname;
  }

  void generate(IndentingWriter out) {
    ProtobufField field = new ProtobufField(_descriptor, _context);
    String baseType = field.baseType;

    String name = field.externalFieldName;
    String type = field.shortTypeName;

    String typeName = "";
    ProtobufContainer typeNameContainer = _context[_descriptor.typeName];
    if (typeNameContainer != null) {
      typeName = typeNameContainer.classname;
    }

    String extendee = "";
    ProtobufContainer extendeeContainer = _context[_descriptor.extendee];
    if (extendeeContainer != null) {
      extendee = extendeeContainer.classname;
    }

    out.println("static Extension _$name${sp}=${sp}null;");
    out.println("static Extension get $name  ${sp}{");
    out.println("${sp}${sp}if${sp}(null${sp}==${sp}_$name${sp}) {");

    String initializer = "";
    String builder = "";
    String valueOf = "";

    if (_descriptor.type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_MESSAGE ||
        _descriptor.type == GoogleProtobuf_FieldDescriptorProto_Type.TYPE_GROUP) {
      if (_descriptor.label ==
          GoogleProtobuf_FieldDescriptorProto_Label.LABEL_REPEATED) {
        initializer = ",${sp}()${sp}=>${sp}new PbList<${typeName}>(null)";
        builder = ",${sp}()${sp}=>${sp}new ${typeName}_Builder()";
      } else {
        initializer = ",${sp}()${sp}=>${sp}${typeName}.defaultInstance";
        builder = ",${sp}()${sp}=>${sp}new ${typeName}_Builder()";
      }
    } else {
      if (_descriptor.label ==
          GoogleProtobuf_FieldDescriptorProto_Label.LABEL_REPEATED) {
        initializer = ",${sp}()${sp}=>${sp}new PbList<${baseType}>(null)";
      } else if (field.hasInitialization) {
        initializer = ",${sp}${field.initialization}";
      }
    }

    if (field.enum) {
      if (initializer.isEmpty()) {
        initializer = ",${sp}null";
      }
      if (builder.isEmpty()) {
        builder = ",${sp}null";
      }
      valueOf = ",${sp}(var v)${sp}=>${sp}${field.baseType}.valueOf(v)";
    }

    out.println("${sp}${sp}${sp}${sp}_$name${sp}="
      "${sp}new Extension(\"$extendee\",${sp}\"$name\",${sp}"
      "${_descriptor.number},${sp}Builder.$type"
      "${initializer}${builder}${valueOf}"
      ");");

    out.println("${sp}${sp}}");
    out.println("${sp}${sp}return _$name;");
    out.println("}");
  }

  String get name => classname;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => _parent.optimizeFor;

  final String fqname;
  String _classname;
  GoogleProtobuf_FieldDescriptorProto _descriptor;
  ProtobufContainer _parent;
  GenerationContext _context;
}
