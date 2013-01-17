// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//interface ProtobufContainer {
class ProtobufContainer {
  String get fqname;
  String get classname;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor {} //will it work
}

class CodeGenerator implements ProtobufContainer {
  CodeGenerator(ProtocGenDartConfig this._config, InputStream this._streamIn,
      OutputStream this._streamOut, OutputStream this._streamErr);

  void generate() {
    PbInputStreamReader reader = new PbInputStreamReader(_streamIn);
    Future<List<int>> futureBytes = reader.readBytes();
    futureBytes.then(_(List<int> bytes) {
      _streamIn.close();
      GoogleProtobufCompiler_CodeGeneratorRequest request =
          GoogleProtobufCompiler_CodeGeneratorRequest.parseFromBuffer(bytes);

      GoogleProtobufCompiler_CodeGeneratorResponse_Builder responseBuilder =
          new GoogleProtobufCompiler_CodeGeneratorResponse_Builder();

      GenerationContext ctx =
          new GenerationContext(new OutputStreamWriter(_streamErr));

      List<FileGenerator> generators = new List<FileGenerator>();
      for (GoogleProtobuf_FileDescriptorProto file in request.protoFile) {
        FileGenerator generator = new FileGenerator(file, this, ctx);
        if (request.fileToGenerate.indexOf(file.name) >= 0) {
          generators.add(generator);
        }
      }

      for (FileGenerator filegen in generators) {
        GoogleProtobufCompiler_CodeGeneratorResponse_File file = filegen.generate();
        responseBuilder.file.add(file);
      }

      List<int> buffer = responseBuilder.build().writeToBuffer();
      _streamOut.write(buffer);
    });
  }

  ProtocGenDartConfig _config;
  InputStream _streamIn;
  OutputStream _streamOut;
  OutputStream _streamErr;
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => null;
  String get fqname => "";
  String get classname => null;
}
