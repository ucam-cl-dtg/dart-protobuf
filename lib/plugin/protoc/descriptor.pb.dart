///
//  Generated code. Do not modify.
///

part of protobuf_generator;

class GoogleProtobuf_FileDescriptorSet extends GeneratedMessage {
  static GoogleProtobuf_FileDescriptorSet _d;
  static GoogleProtobuf_FileDescriptorSet_Builder newBuilder() => new GoogleProtobuf_FileDescriptorSet_Builder();
  static GoogleProtobuf_FileDescriptorSet get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_FileDescriptorSet parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_FileDescriptorSet> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_FileDescriptorSet parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_FileDescriptorSet._fromBuilder(GoogleProtobuf_FileDescriptorSet_Builder b) : super(b);
  GoogleProtobuf_FileDescriptorSet_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.FileDescriptorProto file = 1;
  List<GoogleProtobuf_FileDescriptorProto> get file => g_(1);
}

class GoogleProtobuf_FileDescriptorSet_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_FileDescriptorSet");
      _i.m(1, 'file', () => new GoogleProtobuf_FileDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_FileDescriptorProto>(this));
    }
  }

  GoogleProtobuf_FileDescriptorSet build() => super.build();
  GoogleProtobuf_FileDescriptorSet buildPartial() => partial(new GoogleProtobuf_FileDescriptorSet._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_FileDescriptorProto> get file => g_(1);
}

class GoogleProtobuf_FileDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_FileDescriptorProto _d;
  static GoogleProtobuf_FileDescriptorProto_Builder newBuilder() => new GoogleProtobuf_FileDescriptorProto_Builder();
  static GoogleProtobuf_FileDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_FileDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_FileDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_FileDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_FileDescriptorProto._fromBuilder(GoogleProtobuf_FileDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_FileDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // optional string package = 2;
  String get package => g_(2);
  bool hasPackage() => h_(2);

  // repeated string dependency = 3;
  List<String> get dependency => g_(3);

  // repeated google.protobuf.DescriptorProto message_type = 4;
  List<GoogleProtobuf_DescriptorProto> get messageType => g_(4);

  // repeated google.protobuf.EnumDescriptorProto enum_type = 5;
  List<GoogleProtobuf_EnumDescriptorProto> get enumType => g_(5);

  // repeated google.protobuf.ServiceDescriptorProto service = 6;
  List<GoogleProtobuf_ServiceDescriptorProto> get service => g_(6);

  // repeated google.protobuf.FieldDescriptorProto extension = 7;
  List<GoogleProtobuf_FieldDescriptorProto> get extension => g_(7);

  // optional google.protobuf.FileOptions options = 8;
  GoogleProtobuf_FileOptions get options => g_(8);
  bool hasOptions() => h_(8);

  // optional google.protobuf.SourceCodeInfo source_code_info = 9;
  GoogleProtobuf_SourceCodeInfo get sourceCodeInfo => g_(9);
  bool hasSourceCodeInfo() => h_(9);
}

class GoogleProtobuf_FileDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_FileDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.a(2, 'package', Builder.OS);
      _i.p(3, 'dependency', Builder.PS);
      _i.m(4, 'messageType', () => new GoogleProtobuf_DescriptorProto_Builder(), () => new PbList<GoogleProtobuf_DescriptorProto>(this));
      _i.m(5, 'enumType', () => new GoogleProtobuf_EnumDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_EnumDescriptorProto>(this));
      _i.m(6, 'service', () => new GoogleProtobuf_ServiceDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_ServiceDescriptorProto>(this));
      _i.m(7, 'extension', () => new GoogleProtobuf_FieldDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_FieldDescriptorProto>(this));
      _i.a(8, 'options', Builder.OM, () => GoogleProtobuf_FileOptions.defaultInstance, () => new GoogleProtobuf_FileOptions_Builder());
      _i.a(9, 'sourceCodeInfo', Builder.OM, () => GoogleProtobuf_SourceCodeInfo.defaultInstance, () => new GoogleProtobuf_SourceCodeInfo_Builder());
    }
  }

  GoogleProtobuf_FileDescriptorProto build() => super.build();
  GoogleProtobuf_FileDescriptorProto buildPartial() => partial(new GoogleProtobuf_FileDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  String get package => g_(2);
  void set package(String v) { s_(2, v); }
  bool hasPackage() => h_(2);
  void clearPackage() => c_(2);

  List<String> get dependency => g_(3);

  List<GoogleProtobuf_DescriptorProto> get messageType => g_(4);

  List<GoogleProtobuf_EnumDescriptorProto> get enumType => g_(5);

  List<GoogleProtobuf_ServiceDescriptorProto> get service => g_(6);

  List<GoogleProtobuf_FieldDescriptorProto> get extension => g_(7);

  GoogleProtobuf_FileOptions get options => g_(8);
  void set options(GoogleProtobuf_FileOptions v) { s_(8, v); }
  bool hasOptions() => h_(8);
  void clearOptions() => c_(8);

  GoogleProtobuf_SourceCodeInfo get sourceCodeInfo => g_(9);
  void set sourceCodeInfo(GoogleProtobuf_SourceCodeInfo v) { s_(9, v); }
  bool hasSourceCodeInfo() => h_(9);
  void clearSourceCodeInfo() => c_(9);
}

class GoogleProtobuf_DescriptorProto_ExtensionRange extends GeneratedMessage {
  static GoogleProtobuf_DescriptorProto_ExtensionRange _d;
  static GoogleProtobuf_DescriptorProto_ExtensionRange_Builder newBuilder() => new GoogleProtobuf_DescriptorProto_ExtensionRange_Builder();
  static GoogleProtobuf_DescriptorProto_ExtensionRange get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_DescriptorProto_ExtensionRange parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_DescriptorProto_ExtensionRange> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_DescriptorProto_ExtensionRange parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_DescriptorProto_ExtensionRange._fromBuilder(GoogleProtobuf_DescriptorProto_ExtensionRange_Builder b) : super(b);
  GoogleProtobuf_DescriptorProto_ExtensionRange_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional int32 start = 1;
  int get start => g_(1);
  bool hasStart() => h_(1);

  // optional int32 end = 2;
  int get end => g_(2);
  bool hasEnd() => h_(2);
}

class GoogleProtobuf_DescriptorProto_ExtensionRange_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_DescriptorProto_ExtensionRange");
      _i.a(1, 'start', Builder.O3);
      _i.a(2, 'end', Builder.O3);
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobuf_DescriptorProto_ExtensionRange build() => super.build();
  GoogleProtobuf_DescriptorProto_ExtensionRange buildPartial() => partial(new GoogleProtobuf_DescriptorProto_ExtensionRange._fromBuilder(this));
  BuilderInfo get info_ => _i;

  int get start => g_(1);
  void set start(int v) { s_(1, v); }
  bool hasStart() => h_(1);
  void clearStart() => c_(1);

  int get end => g_(2);
  void set end(int v) { s_(2, v); }
  bool hasEnd() => h_(2);
  void clearEnd() => c_(2);
}

class GoogleProtobuf_DescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_DescriptorProto _d;
  static GoogleProtobuf_DescriptorProto_Builder newBuilder() => new GoogleProtobuf_DescriptorProto_Builder();
  static GoogleProtobuf_DescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_DescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_DescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_DescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_DescriptorProto._fromBuilder(GoogleProtobuf_DescriptorProto_Builder b) : super(b);
  GoogleProtobuf_DescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // repeated google.protobuf.FieldDescriptorProto field = 2;
  List<GoogleProtobuf_FieldDescriptorProto> get field => g_(2);

  // repeated google.protobuf.FieldDescriptorProto extension = 6;
  List<GoogleProtobuf_FieldDescriptorProto> get extension => g_(6);

  // repeated google.protobuf.DescriptorProto nested_type = 3;
  List<GoogleProtobuf_DescriptorProto> get nestedType => g_(3);

  // repeated google.protobuf.EnumDescriptorProto enum_type = 4;
  List<GoogleProtobuf_EnumDescriptorProto> get enumType => g_(4);

  // repeated google.protobuf.DescriptorProto.ExtensionRange extension_range = 5;
  List<GoogleProtobuf_DescriptorProto_ExtensionRange> get extensionRange => g_(5);

  // optional google.protobuf.MessageOptions options = 7;
  GoogleProtobuf_MessageOptions get options => g_(7);
  bool hasOptions() => h_(7);
}

class GoogleProtobuf_DescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_DescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.m(2, 'field', () => new GoogleProtobuf_FieldDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_FieldDescriptorProto>(this));
      _i.m(6, 'extension', () => new GoogleProtobuf_FieldDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_FieldDescriptorProto>(this));
      _i.m(3, 'nestedType', () => new GoogleProtobuf_DescriptorProto_Builder(), () => new PbList<GoogleProtobuf_DescriptorProto>(this));
      _i.m(4, 'enumType', () => new GoogleProtobuf_EnumDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_EnumDescriptorProto>(this));
      _i.m(5, 'extensionRange', () => new GoogleProtobuf_DescriptorProto_ExtensionRange_Builder(), () => new PbList<GoogleProtobuf_DescriptorProto_ExtensionRange>(this));
      _i.a(7, 'options', Builder.OM, () => GoogleProtobuf_MessageOptions.defaultInstance, () => new GoogleProtobuf_MessageOptions_Builder());
    }
  }

  GoogleProtobuf_DescriptorProto build() => super.build();
  GoogleProtobuf_DescriptorProto buildPartial() => partial(new GoogleProtobuf_DescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  List<GoogleProtobuf_FieldDescriptorProto> get field => g_(2);

  List<GoogleProtobuf_FieldDescriptorProto> get extension=> g_(6);

  List<GoogleProtobuf_DescriptorProto> get nestedType => g_(3);

  List<GoogleProtobuf_EnumDescriptorProto> get enumType => g_(4);

  List<GoogleProtobuf_DescriptorProto_ExtensionRange> get extensionRange => g_(5);

  GoogleProtobuf_MessageOptions get options => g_(7);
  void set options(GoogleProtobuf_MessageOptions v) { s_(7, v); }
  bool hasOptions() => h_(7);
  void clearOptions() => c_(7);
}

class GoogleProtobuf_FieldDescriptorProto_Type extends ProtobufEnum {
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_DOUBLE = const GoogleProtobuf_FieldDescriptorProto_Type._(0, 1, 'TYPE_DOUBLE');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_FLOAT = const GoogleProtobuf_FieldDescriptorProto_Type._(1, 2, 'TYPE_FLOAT');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_INT64 = const GoogleProtobuf_FieldDescriptorProto_Type._(2, 3, 'TYPE_INT64');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_UINT64 = const GoogleProtobuf_FieldDescriptorProto_Type._(3, 4, 'TYPE_UINT64');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_INT32 = const GoogleProtobuf_FieldDescriptorProto_Type._(4, 5, 'TYPE_INT32');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_FIXED64 = const GoogleProtobuf_FieldDescriptorProto_Type._(5, 6, 'TYPE_FIXED64');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_FIXED32 = const GoogleProtobuf_FieldDescriptorProto_Type._(6, 7, 'TYPE_FIXED32');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_BOOL = const GoogleProtobuf_FieldDescriptorProto_Type._(7, 8, 'TYPE_BOOL');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_STRING = const GoogleProtobuf_FieldDescriptorProto_Type._(8, 9, 'TYPE_STRING');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_GROUP = const GoogleProtobuf_FieldDescriptorProto_Type._(9, 10, 'TYPE_GROUP');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_MESSAGE = const GoogleProtobuf_FieldDescriptorProto_Type._(10, 11, 'TYPE_MESSAGE');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_BYTES = const GoogleProtobuf_FieldDescriptorProto_Type._(11, 12, 'TYPE_BYTES');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_UINT32 = const GoogleProtobuf_FieldDescriptorProto_Type._(12, 13, 'TYPE_UINT32');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_ENUM = const GoogleProtobuf_FieldDescriptorProto_Type._(13, 14, 'TYPE_ENUM');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_SFIXED32 = const GoogleProtobuf_FieldDescriptorProto_Type._(14, 15, 'TYPE_SFIXED32');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_SFIXED64 = const GoogleProtobuf_FieldDescriptorProto_Type._(15, 16, 'TYPE_SFIXED64');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_SINT32 = const GoogleProtobuf_FieldDescriptorProto_Type._(16, 17, 'TYPE_SINT32');
  static const GoogleProtobuf_FieldDescriptorProto_Type TYPE_SINT64 = const GoogleProtobuf_FieldDescriptorProto_Type._(17, 18, 'TYPE_SINT64');
  static List<GoogleProtobuf_FieldDescriptorProto_Type> _byIndex;
  static Map<int, GoogleProtobuf_FieldDescriptorProto_Type> _byValue;

  static void _init() {
    _byIndex = const [
      TYPE_DOUBLE,
      TYPE_FLOAT,
      TYPE_INT64,
      TYPE_UINT64,
      TYPE_INT32,
      TYPE_FIXED64,
      TYPE_FIXED32,
      TYPE_BOOL,
      TYPE_STRING,
      TYPE_GROUP,
      TYPE_MESSAGE,
      TYPE_BYTES,
      TYPE_UINT32,
      TYPE_ENUM,
      TYPE_SFIXED32,
      TYPE_SFIXED64,
      TYPE_SINT32,
      TYPE_SINT64,
    ];
    _byValue = ProtobufEnum.initByValue(_byIndex);
  }

  static List<GoogleProtobuf_FieldDescriptorProto_Type> get values {
    if (null == _byIndex) _init();
    return _byIndex;
  }

  static GoogleProtobuf_FieldDescriptorProto_Type valueOf(int value) {
    if (null == _byValue) _init();
    return _byValue[value];
  }

  const GoogleProtobuf_FieldDescriptorProto_Type._(int i, int v, String n) : super(i, v, n);
}

class GoogleProtobuf_FieldDescriptorProto_Label extends ProtobufEnum {
  static GoogleProtobuf_FieldDescriptorProto_Label get LABEL_OPTIONAL => values[0];
  static GoogleProtobuf_FieldDescriptorProto_Label get LABEL_REQUIRED => values[1];
  static GoogleProtobuf_FieldDescriptorProto_Label get LABEL_REPEATED => values[2];
  static List<GoogleProtobuf_FieldDescriptorProto_Label> _byIndex;
  static Map<int, GoogleProtobuf_FieldDescriptorProto_Label> _byValue;

  static void _init() {
    _byIndex = const [
      const GoogleProtobuf_FieldDescriptorProto_Label._(0, 1, 'LABEL_OPTIONAL'),
      const GoogleProtobuf_FieldDescriptorProto_Label._(1, 2, 'LABEL_REQUIRED'),
      const GoogleProtobuf_FieldDescriptorProto_Label._(2, 3, 'LABEL_REPEATED'),
    ];
    _byValue = ProtobufEnum.initByValue(_byIndex);
  }

  static List<GoogleProtobuf_FieldDescriptorProto_Label> get values {
    if (null == _byIndex) _init();
    return _byIndex;
  }

  static GoogleProtobuf_FieldDescriptorProto_Label valueOf(int value) {
    if (null == _byValue) _init();
    return _byValue[value];
  }

  bool operator ==(Object o) {
    if (o is GoogleProtobuf_FieldDescriptorProto_Label) {
      GoogleProtobuf_FieldDescriptorProto_Label p = o;
      return value == p.value;
    } else {
      return false;
    }
  }

  const GoogleProtobuf_FieldDescriptorProto_Label._(int i, int v, String n) : super(i, v, n);
}

class GoogleProtobuf_FieldDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_FieldDescriptorProto _d;
  static GoogleProtobuf_FieldDescriptorProto_Builder newBuilder() => new GoogleProtobuf_FieldDescriptorProto_Builder();
  static GoogleProtobuf_FieldDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_FieldDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_FieldDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_FieldDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_FieldDescriptorProto._fromBuilder(GoogleProtobuf_FieldDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_FieldDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // optional int32 number = 3;
  int get number => g_(3);
  bool hasNumber() => h_(3);

  // optional enum label = 4;
  GoogleProtobuf_FieldDescriptorProto_Label get label => g_(4);
  bool hasLabel() => h_(4);

  // optional enum type = 5;
  GoogleProtobuf_FieldDescriptorProto_Type get type => g_(5);
  bool hasType() => h_(5);

  // optional string type_name = 6;
  String get typeName => g_(6);
  bool hasTypeName() => h_(6);

  // optional string extendee = 2;
  String get extendee => g_(2);
  bool hasExtendee() => h_(2);

  // optional string default_value = 7;
  String get defaultValue => g_(7);
  bool hasDefaultValue() => h_(7);

  // optional google.protobuf.FieldOptions options = 8;
  GoogleProtobuf_FieldOptions get options => g_(8);
  bool hasOptions() => h_(8);
}

class GoogleProtobuf_FieldDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_FieldDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.a(3, 'number', Builder.O3);
      _i.e(4, 'label', Builder.OE, () => GoogleProtobuf_FieldDescriptorProto_Label.LABEL_OPTIONAL, (var v) => GoogleProtobuf_FieldDescriptorProto_Label.valueOf(v));
      _i.e(5, 'type', Builder.OE, () => GoogleProtobuf_FieldDescriptorProto_Type.TYPE_DOUBLE, (var v) => GoogleProtobuf_FieldDescriptorProto_Type.valueOf(v));
      _i.a(6, 'typeName', Builder.OS);
      _i.a(2, 'extendee', Builder.OS);
      _i.a(7, 'defaultValue', Builder.OS);
      _i.a(8, 'options', Builder.OM, () => GoogleProtobuf_FieldOptions.defaultInstance, () => new GoogleProtobuf_FieldOptions_Builder());
    }
  }

  GoogleProtobuf_FieldDescriptorProto build() => super.build();
  GoogleProtobuf_FieldDescriptorProto buildPartial() => partial(new GoogleProtobuf_FieldDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  int get number => g_(3);
  void set number(int v) { s_(3, v); }
  bool hasNumber() => h_(3);
  void clearNumber() => c_(3);

  GoogleProtobuf_FieldDescriptorProto_Label get label => g_(4);
  void set label(GoogleProtobuf_FieldDescriptorProto_Label v) { s_(4, v); }
  bool hasLabel() => h_(4);
  void clearLabel() => c_(4);

  GoogleProtobuf_FieldDescriptorProto_Type get type => g_(5);
  void set type(GoogleProtobuf_FieldDescriptorProto_Type v) { s_(5, v); }
  bool hasType() => h_(5);
  void clearType() => c_(5);

  String get typeName => g_(6);
  void set typeName(String v) { s_(6, v); }
  bool hasTypeName() => h_(6);
  void clearTypeName() => c_(6);

  String get extendee => g_(2);
  void set extendee(String v) { s_(2, v); }
  bool hasExtendee() => h_(2);
  void clearExtendee() => c_(2);

  String get defaultValue => g_(7);
  void set defaultValue(String v) { s_(7, v); }
  bool hasDefaultValue() => h_(7);
  void clearDefaultValue() => c_(7);

  GoogleProtobuf_FieldOptions get options => g_(8);
  void set options(GoogleProtobuf_FieldOptions v) { s_(8, v); }
  bool hasOptions() => h_(8);
  void clearOptions() => c_(8);
}

class GoogleProtobuf_EnumDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_EnumDescriptorProto _d;
  static GoogleProtobuf_EnumDescriptorProto_Builder newBuilder() => new GoogleProtobuf_EnumDescriptorProto_Builder();
  static GoogleProtobuf_EnumDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_EnumDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_EnumDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_EnumDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_EnumDescriptorProto._fromBuilder(GoogleProtobuf_EnumDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_EnumDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // repeated google.protobuf.EnumValueDescriptorProto value = 2;
  List<GoogleProtobuf_EnumValueDescriptorProto> get value => g_(2);

  // optional google.protobuf.EnumOptions options = 3;
  GoogleProtobuf_EnumOptions get options => g_(3);
  bool hasOptions() => h_(3);
}

class GoogleProtobuf_EnumDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_EnumDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.m(2, 'value', () => new GoogleProtobuf_EnumValueDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_EnumValueDescriptorProto>(this));
      _i.a(3, 'options', Builder.OM, () => GoogleProtobuf_EnumOptions.defaultInstance, () => new GoogleProtobuf_EnumOptions_Builder());
    }
  }

  GoogleProtobuf_EnumDescriptorProto build() => super.build();
  GoogleProtobuf_EnumDescriptorProto buildPartial() => partial(new GoogleProtobuf_EnumDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  List<GoogleProtobuf_EnumValueDescriptorProto> get value => g_(2);

  GoogleProtobuf_EnumOptions get options => g_(3);
  void set options(GoogleProtobuf_EnumOptions v) { s_(3, v); }
  bool hasOptions() => h_(3);
  void clearOptions() => c_(3);
}

class GoogleProtobuf_EnumValueDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_EnumValueDescriptorProto _d;
  static GoogleProtobuf_EnumValueDescriptorProto_Builder newBuilder() => new GoogleProtobuf_EnumValueDescriptorProto_Builder();
  static GoogleProtobuf_EnumValueDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_EnumValueDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_EnumValueDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_EnumValueDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_EnumValueDescriptorProto._fromBuilder(GoogleProtobuf_EnumValueDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_EnumValueDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // optional int32 number = 2;
  int get number => g_(2);
  bool hasNumber() => h_(2);

  // optional google.protobuf.EnumValueOptions options = 3;
  GoogleProtobuf_EnumValueOptions get options => g_(3);
  bool hasOptions() => h_(3);
}

class GoogleProtobuf_EnumValueDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_EnumValueDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.a(2, 'number', Builder.O3);
      _i.a(3, 'options', Builder.OM, () => GoogleProtobuf_EnumValueOptions.defaultInstance, () => new GoogleProtobuf_EnumValueOptions_Builder());
    }
  }

  GoogleProtobuf_EnumValueDescriptorProto build() => super.build();
  GoogleProtobuf_EnumValueDescriptorProto buildPartial() => partial(new GoogleProtobuf_EnumValueDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  int get number => g_(2);
  void set number(int v) { s_(2, v); }
  bool hasNumber() => h_(2);
  void clearNumber() => c_(2);

  GoogleProtobuf_EnumValueOptions get options => g_(3);
  void set options(GoogleProtobuf_EnumValueOptions v) { s_(3, v); }
  bool hasOptions() => h_(3);
  void clearOptions() => c_(3);
}

class GoogleProtobuf_ServiceDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_ServiceDescriptorProto _d;
  static GoogleProtobuf_ServiceDescriptorProto_Builder newBuilder() => new GoogleProtobuf_ServiceDescriptorProto_Builder();
  static GoogleProtobuf_ServiceDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_ServiceDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_ServiceDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_ServiceDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_ServiceDescriptorProto._fromBuilder(GoogleProtobuf_ServiceDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_ServiceDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // repeated google.protobuf.MethodDescriptorProto method = 2;
  List<GoogleProtobuf_MethodDescriptorProto> get method => g_(2);

  // optional google.protobuf.ServiceOptions options = 3;
  GoogleProtobuf_ServiceOptions get options => g_(3);
  bool hasOptions() => h_(3);
}

class GoogleProtobuf_ServiceDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_ServiceDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.m(2, 'method', () => new GoogleProtobuf_MethodDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_MethodDescriptorProto>(this));
      _i.a(3, 'options', Builder.OM, () => GoogleProtobuf_ServiceOptions.defaultInstance, () => new GoogleProtobuf_ServiceOptions_Builder());
    }
  }

  GoogleProtobuf_ServiceDescriptorProto build() => super.build();
  GoogleProtobuf_ServiceDescriptorProto buildPartial() => partial(new GoogleProtobuf_ServiceDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  List<GoogleProtobuf_MethodDescriptorProto> get method => g_(2);

  GoogleProtobuf_ServiceOptions get options => g_(3);
  void set options(GoogleProtobuf_ServiceOptions v) { s_(3, v); }
  bool hasOptions() => h_(3);
  void clearOptions() => c_(3);
}

class GoogleProtobuf_MethodDescriptorProto extends GeneratedMessage {
  static GoogleProtobuf_MethodDescriptorProto _d;
  static GoogleProtobuf_MethodDescriptorProto_Builder newBuilder() => new GoogleProtobuf_MethodDescriptorProto_Builder();
  static GoogleProtobuf_MethodDescriptorProto get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_MethodDescriptorProto parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_MethodDescriptorProto> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_MethodDescriptorProto parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_MethodDescriptorProto._fromBuilder(GoogleProtobuf_MethodDescriptorProto_Builder b) : super(b);
  GoogleProtobuf_MethodDescriptorProto_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // optional string input_type = 2;
  String get inputType => g_(2);
  bool hasInputType() => h_(2);

  // optional string output_type = 3;
  String get outputType => g_(3);
  bool hasOutputType() => h_(3);

  // optional google.protobuf.MethodOptions options = 4;
  GoogleProtobuf_MethodOptions get options => g_(4);
  bool hasOptions() => h_(4);
}

class GoogleProtobuf_MethodDescriptorProto_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_MethodDescriptorProto");
      _i.a(1, 'name', Builder.OS);
      _i.a(2, 'inputType', Builder.OS);
      _i.a(3, 'outputType', Builder.OS);
      _i.a(4, 'options', Builder.OM, () => GoogleProtobuf_MethodOptions.defaultInstance, () => new GoogleProtobuf_MethodOptions_Builder());
    }
  }

  GoogleProtobuf_MethodDescriptorProto build() => super.build();
  GoogleProtobuf_MethodDescriptorProto buildPartial() => partial(new GoogleProtobuf_MethodDescriptorProto._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  String get inputType => g_(2);
  void set inputType(String v) { s_(2, v); }
  bool hasInputType() => h_(2);
  void clearInputType() => c_(2);

  String get outputType => g_(3);
  void set outputType(String v) { s_(3, v); }
  bool hasOutputType() => h_(3);
  void clearOutputType() => c_(3);

  GoogleProtobuf_MethodOptions get options => g_(4);
  void set options(GoogleProtobuf_MethodOptions v) { s_(4, v); }
  bool hasOptions() => h_(4);
  void clearOptions() => c_(4);
}

class GoogleProtobuf_FileOptions_OptimizeMode extends ProtobufEnum {
  static GoogleProtobuf_FileOptions_OptimizeMode get SPEED => values[0];
  static GoogleProtobuf_FileOptions_OptimizeMode get CODE_SIZE => values[1];
  static GoogleProtobuf_FileOptions_OptimizeMode get LITE_RUNTIME => values[2];
  static List<GoogleProtobuf_FileOptions_OptimizeMode> _byIndex;
  static Map<int, GoogleProtobuf_FileOptions_OptimizeMode> _byValue;

  static void _init() {
    _byIndex = const [
      const GoogleProtobuf_FileOptions_OptimizeMode._(0, 1, 'SPEED'),
      const GoogleProtobuf_FileOptions_OptimizeMode._(1, 2, 'CODE_SIZE'),
      const GoogleProtobuf_FileOptions_OptimizeMode._(2, 3, 'LITE_RUNTIME'),
    ];
    _byValue = ProtobufEnum.initByValue(_byIndex);
  }

  static List<GoogleProtobuf_FileOptions_OptimizeMode> get values {
    if (null == _byIndex) _init();
    return _byIndex;
  }

  static GoogleProtobuf_FileOptions_OptimizeMode valueOf(int value) {
    if (null == _byValue) _init();
    return _byValue[value];
  }

  bool operator ==(Object o) {
    if (o is GoogleProtobuf_FileOptions_OptimizeMode) {
      GoogleProtobuf_FileOptions_OptimizeMode p = o;
      return value == p.value;
    } else {
      return false;
    }
  }

  const GoogleProtobuf_FileOptions_OptimizeMode._(int i, int v, String n) : super(i, v, n);
}

class GoogleProtobuf_FileOptions extends GeneratedMessage {
  static GoogleProtobuf_FileOptions _d;
  static GoogleProtobuf_FileOptions_Builder newBuilder() => new GoogleProtobuf_FileOptions_Builder();
  static GoogleProtobuf_FileOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_FileOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_FileOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_FileOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_FileOptions._fromBuilder(GoogleProtobuf_FileOptions_Builder b) : super(b);
  GoogleProtobuf_FileOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string java_package = 1;
  String get javaPackage => g_(1);
  bool hasJavaPackage() => h_(1);

  // optional string java_outer_classname = 8;
  String get javaOuterClassname => g_(8);
  bool hasJavaOuterClassname() => h_(8);

  // optional bool java_multiple_files = 10;
  bool get javaMultipleFiles => g_(10);
  bool hasJavaMultipleFiles() => h_(10);

  // optional bool java_generate_equals_and_hash = 20;
  bool get javaGenerateEqualsAndHash => g_(20);
  bool hasJavaGenerateEqualsAndHash() => h_(20);

  // optional enum optimize_for = 9;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => g_(9);
  bool hasOptimizeFor() => h_(9);

  // optional bool cc_generic_services = 16;
  bool get ccGenericServices => g_(16);
  bool hasCcGenericServices() => h_(16);

  // optional bool java_generic_services = 17;
  bool get javaGenericServices => g_(17);
  bool hasJavaGenericServices() => h_(17);

  // optional bool py_generic_services = 18;
  bool get pyGenericServices => g_(18);
  bool hasPyGenericServices() => h_(18);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_FileOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_FileOptions");
      _i.a(1, 'javaPackage', Builder.OS);
      _i.a(8, 'javaOuterClassname', Builder.OS);
      _i.a(10, 'javaMultipleFiles', Builder.OB);
      _i.a(20, 'javaGenerateEqualsAndHash', Builder.OB);
      _i.e(9, 'optimizeFor', Builder.OE, () => GoogleProtobuf_FileOptions_OptimizeMode.SPEED, (var v) => GoogleProtobuf_FileOptions_OptimizeMode.valueOf(v));
      _i.a(16, 'ccGenericServices', Builder.OB);
      _i.a(17, 'javaGenericServices', Builder.OB);
      _i.a(18, 'pyGenericServices', Builder.OB);
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_FileOptions build() => super.build();
  GoogleProtobuf_FileOptions buildPartial() => partial(new GoogleProtobuf_FileOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get javaPackage => g_(1);
  void set javaPackage(String v) { s_(1, v); }
  bool hasJavaPackage() => h_(1);
  void clearJavaPackage() => c_(1);

  String get javaOuterClassname => g_(8);
  void set javaOuterClassname(String v) { s_(8, v); }
  bool hasJavaOuterClassname() => h_(8);
  void clearJavaOuterClassname() => c_(8);

  bool get javaMultipleFiles => g_(10);
  void set javaMultipleFiles(bool v) { s_(10, v); }
  bool hasJavaMultipleFiles() => h_(10);
  void clearJavaMultipleFiles() => c_(10);

  bool get javaGenerateEqualsAndHash => g_(20);
  void set javaGenerateEqualsAndHash(bool v) { s_(20, v); }
  bool hasJavaGenerateEqualsAndHash() => h_(20);
  void clearJavaGenerateEqualsAndHash() => c_(20);

  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => g_(9);
  void set optimizeFor(GoogleProtobuf_FileOptions_OptimizeMode v) { s_(9, v); }
  bool hasOptimizeFor() => h_(9);
  void clearOptimizeFor() => c_(9);

  bool get ccGenericServices => g_(16);
  void set ccGenericServices(bool v) { s_(16, v); }
  bool hasCcGenericServices() => h_(16);
  void clearCcGenericServices() => c_(16);

  bool get javaGenericServices => g_(17);
  void set javaGenericServices(bool v) { s_(17, v); }
  bool hasJavaGenericServices() => h_(17);
  void clearJavaGenericServices() => c_(17);

  bool get pyGenericServices => g_(18);
  void set pyGenericServices(bool v) { s_(18, v); }
  bool hasPyGenericServices() => h_(18);
  void clearPyGenericServices() => c_(18);

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_MessageOptions extends GeneratedMessage {
  static GoogleProtobuf_MessageOptions _d;
  static GoogleProtobuf_MessageOptions_Builder newBuilder() => new GoogleProtobuf_MessageOptions_Builder();
  static GoogleProtobuf_MessageOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_MessageOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_MessageOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_MessageOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_MessageOptions._fromBuilder(GoogleProtobuf_MessageOptions_Builder b) : super(b);
  GoogleProtobuf_MessageOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional bool message_set_wire_format = 1;
  bool get messageSetWireFormat => g_(1);
  bool hasMessageSetWireFormat() => h_(1);

  // optional bool no_standard_descriptor_accessor = 2;
  bool get noStandardDescriptorAccessor => g_(2);
  bool hasNoStandardDescriptorAccessor() => h_(2);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_MessageOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_MessageOptions");
      _i.a(1, 'messageSetWireFormat', Builder.OB);
      _i.a(2, 'noStandardDescriptorAccessor', Builder.OB);
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_MessageOptions build() => super.build();
  GoogleProtobuf_MessageOptions buildPartial() => partial(new GoogleProtobuf_MessageOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  bool get messageSetWireFormat => g_(1);
  void set messageSetWireFormat(bool v) { s_(1, v); }
  bool hasMessageSetWireFormat() => h_(1);
  void clearMessageSetWireFormat() => c_(1);

  bool get noStandardDescriptorAccessor => g_(2);
  void set noStandardDescriptorAccessor(bool v) { s_(2, v); }
  bool hasNoStandardDescriptorAccessor() => h_(2);
  void clearNoStandardDescriptorAccessor() => c_(2);

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_FieldOptions_CType extends ProtobufEnum {
  static GoogleProtobuf_FieldOptions_CType get STRING => values[0];
  static GoogleProtobuf_FieldOptions_CType get CORD => values[1];
  static GoogleProtobuf_FieldOptions_CType get STRING_PIECE => values[2];
  static List<GoogleProtobuf_FieldOptions_CType> _byIndex;
  static Map<int, GoogleProtobuf_FieldOptions_CType> _byValue;

  static void _init() {
    _byIndex = const [
      const GoogleProtobuf_FieldOptions_CType._(0, 0, 'STRING'),
      const GoogleProtobuf_FieldOptions_CType._(1, 1, 'CORD'),
      const GoogleProtobuf_FieldOptions_CType._(2, 2, 'STRING_PIECE'),
    ];
    _byValue = ProtobufEnum.initByValue(_byIndex);
  }

  static List<GoogleProtobuf_FieldOptions_CType> get values {
    if (null == _byIndex) _init();
    return _byIndex;
  }

  static GoogleProtobuf_FieldOptions_CType valueOf(int value) {
    if (null == _byValue) _init();
    return _byValue[value];
  }

  bool operator ==(Object o) {
    if (o is GoogleProtobuf_FieldOptions_CType) {
      GoogleProtobuf_FieldOptions_CType p = o;
      return value == p.value;
    } else {
      return false;
    }
  }

  const GoogleProtobuf_FieldOptions_CType._(int i, int v, String n) : super(i, v, n);
}

class GoogleProtobuf_FieldOptions extends GeneratedMessage {
  static GoogleProtobuf_FieldOptions _d;
  static GoogleProtobuf_FieldOptions_Builder newBuilder() => new GoogleProtobuf_FieldOptions_Builder();
  static GoogleProtobuf_FieldOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_FieldOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_FieldOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_FieldOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_FieldOptions._fromBuilder(GoogleProtobuf_FieldOptions_Builder b) : super(b);
  GoogleProtobuf_FieldOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional enum ctype = 1;
  GoogleProtobuf_FieldOptions_CType get ctype => g_(1);
  bool hasCtype() => h_(1);

  // optional bool packed = 2;
  bool get packed => g_(2);
  bool hasPacked() => h_(2);

  // optional bool deprecated = 3;
  bool get deprecated => g_(3);
  bool hasDeprecated() => h_(3);

  // optional string experimental_map_key = 9;
  String get experimentalMapKey => g_(9);
  bool hasExperimentalMapKey() => h_(9);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_FieldOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_FieldOptions");
      _i.e(1, 'ctype', Builder.OE, () => GoogleProtobuf_FieldOptions_CType.STRING, (var v) => GoogleProtobuf_FieldOptions_CType.valueOf(v));
      _i.a(2, 'packed', Builder.OB);
      _i.a(3, 'deprecated', Builder.OB);
      _i.a(9, 'experimentalMapKey', Builder.OS);
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_FieldOptions build() => super.build();
  GoogleProtobuf_FieldOptions buildPartial() => partial(new GoogleProtobuf_FieldOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  GoogleProtobuf_FieldOptions_CType get ctype => g_(1);
  void set ctype(GoogleProtobuf_FieldOptions_CType v) { s_(1, v); }
  bool hasCtype() => h_(1);
  void clearCtype() => c_(1);

  bool get packed => g_(2);
  void set packed(bool v) { s_(2, v); }
  bool hasPacked() => h_(2);
  void clearPacked() => c_(2);

  bool get deprecated => g_(3);
  void set deprecated(bool v) { s_(3, v); }
  bool hasDeprecated() => h_(3);
  void clearDeprecated() => c_(3);

  String get experimentalMapKey => g_(9);
  void set experimentalMapKey(String v) { s_(9, v); }
  bool hasExperimentalMapKey() => h_(9);
  void clearExperimentalMapKey() => c_(9);

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_EnumOptions extends GeneratedMessage {
  static GoogleProtobuf_EnumOptions _d;
  static GoogleProtobuf_EnumOptions_Builder newBuilder() => new GoogleProtobuf_EnumOptions_Builder();
  static GoogleProtobuf_EnumOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_EnumOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_EnumOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_EnumOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_EnumOptions._fromBuilder(GoogleProtobuf_EnumOptions_Builder b) : super(b);
  GoogleProtobuf_EnumOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_EnumOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_EnumOptions");
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_EnumOptions build() => super.build();
  GoogleProtobuf_EnumOptions buildPartial() => partial(new GoogleProtobuf_EnumOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_EnumValueOptions extends GeneratedMessage {
  static GoogleProtobuf_EnumValueOptions _d;
  static GoogleProtobuf_EnumValueOptions_Builder newBuilder() => new GoogleProtobuf_EnumValueOptions_Builder();
  static GoogleProtobuf_EnumValueOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_EnumValueOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_EnumValueOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_EnumValueOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_EnumValueOptions._fromBuilder(GoogleProtobuf_EnumValueOptions_Builder b) : super(b);
  GoogleProtobuf_EnumValueOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_EnumValueOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_EnumValueOptions");
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_EnumValueOptions build() => super.build();
  GoogleProtobuf_EnumValueOptions buildPartial() => partial(new GoogleProtobuf_EnumValueOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_ServiceOptions extends GeneratedMessage {
  static GoogleProtobuf_ServiceOptions _d;
  static GoogleProtobuf_ServiceOptions_Builder newBuilder() => new GoogleProtobuf_ServiceOptions_Builder();
  static GoogleProtobuf_ServiceOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_ServiceOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_ServiceOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_ServiceOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_ServiceOptions._fromBuilder(GoogleProtobuf_ServiceOptions_Builder b) : super(b);
  GoogleProtobuf_ServiceOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_ServiceOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_ServiceOptions");
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_ServiceOptions build() => super.build();
  GoogleProtobuf_ServiceOptions buildPartial() => partial(new GoogleProtobuf_ServiceOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_MethodOptions extends GeneratedMessage {
  static GoogleProtobuf_MethodOptions _d;
  static GoogleProtobuf_MethodOptions_Builder newBuilder() => new GoogleProtobuf_MethodOptions_Builder();
  static GoogleProtobuf_MethodOptions get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_MethodOptions parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_MethodOptions> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_MethodOptions parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_MethodOptions._fromBuilder(GoogleProtobuf_MethodOptions_Builder b) : super(b);
  GoogleProtobuf_MethodOptions_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.UninterpretedOption uninterpreted_option = 999;
  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_MethodOptions_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_MethodOptions");
      _i.m(999, 'uninterpretedOption', () => new GoogleProtobuf_UninterpretedOption_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption>(this));
      _i.hasExtensions = true;
    }
  }

  GoogleProtobuf_MethodOptions build() => super.build();
  GoogleProtobuf_MethodOptions buildPartial() => partial(new GoogleProtobuf_MethodOptions._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_UninterpretedOption> get uninterpretedOption => g_(999);
}

class GoogleProtobuf_UninterpretedOption_NamePart extends GeneratedMessage {
  static GoogleProtobuf_UninterpretedOption_NamePart _d;
  static GoogleProtobuf_UninterpretedOption_NamePart_Builder newBuilder() => new GoogleProtobuf_UninterpretedOption_NamePart_Builder();
  static GoogleProtobuf_UninterpretedOption_NamePart get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_UninterpretedOption_NamePart parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_UninterpretedOption_NamePart> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_UninterpretedOption_NamePart parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_UninterpretedOption_NamePart._fromBuilder(GoogleProtobuf_UninterpretedOption_NamePart_Builder b) : super(b);
  GoogleProtobuf_UninterpretedOption_NamePart_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // required string name_part = 1;
  String get namePart => g_(1);
  bool hasNamePart() => h_(1);

  // required bool is_extension = 2;
  bool get isExtension => g_(2);
  bool hasIsExtension() => h_(2);
}

class GoogleProtobuf_UninterpretedOption_NamePart_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_UninterpretedOption_NamePart");
      _i.a(1, 'namePart', Builder.QS);
      _i.a(2, 'isExtension', Builder.QB);
    }
  }

  GoogleProtobuf_UninterpretedOption_NamePart build() => super.build();
  GoogleProtobuf_UninterpretedOption_NamePart buildPartial() => partial(new GoogleProtobuf_UninterpretedOption_NamePart._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get namePart => g_(1);
  void set namePart(String v) { s_(1, v); }
  bool hasNamePart() => h_(1);
  void clearNamePart() => c_(1);

  bool get isExtension => g_(2);
  void set isExtension(bool v) { s_(2, v); }
  bool hasIsExtension() => h_(2);
  void clearIsExtension() => c_(2);
}

class GoogleProtobuf_UninterpretedOption extends GeneratedMessage {
  static GoogleProtobuf_UninterpretedOption _d;
  static GoogleProtobuf_UninterpretedOption_Builder newBuilder() => new GoogleProtobuf_UninterpretedOption_Builder();
  static GoogleProtobuf_UninterpretedOption get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_UninterpretedOption parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_UninterpretedOption> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_UninterpretedOption parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_UninterpretedOption._fromBuilder(GoogleProtobuf_UninterpretedOption_Builder b) : super(b);
  GoogleProtobuf_UninterpretedOption_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.UninterpretedOption.NamePart name = 2;
  List<GoogleProtobuf_UninterpretedOption_NamePart> get name => g_(2);

  // optional string identifier_value = 3;
  String get identifierValue => g_(3);
  bool hasIdentifierValue() => h_(3);

  // optional uint64 positive_int_value = 4;
  int get positiveIntValue => g_(4);
  bool hasPositiveIntValue() => h_(4);

  // optional int64 negative_int_value = 5;
  int get negativeIntValue => g_(5);
  bool hasNegativeIntValue() => h_(5);

  // optional double double_value = 6;
  double get doubleValue => g_(6);
  bool hasDoubleValue() => h_(6);

  // optional bytes string_value = 7;
  List<int> get stringValue => g_(7);
  bool hasStringValue() => h_(7);

  // optional string aggregate_value = 8;
  String get aggregateValue => g_(8);
  bool hasAggregateValue() => h_(8);
}

class GoogleProtobuf_UninterpretedOption_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_UninterpretedOption");
      _i.m(2, 'name', () => new GoogleProtobuf_UninterpretedOption_NamePart_Builder(), () => new PbList<GoogleProtobuf_UninterpretedOption_NamePart>(this));
      _i.a(3, 'identifierValue', Builder.OS);
      _i.a(4, 'positiveIntValue', Builder.OU6);
      _i.a(5, 'negativeIntValue', Builder.O6);
      _i.a(6, 'doubleValue', Builder.OD);
      _i.a(7, 'stringValue', Builder.OY);
      _i.a(8, 'aggregateValue', Builder.OS);
    }
  }

  GoogleProtobuf_UninterpretedOption build() => super.build();
  GoogleProtobuf_UninterpretedOption buildPartial() => partial(new GoogleProtobuf_UninterpretedOption._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_UninterpretedOption_NamePart> get name => g_(2);

  String get identifierValue => g_(3);
  void set identifierValue(String v) { s_(3, v); }
  bool hasIdentifierValue() => h_(3);
  void clearIdentifierValue() => c_(3);

  int get positiveIntValue => g_(4);
  void set positiveIntValue(int v) { s_(4, v); }
  bool hasPositiveIntValue() => h_(4);
  void clearPositiveIntValue() => c_(4);

  int get negativeIntValue => g_(5);
  void set negativeIntValue(int v) { s_(5, v); }
  bool hasNegativeIntValue() => h_(5);
  void clearNegativeIntValue() => c_(5);

  double get doubleValue => g_(6);
  void set doubleValue(double v) { s_(6, v); }
  bool hasDoubleValue() => h_(6);
  void clearDoubleValue() => c_(6);

  List<int> get stringValue => g_(7);
  void set stringValue(List<int> v) { s_(7, v); }
  bool hasStringValue() => h_(7);
  void clearStringValue() => c_(7);

  String get aggregateValue => g_(8);
  void set aggregateValue(String v) { s_(8, v); }
  bool hasAggregateValue() => h_(8);
  void clearAggregateValue() => c_(8);
}

class GoogleProtobuf_SourceCodeInfo_Location extends GeneratedMessage {
  static GoogleProtobuf_SourceCodeInfo_Location _d;
  static GoogleProtobuf_SourceCodeInfo_Location_Builder newBuilder() => new GoogleProtobuf_SourceCodeInfo_Location_Builder();
  static GoogleProtobuf_SourceCodeInfo_Location get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_SourceCodeInfo_Location parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_SourceCodeInfo_Location> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_SourceCodeInfo_Location parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_SourceCodeInfo_Location._fromBuilder(GoogleProtobuf_SourceCodeInfo_Location_Builder b) : super(b);
  GoogleProtobuf_SourceCodeInfo_Location_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated int32 path = 1 [packed=true];
  List<int> get path => g_(1);

  // repeated int32 span = 2 [packed=true];
  List<int> get span => g_(2);
}

class GoogleProtobuf_SourceCodeInfo_Location_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_SourceCodeInfo_Location");
      _i.a(1, 'path', Builder.K3, () => new PbList(this));
      _i.a(2, 'span', Builder.K3, () => new PbList(this));
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobuf_SourceCodeInfo_Location build() => super.build();
  GoogleProtobuf_SourceCodeInfo_Location buildPartial() => partial(new GoogleProtobuf_SourceCodeInfo_Location._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<int> get path => g_(1);

  List<int> get span => g_(2);
}

class GoogleProtobuf_SourceCodeInfo extends GeneratedMessage {
  static GoogleProtobuf_SourceCodeInfo _d;
  static GoogleProtobuf_SourceCodeInfo_Builder newBuilder() => new GoogleProtobuf_SourceCodeInfo_Builder();
  static GoogleProtobuf_SourceCodeInfo get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobuf_SourceCodeInfo parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobuf_SourceCodeInfo> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobuf_SourceCodeInfo parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobuf_SourceCodeInfo._fromBuilder(GoogleProtobuf_SourceCodeInfo_Builder b) : super(b);
  GoogleProtobuf_SourceCodeInfo_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated google.protobuf.SourceCodeInfo.Location location = 1;
  List<GoogleProtobuf_SourceCodeInfo_Location> get location => g_(1);
}

class GoogleProtobuf_SourceCodeInfo_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobuf_SourceCodeInfo");
      _i.m(1, 'location', () => new GoogleProtobuf_SourceCodeInfo_Location_Builder(), () => new PbList<GoogleProtobuf_SourceCodeInfo_Location>(this));
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobuf_SourceCodeInfo build() => super.build();
  GoogleProtobuf_SourceCodeInfo buildPartial() => partial(new GoogleProtobuf_SourceCodeInfo._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<GoogleProtobuf_SourceCodeInfo_Location> get location => g_(1);
}

