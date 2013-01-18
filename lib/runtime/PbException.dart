// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class PbException {
  String message;

  PbException(this.message) { }

  String toString() => message;
}

class IllegalStateException extends PbException {
  IllegalStateException(String message)
    : super("IllegalStateException: $message") { }
}

class UninitializedMessageException extends PbException {
  UninitializedMessageException(List<String> missingFields) :
      super("Message missing required fields: "
          "${Strings.join(missingFields, ', ')}");
}

class PbBufferBusyStateException extends PbException {
  PbBufferBusyStateException() : super("PbBuffer in busy state.");
}

class InvalidProtocolBufferException extends PbException {

  InvalidProtocolBufferException(String message) :
      super("InvalidProtocolBufferException: $message") { }

  static InvalidProtocolBufferException invalidEndTag() {
    return new InvalidProtocolBufferException(
        "Protocol message end-group tag did not match expected tag.");
  }

  static InvalidProtocolBufferException invalidTag() {
    return new InvalidProtocolBufferException(
        "Protocol message contained an invalid tag (zero).");
  }

  static InvalidProtocolBufferException invalidWireType() {
    return new InvalidProtocolBufferException(
        "Protocol message tag had invalid wire type.");
  }

  static InvalidProtocolBufferException malformedVarint() {
    return new InvalidProtocolBufferException(
        "CodedBufferReader encountered a malformed varint.");
  }

  static InvalidProtocolBufferException negativeSize() {
    return new InvalidProtocolBufferException("""
CodedBufferReader encountered an embedded string or message
which claimed to have negative size.
"""
    );
  }

  static InvalidProtocolBufferException recursionLimitExceeded() {
    return new InvalidProtocolBufferException("""
Protocol message had too many levels of nesting.  May be malicious.
Use CodedBufferReader.setRecursionLimit() to increase the depth limit.
"""
    );
  }

  static InvalidProtocolBufferException sizeLimitExceeded() {
    return new InvalidProtocolBufferException("""
Protocol message was too large.  May be malicious.
Use CodedBufferReader.setSizeLimit() to increase the size limit.
"""
    );
  }

  static InvalidProtocolBufferException truncatedMessage() {
    return new InvalidProtocolBufferException("""
While parsing a protocol message, the input ended unexpectedly
in the middle of a field.  This could mean either than the
input has been truncated or that an embedded message
misreported its own length.
"""
    );
  }
}
