// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

/*
 * This is a wrapper around a fixed-length list with modifications disabled.
 */
class PbImmutableList<T> implements List<T>, Hashable {
  List<T> _wrappedList;
  int _memoizedHashCode = -1;

  static List _EMPTY;
  static PbImmutableList get EMPTY {
    if (_EMPTY == null) {
      _EMPTY = new PbImmutableList.from([]);
    }
    return _EMPTY;
  }

  PbImmutableList.from(List<T> list) {
    _wrappedList = new List(list.length);
    _wrappedList.setRange(0, list.length, list);
  }

  bool operator ==(Object o) {
    if (o is! PbImmutableList){
      return false;
    }
    PbImmutableList oil = o;
    if (length != oil.length) {
      return false;
    }

    for (int i = 0; i < length; i++) {
      if (this[i] != oil[i]) {
        return false;
      }
    }
    return true;
  }


  
  int get hashCode {
    if (_memoizedHashCode == -1) {
      _memoizedHashCode = 13 * length;
      for (var entry in this) {
        if (entry is Hashable) {
          _memoizedHashCode = (19 * _memoizedHashCode) + entry.hashCode;
        }
      }
    }
    return _memoizedHashCode;
  }
  

  T operator [](int index) => _wrappedList[index];

  List<T> getRange(int start, int length) =>
      _wrappedList.getRange(start, length);

  int indexOf(T element, [int start = 0]) =>
      _wrappedList.indexOf(element, start);

  Iterator<T> iterator() => _wrappedList.iterator();

  T get last => this[length - 1];

  int lastIndexOf(T element, [int start = null]) =>
      _wrappedList.lastIndexOf(element, start);

  int get length => _wrappedList.length;

  String toString() {
    return "PbImmutableList";
  }

  void operator []=(int index, T value) {
    throw new UnsupportedError(
        "Cannot modify an immutable list");
  }

  void copyFrom(List src, int srcStart, int dstStart, int count) {
    throw new UnsupportedError(
        "Cannot modify an immutable list");
  }

  void setRange(int start, int length, List<T> from, [int startFrom = 0]) {
    throw new UnsupportedError(
        "Cannot modify an immutable list");
  }

  void removeRange(int start, int length) {
    throw new UnsupportedError(
        "Cannot remove range of an immutable list");
  }

  void insertRange(int start, int length, [T initialValue = null]) {
    throw new UnsupportedError(
        "Cannot insert range in an immutable list");
  }

  void sort([int compare(T a, T b)]) {
    throw new UnsupportedError(
        "Cannot modify an immutable list");
  }

  void add(T element) {
    throw new UnsupportedError(
        "Cannot add to an immutable list");
  }

  void addLast(T element) {
    add(element);
  }

  void addAll(Collection<T> elements) {
    throw new UnsupportedError(
        "Cannot add to an immutable list");
  }

  void clear() {
    throw new UnsupportedError(
        "Cannot clear an immutable list");
  }

  void set length(int length) {
    throw new UnsupportedError(
        "Cannot change the length of an immutable list");
  }

  T removeLast() {
    throw new UnsupportedError(
        "Cannot remove in a non-extendable list");
  }

  /**
   * Collection interface.
   */

  void forEach(f(T element)) => _wrappedList.forEach(f);

  Collection<T> filter(bool f(T element)) => _wrappedList.filter(f);

  bool every(bool f(T element)) => _wrappedList.every(f);

  bool some(bool f(T element)) => _wrappedList.some(f);

  bool get isEmpty => _wrappedList.isEmpty;
  
  Collection map(f(T element)) {
    throw "not implemented";
  }
  bool contains(T element) => _wrappedList.contains(element);
  dynamic reduce(dynamic initialValue, combine(var previousValue, T element)) => _wrappedList.reduce(initialValue, combine);
  T get first => _wrappedList.first;
  T removeAt(int position) {throw new UnsupportedError("Cannot remove from an immutable list");}
}
