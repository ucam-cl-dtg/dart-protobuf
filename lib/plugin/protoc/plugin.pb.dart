 ///
//  Generated code. Do not modify.
///

part of protobuf_generator;

class GoogleProtobufCompiler_CodeGeneratorRequest extends GeneratedMessage {
  static GoogleProtobufCompiler_CodeGeneratorRequest _d;
  static GoogleProtobufCompiler_CodeGeneratorRequest_Builder newBuilder() => new GoogleProtobufCompiler_CodeGeneratorRequest_Builder();
  static GoogleProtobufCompiler_CodeGeneratorRequest get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobufCompiler_CodeGeneratorRequest parseFromBuffer(List<int> i, {ExtensionRegistry r}) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobufCompiler_CodeGeneratorRequest> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobufCompiler_CodeGeneratorRequest parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobufCompiler_CodeGeneratorRequest._fromBuilder(GoogleProtobufCompiler_CodeGeneratorRequest_Builder b) : super(b);
  GoogleProtobufCompiler_CodeGeneratorRequest_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // repeated string file_to_generate = 1;
  List<String> get fileToGenerate => g_(1);

  // optional string parameter = 2;
  String get parameter => g_(2);
  bool hasParameter() => h_(2);

  // repeated google.protobuf.FileDescriptorProto proto_file = 15;
  List<GoogleProtobuf_FileDescriptorProto> get protoFile => g_(15);
}

class GoogleProtobufCompiler_CodeGeneratorRequest_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobufCompiler_CodeGeneratorRequest");
      _i.p(1, 'fileToGenerate', Builder.PS);
      _i.a(2, 'parameter', Builder.OS);
      _i.m(15, 'protoFile', () => new GoogleProtobuf_FileDescriptorProto_Builder(), () => new PbList<GoogleProtobuf_FileDescriptorProto>(this));
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobufCompiler_CodeGeneratorRequest build() => super.build();
  GoogleProtobufCompiler_CodeGeneratorRequest buildPartial() => partial(new GoogleProtobufCompiler_CodeGeneratorRequest._fromBuilder(this));
  BuilderInfo get info_ => _i;

  List<String> get fileToGenerate => g_(1);

  String get parameter => g_(2);
  void set parameter(String v) { s_(2, v); }
  bool hasParameter() => h_(2);
  void clearParameter() => c_(2);

  List<GoogleProtobuf_FileDescriptorProto> get protoFile => g_(15);
}

class GoogleProtobufCompiler_CodeGeneratorResponse_File extends GeneratedMessage {
  static GoogleProtobufCompiler_CodeGeneratorResponse_File _d;
  static GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder newBuilder() => new GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder();
  static GoogleProtobufCompiler_CodeGeneratorResponse_File get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobufCompiler_CodeGeneratorResponse_File parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobufCompiler_CodeGeneratorResponse_File> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobufCompiler_CodeGeneratorResponse_File parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobufCompiler_CodeGeneratorResponse_File._fromBuilder(GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder b) : super(b);
  GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string name = 1;
  String get name => g_(1);
  bool hasName() => h_(1);

  // optional string insertion_point = 2;
  String get insertionPoint => g_(2);
  bool hasInsertionPoint() => h_(2);

  // optional string content = 15;
  String get content => g_(15);
  bool hasContent() => h_(15);
}

class GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobufCompiler_CodeGeneratorResponse_File");
      _i.a(1, 'name', Builder.OS);
      _i.a(2, 'insertionPoint', Builder.OS);
      _i.a(15, 'content', Builder.OS);
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobufCompiler_CodeGeneratorResponse_File build() => super.build();
  GoogleProtobufCompiler_CodeGeneratorResponse_File buildPartial() => partial(new GoogleProtobufCompiler_CodeGeneratorResponse_File._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get name => g_(1);
  void set name(String v) { s_(1, v); }
  bool hasName() => h_(1);
  void clearName() => c_(1);

  String get insertionPoint => g_(2);
  void set insertionPoint(String v) { s_(2, v); }
  bool hasInsertionPoint() => h_(2);
  void clearInsertionPoint() => c_(2);

  String get content => g_(15);
  void set content(String v) { s_(15, v); }
  bool hasContent() => h_(15);
  void clearContent() => c_(15);
}

class GoogleProtobufCompiler_CodeGeneratorResponse extends GeneratedMessage {
  static GoogleProtobufCompiler_CodeGeneratorResponse _d;
  static GoogleProtobufCompiler_CodeGeneratorResponse_Builder newBuilder() => new GoogleProtobufCompiler_CodeGeneratorResponse_Builder();
  static GoogleProtobufCompiler_CodeGeneratorResponse get defaultInstance => null == _d ? (_d = newBuilder().buildPartial()) : _d;
  static GoogleProtobufCompiler_CodeGeneratorResponse parseFromBuffer(List<int> i, [ExtensionRegistry r]) => GeneratedMessage.parseBuffer(newBuilder(), i, r);
  static Future<GoogleProtobufCompiler_CodeGeneratorResponse> parseFromStream(InputStream i, [ExtensionRegistry r]) => GeneratedMessage.parseStream(newBuilder(), i, r);
  static GoogleProtobufCompiler_CodeGeneratorResponse parseFromJson(String i, [ExtensionRegistry r]) => GeneratedMessage.parseJson(newBuilder(), i, r);
  GoogleProtobufCompiler_CodeGeneratorResponse._fromBuilder(GoogleProtobufCompiler_CodeGeneratorResponse_Builder b) : super(b);
  GoogleProtobufCompiler_CodeGeneratorResponse_Builder toBuilder() => newBuilder().mergeFromMessage(this);

  // optional string error = 1;
  String get error => g_(1);
  bool hasError() => h_(1);

  // repeated google.protobuf.compiler.CodeGeneratorResponse.File file = 15;
  List<GoogleProtobufCompiler_CodeGeneratorResponse_File> get file => g_(15);
}

class GoogleProtobufCompiler_CodeGeneratorResponse_Builder extends Builder {
  static BuilderInfo _i;

  void initialize_() {
    if (null == _i) {
      _i = new BuilderInfo(this, "GoogleProtobufCompiler_CodeGeneratorResponse");
      _i.a(1, 'error', Builder.OS);
      _i.m(15, 'file', () => new GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder(), () => new PbList<GoogleProtobufCompiler_CodeGeneratorResponse_File>(this));
      _i.hasRequiredFields = false;
    }
  }

  GoogleProtobufCompiler_CodeGeneratorResponse build() => super.build();
  GoogleProtobufCompiler_CodeGeneratorResponse buildPartial() => partial(new GoogleProtobufCompiler_CodeGeneratorResponse._fromBuilder(this));
  BuilderInfo get info_ => _i;

  String get error => g_(1);
  void set error(String v) { s_(1, v); }
  bool hasError() => h_(1);
  void clearError() => c_(1);

  List<GoogleProtobufCompiler_CodeGeneratorResponse_File> get file => g_(15);
}

