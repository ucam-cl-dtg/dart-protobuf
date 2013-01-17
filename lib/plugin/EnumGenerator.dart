// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class EnumAlias {
  EnumAlias(GoogleProtobuf_EnumValueDescriptorProto this.value,
      GoogleProtobuf_EnumValueDescriptorProto this.canonicalValue);
  GoogleProtobuf_EnumValueDescriptorProto value;
  GoogleProtobuf_EnumValueDescriptorProto canonicalValue;
}

class EnumGenerator implements ProtobufContainer {

  // Whitespace
  static final String sp = MessageGenerator.sp;

  EnumGenerator(GoogleProtobuf_EnumDescriptorProto this._descriptor,
      ProtobufContainer this._parent, GenerationContext this._context)
    : _canonicalValues = [], _aliases = [] {
    _classname = _parent === null ?
        _descriptor.name :
        "${_parent.classname}_${_descriptor.name}";
    _fqname = _parent === null ?
        _descriptor.name :
        "${_parent.fqname}.${_descriptor.name}";
    _optimizeFor = _parent != null ? _parent.optimizeFor : null;

    for (GoogleProtobuf_EnumValueDescriptorProto value in _descriptor.value) {
      GoogleProtobuf_EnumValueDescriptorProto canonicalValue =
          findValueByNumber(value.number);
      if (value === canonicalValue) {
        _canonicalValues.add(value);
      } else {
        _aliases.add(new EnumAlias(value, canonicalValue));
      }
    }
    _context.register(this);
  }

  GoogleProtobuf_EnumValueDescriptorProto findValueByNumber(int number) {
    for (GoogleProtobuf_EnumValueDescriptorProto value in _descriptor.value) {
      if (value.number == number) return value;
    }
    return null;
  }

  /*
   * Not clear on the Reflection-labeled section.
   */
  void generate(IndentingWriter out) {
    out.addBlock("class ${_classname} extends ProtobufEnum "
        "implements Hashable {", "}\n", () {
      // -----------------------------------------------------------------
      // define enum types
      int index = 0;
      for (GoogleProtobuf_EnumValueDescriptorProto val in _canonicalValues) {
        out.println("static ${_classname} get ${val.name}  ${sp}=>"
            "${sp}values[${index++}];");
      }
      out.println("static List<${_classname}> _byIndex;");
      out.println("static Map<int, ${_classname}> _byValue;");
      out.blankLine();
      out.println("static void _init()${sp}{");
      out.println("${sp}${sp}_byIndex${sp}=${sp}const${sp}[");
      index = 0;
      for (GoogleProtobuf_EnumValueDescriptorProto val in _canonicalValues) {
        out.println("${sp}${sp}${sp}${sp}const ${_classname}._(${index++},"
            "${sp}${val.number},${sp}'${val.name}'),");
      }
      out.println("${sp}${sp}];");
      out.println("${sp}${sp}_byValue = "
          "ProtobufEnum.initByValue(_byIndex);");
      out.println("}");
      out.blankLine();
      out.println("static List<${_classname}> get values  ${sp}{");
      out.println("${sp}${sp}if (null${sp}==${sp}_byIndex)${sp}_init();");
      out.println("${sp}${sp}return${sp}_byIndex;");
      out.println("}");
      out.blankLine();
      out.println("static ${_classname} valueOf(int value)${sp}{");
      out.println("${sp}${sp}if (null${sp}==${sp}_byValue)${sp}_init();");
      out.println("${sp}${sp}return _byValue[value];");
      out.println("}");

      // -----------------------------------------------------------------
      // define aliases and _VALUE fields
      if (!_aliases.isEmpty) {
        out.blankLine();
      }
      for (EnumAlias alias in _aliases) {
        out.println("static final ${_classname} ${alias.value.name} ="
            " ${alias.canonicalValue.name};");
      }
      out.blankLine();

      // -----------------------------------------------------------------
      // define equals operator
      out.addBlock("bool operator ==(Object o) {", "}", () {
        out.println("if (o is ${_classname}) {");
        out.println("  ${_classname} p = o;");
        out.println("  return value == p.value;");
        out.println("} else {");
        out.println("  return false;");
        out.println("}");
      });
      out.blankLine();

      // -----------------------------------------------------------------
      // constructor
      out.println("const ${_classname}._(int i,${sp}int v,${sp}String n)${sp}"
          ":${sp}super(i,${sp}v,${sp}n);");
    });
  }

  String get classname => _classname;
  String get fqname => _fqname;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => _optimizeFor;

  GoogleProtobuf_EnumDescriptorProto _descriptor;
  ProtobufContainer _parent;
  GenerationContext _context;
  String _classname;
  String _fqname;
  List<GoogleProtobuf_EnumValueDescriptorProto> _canonicalValues;
  List<EnumAlias> _aliases;
  GoogleProtobuf_FileOptions_OptimizeMode _optimizeFor;
}
