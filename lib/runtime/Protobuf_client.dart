// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library('Protobuf_client');
#import('dart:utf');
#import('dart:json');
#import('../../fixnum/fixnum.dart');
// FIXME: import dart:io when available in client
#source("mock_io.dart");
#source('Builder.dart');
#source('BuilderInfo.dart');
#source('ByteListUtils.dart');
#source('ChangeListener.dart');
#source('CodedReader.dart');
#source('CodedBufferReader.dart');
#source('CodedBufferWriter.dart');
#source('CodedStreamReader.dart');
#source('Extension.dart');
#source('ExtensionRegistry.dart');
#source('FieldInfo.dart');
#source('GeneratedMessage.dart');
#source('ListIntProvider.dart');
#source('Message.dart');
#source('PbByteBuffer.dart');
#source('PbCodec.dart');
#source('PbException.dart');
#source('PbImmutableList.dart');
#source('PbInputStreamReader.dart');
#source('PbList.dart');
#source('PbReader.dart');
#source('ProtobufEnum.dart');
#source('UnknownFieldSet.dart');
#source('WireFormat.dart');
