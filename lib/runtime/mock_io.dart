// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * As needed mock alternative to dart:io for environments
 * where dart:io is unavailable.
 */
class InputStream {
  int available() {
    throw new UnsupportedOperationException(
        "Method InputStream.available() not available");
  }
  bool get closed() {
    throw new UnsupportedOperationException(
        "Method InputStream.closed() not available");
  }
  List<int> read([int readSize]) {
    throw new UnsupportedOperationException(
        "Method InputStream.read() not available");
  }
  void set onClosed(void callback()) {
    throw new UnsupportedOperationException(
        "Setter InputStream.onClosed() not available");
  }
  void set onData(void callback()) {
    throw new UnsupportedOperationException(
        "Setter InputStream.onData not available");
  }
  void set onError(void callback(Exception e)) {
    throw new UnsupportedOperationException(
        "Setter InputStream.onError not available");
  }
}
