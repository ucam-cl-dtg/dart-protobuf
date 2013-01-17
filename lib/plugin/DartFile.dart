// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class FileGenerator implements ProtobufContainer {
  GoogleProtobuf_FileDescriptorProto _fileDescriptor;
  ProtobufContainer _parent;
  GenerationContext _context;
  GoogleProtobuf_FileOptions_OptimizeMode _optimizeFor;

  List<EnumGenerator> enumGenerators;
  List<MessageGenerator> messageGenerators;
  List<ExtensionGenerator> extensionGenerators;

  FileGenerator(GoogleProtobuf_FileDescriptorProto this._fileDescriptor,
      ProtobufContainer this._parent, GenerationContext this._context) {
    _context.register(this);
    enumGenerators = new List<EnumGenerator>();
    messageGenerators = new List<MessageGenerator>();
    extensionGenerators = new List<ExtensionGenerator>();

    _classname = _fileDescriptor.package === null ? "" :
        "${dotsToCamelCase(_fileDescriptor.package, true)}";

    _optimizeFor = _parent.optimizeFor;
    if (_optimizeFor == null && _fileDescriptor.hasOptions() &&
        _fileDescriptor.options.hasOptimizeFor()) {
      _optimizeFor = _fileDescriptor.options.optimizeFor;
    }
    if (_optimizeFor == null) {
      _optimizeFor = GoogleProtobuf_FileOptions_OptimizeMode.SPEED;
    }

    // Load and register all enum and message types
    for (GoogleProtobuf_EnumDescriptorProto enumType in _fileDescriptor.enumType) {
      enumGenerators.add(new EnumGenerator(enumType, this, _context));
    }
    for (GoogleProtobuf_DescriptorProto messageType in _fileDescriptor.messageType) {
      messageGenerators.add(new MessageGenerator(messageType, this, _context));
    }
    for (GoogleProtobuf_FieldDescriptorProto extension in _fileDescriptor.extension) {
      extensionGenerators.add(new ExtensionGenerator(extension,
          this, _context));
    }
  }

  String get classname => _classname;
  String get fqname => _fileDescriptor.package === null
      ? "" : ".${_fileDescriptor.package}";
  GoogleProtobuf_FileOptions_OptimizeMode get optimizeFor => _optimizeFor;

  GoogleProtobufCompiler_CodeGeneratorResponse_File generate() {
    MemoryWriter writer = new MemoryWriter();
    IndentingWriter out = new IndentingWriter("  ", writer);

    List<ExtensionGenerator> allExtensions = new List<ExtensionGenerator>();

    out.println("///");
    out.println("//  Generated code. Do not modify.");
    out.println("///");

    // Initialize Field
    for (MessageGenerator m in messageGenerators) {
      m.initializeFields();
    }

    // Generate code
    for (EnumGenerator e in enumGenerators) {
      e.generate(out);
    }
    for (MessageGenerator m in messageGenerators) {
      m.generate(out, allExtensions);
    }

    // Generate code for extensions defined at top-level using a class
    // name derived from the file name
    if (!extensionGenerators.isEmpty || !allExtensions.isEmpty) {
      String filename = _fileDescriptor.name;
      if (filename.endsWith(".proto")) {
        filename = filename.substring(0, filename.length - 6);
      }
      filename = filename.replaceAll("/", "_");
      filename = "${filename[0].toUpperCase()}${filename.substring(1)}";

      out.addBlock("class ${filename} {", "}\n", () {
        for (ExtensionGenerator x in extensionGenerators) {
          allExtensions.add(x);
          x.generate(out);
        }
        out.println("static void registerAllExtensions(ExtensionRegistry "
            "registry) {");
        for (ExtensionGenerator x in allExtensions) {
          out.println("  registry.add(${x.name});");
        }
        out.println("}");
      });
    }

    GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder file_builder =
        new GoogleProtobufCompiler_CodeGeneratorResponse_File_Builder();
    String name = _fileDescriptor.name;
    if (name.endsWith(".proto")) {
      name = name.substring(0, name.length - 6);
    }
    file_builder.name = "$name.pb.dart";
    file_builder.content = writer.toString();
    return file_builder.build();
  }

  String _classname;
}

class GenerationContext {
  GenerationContext(Writer this.err) : _registry = {};

  void register(ProtobufContainer container) {
    _registry[container.fqname] = container;
  }

  Writer err;
  ProtobufContainer operator [](String fqname) => _registry[fqname];
  Map<String, ProtobufContainer> _registry;
}
