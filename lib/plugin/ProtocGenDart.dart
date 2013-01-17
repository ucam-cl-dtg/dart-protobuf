#!/usr/bin/env dart
// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#import("../runtime/Protobuf.dart");
#import("dart:io");
#import('dart:core');
#import('dart:math');
#source("protoc/descriptor.pb.dart");
#source("protoc/plugin.pb.dart");
#source("CodeGenerator.dart");
#source("DartFile.dart");
#source("DartHelpers.dart");
#source("EnumGenerator.dart");
#source("ExtensionGenerator.dart");
#source("IndentingWriter.dart");
#source("MessageGenerator.dart");
#source("ProtobufField.dart");
#source("ProtocException.dart");
#source("ProtoGenDartConfig.dart");
#source("Writer.dart");

final String DISABLE_STREAMS_FLAG = "disable_streams";

void main() {
  var config = parseOptions();
  if (config === null || !config.valid) {
    usage();
  } else {
    CodeGenerator cg = new CodeGenerator(config, stdin, stdout, stderr);
    cg.generate();
  }
}

void err(String s) {
  stderr.write("$s\n".charCodes());
}

void usage() {
  err("Usage: protoc-gen-dart [--out=OUTDIR] [--parameter=PARAM] "
      "PROTO_FILES < DESCRIPTORS");
  err("--out=OUTDIR      output directory (as passed to the --foo_out");
  err("                  parameterif omitted, the current directory should");
  err("                  be used.");
  err("--parameter=PARAM gives the generator param, if any was provided.");
  err("                  Some generators accept extra parameters. You can");
  err("                  specify this parameter on the command-line by");
  err("                  placing it before the output directory, separated");
  err("                  by a colon (protoc --dart_out=disable_streams:out).");
  err("  PROTO_FILES     The PROTO_FILES list the .proto files which");
  err("                  were given on the compiler command-line; these");
  err("                  are the files for which the plugin is expected");
  err("                  to generate output code.");
  err("  DESCRIPTORS     Finally, DESCRIPTORS is an encoded");
  err("                  FileDescriptorSet as defined in descriptor.proto");
  err("                  This is piped to the plugin's stdin.");
}

final String OUT_CL_PARAM = "--out";
final String PARAMETER_CL_PARAM = "--parameter";

ProtocGenDartConfig parseOptions([ProtocGenDartConfig config = null]) {
  Options opts = new Options();
  ProtocGenDartConfig _config = config !== null ? config
      : new ProtocGenDartConfig();
  try {
    for (int i = 0; i < opts.arguments.length; i++) {
      if (opts.arguments[i].startsWith(OUT_CL_PARAM)) {
        if(opts.arguments[i].length > OUT_CL_PARAM.length + 1) {
          _config.out = opts.arguments[i].substring(OUT_CL_PARAM.length + 1);
        }
      } else if (opts.arguments[i].startsWith(PARAMETER_CL_PARAM)) {
        if(opts.arguments[i].length > PARAMETER_CL_PARAM.length + 1) {
          _config.parameter =
              opts.arguments[i].substring(PARAMETER_CL_PARAM.length + 1);
        }
        continue;
      } else {
        if (opts.arguments[i].startsWith("-")) {
          _config.valid = false;
        } else {
          _config.protoFiles.add(opts.arguments[i]);
        }
      }
    }
    return _config;
  } on FileIOException catch(e) {
  //} catch (FileIOException e) {
    err(e.message);
  }
}

