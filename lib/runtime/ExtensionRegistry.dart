// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * A collection of [Extension] objects, organized by the message type they
 * extend.
 */
class ExtensionRegistry {

  Map<String, Map<int, Extension>> _extensions;

  ExtensionRegistry() : _extensions =
      new Map<String, Map<int, Extension>>();

  static ExtensionRegistry _EMPTY_REGISTRY;

  static ExtensionRegistry get EMPTY_REGISTRY {
    if (_EMPTY_REGISTRY == null) {
      _EMPTY_REGISTRY = new _EmptyExtensionRegistry();
    }
    return _EMPTY_REGISTRY;
  }

  /**
   * Store an extension in the registry.
   */
  void add(Extension extension) {
    Map<int, Extension> map = _extensions[extension.extendee];
    if (map == null) {
      map = new Map<int, Extension>();
      _extensions[extension.extendee] = map;
    }
    map[extension.tagNumber] = extension;
  }

  /**
   * Retrieve an extension from the registry that adds the given tag
   * number to the given message type.
   */
  Extension getExtension(String messageName, int tagNumber) {
    Map<int, Extension> map = _extensions[messageName];
    if (map != null) {
      return map[tagNumber];
    }
    return null;
  }
}

class _EmptyExtensionRegistry extends ExtensionRegistry {
  void add(Extension extension) {
    throw new UnsupportedOperationException("Immutable ExtensionRegistry");
  }

  Extension getExtension(String messageName, int tagNumber) => null;
}
