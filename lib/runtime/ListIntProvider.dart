// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * Provides a List<int> based version of integer arrays.
 */
List<int> createIntArray(int length) => new List<int>(length);
List<int> createIntArrayFrom(List<int> source) => new List<int>.from(source);
