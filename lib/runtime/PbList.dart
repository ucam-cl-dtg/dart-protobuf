// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

typedef B PartialFunction<A,B>(A a);

class PbList<E> implements List<E> {

  PbList(this._listener)
    : _mutableList = null,
      _immutableList = const [] {
    _wrappedList = _immutableList;
  }

  PbList.from(List from, this._listener)
    : _mutableList = null {
    if (from is PbImmutableList) {
      _immutableList = from;
    } else {
      _immutableList = new PbImmutableList.from(from);
    }
    _wrappedList = _immutableList;
  }

  /**
   * Returns an [Iterator] for the list.
   */
  Iterator<E> get iterator => _wrappedList.iterator;

  /**
   * Returns the element at the given [index] in the list or throws
   * an [IndexOutOfRangeException] if [index] is out of bounds.
   */
  E operator [](int index) => _wrappedList[index];

  /**
   * Sets the entry at the given [index] in the list to [value].
   * Throws an [IndexOutOfRangeException] if [index] is out of bounds.
   */
  void operator []=(int index, E value) {
    _validate(value);
    _ensureMutable();
    _wrappedList[index] = value;
    _modified();
  }

  /**
   * Unsupported -- violated non-null constraint imposed by protobufs.
   *
   * Changes the length of the list. If [newLength] is greater than
   * the current [length], entries are initialized to [:null:]. Throws
   * an [UnsupportedOperationException] if the list is not extendable.
   */
  void set length(int newLength) {
    throw new UnsupportedError("length");
  }

  /**
   * Adds [value] at the end of the list, extending the length by
   * one. Throws an [UnsupportedOperationException] if the list is not
   * extendable.
   */
  void add(E value) {
    _validate(value);
    _ensureMutable();
    _wrappedList.add(value);
    _modified();
  }

  /**
   * Adds [value] at the end of the list, extending the length by
   * one. Throws an [UnsupportedOperationException] if the list is not
   * extendable.
   */
  void addLast(E value) {
    add(value);
  }

  /**
   * Appends all elements of the [collection] to the end of list.
   * Extends the length of the list by the length of [collection].
   * Throws an [UnsupportedOperationException] if the list is not
   * extendable.
   */
  void addAll(Collection<E> collection) {
    collection.forEach((E i){ _validate(i); });
    _ensureMutable();
    _wrappedList.addAll(collection);
    _modified();
  }

  /**
   * Sorts the list according to the order specified by the comparator.
   * The order specified by the comparator must be reflexive,
   * anti-symmetric, and transitive.
   *
   * The comparator function [compare] must take two arguments [a] and [b]
   * and return
   *
   *   an integer strictly less than 0 if a < b,
   *   0 if a = b, and
   *   an integer strictly greater than 0 if a > b.
   */
  void sort([int compare(E a, E b)]) {
    if (compare == null) {
      throw new UnsupportedError("must supply compare function");
    }
    _ensureMutable();
    _wrappedList.sort(compare);
    _modified();
  }

  /**
   * Returns the first index of [element] in this list. Searches this
   * list from index [start] to the length of the list. Returns
   * -1 if [element] is not found.
   */
  int indexOf(E element, [int start = 0]) =>
      _wrappedList.indexOf(element, start);

  /**
   * Returns the last index of [element] in this list. Searches this
   * list from index [start] (inclusive) to 0. Returns -1 if
   * [element] is not found.
   */
  int lastIndexOf(E element, [int start = null]) =>
      _wrappedList.lastIndexOf(element, start);

  /**
   * Removes all elements in the list. The length of the list
   * becomes zero. Throws an [UnsupportedOperationException] if
   * the list is not extendable.
   */
  void clear() {
    _ensureMutable();
    _wrappedList.clear();
    _modified();
  }

  /**
   * Pops and returns the last element of the list.
   * Throws a [UnsupportedOperationException] if the length of the
   * list cannot be changed.
   */
  E removeLast() {
    _ensureMutable();
    PbList.E value = _wrappedList.removeLast();
    _modified();
    return value;
  }

  /**
   * Returns the last element of the list, or throws an out of bounds
   * exception if the list is empty.
   */
  E get last => _wrappedList.last;

  /**
   * Returns a sub list copy of this list, from [start] to
   * [:start + length:].
   * Returns an empty list if [length] is 0.
   * Throws an [ArgumentError] if [length] is negative.
   * Throws an [IndexOutOfRangeException] if [start] or
   * [:start + length:] are out of range.
   */
  List<E> getRange(int start, int length) =>
      _wrappedList.getRange(start, length);

  /**
   * Copies [length] elements of the [from] array, starting
   * from [startFrom], into [:this:], starting at [start].
   * Throws an [UnsupportedOperationException] if the list is
   * not extendable.
   * If [length] is 0, this method does not do anything.
   * Throws an [ArgumentError] if [length] is negative.
   * Throws an [IndexOutOfRangeException] if [start] or
   * [:start + length:] are out of range for [:this:], or if
   * [startFrom] is out of range for [from].
   */
  void setRange(int start, int length, List<E> from, [int startFrom = 0]) {
    from.getRange(startFrom, length).forEach((E i){ return _validate(i); });
    _ensureMutable();
    _wrappedList.setRange(start, length, from, startFrom);
    _modified();
  }

  /**
   * Removes the range in the list starting from [start] to
   * [:start + length:].
   * Throws an [UnsupportedOperationException] if the list is
   * not extendable.
   * If [length] is 0, this method does not do anything.
   * Throws an [ArgumentError] if [length] is negative.
   * Throws an [IndexOutOfRangeException] if [start] or
   * [:start + length:] are out of range.
   */
  void removeRange(int start, int length) {
    _ensureMutable();
    _wrappedList.removeRange(start, length);
    _modified();
  }

  /**
   * UNSUPPORTED. Not of clear value.
   *
   * Inserts a new range in the list, starting from [start] to
   * [:start + length:]. The entries are filled with [initialValue].
   * Throws an [UnsupportedOperationException] if the list is
   * not extendable.
   * If [length] is 0, this method does not do anything.
   * If [start] is the length of the array, this method inserts the
   * range at the end of the array.
   * Throws an [ArgumentError] if [length] is negative.
   * Throws an [IndexOutOfRangeException] if [start] or
   * [:start + length:] are out of range.
   */
  void insertRange(int start, int length, [E initialValue]) {
    throw new UnsupportedError("insertRange");
  }

  /**
   * Applies the function [f] to each element of this collection.
   */
  void forEach(void f(E element)) => _wrappedList.forEach(f);

  /**
   * Returns a new collection with the elements of this collection
   * that satisfy the predicate [f].
   *
   * An element satisfies the predicate [f] if [:f(element):]
   * returns true.
   */
  Collection<E> where(bool f(E element)) => _wrappedList.where(f);

  /**
   * Returns true if every elements of this collection satisify the
   * predicate [f]. Returns false otherwise.
   */
  bool every(bool f(E element)) => _wrappedList.every(f);

  /**
   * Returns true if one element of this collection satisfies the
   * predicate [f]. Returns false otherwise.
   */
  bool any(bool f(E element)) => _wrappedList.any(f);

  /**
   * Returns true if there is no element in this collection.
   */
  bool get isEmpty => _wrappedList.isEmpty;

  /**
   * Returns the number of elements in this collection.
   */
  int get length => _wrappedList.length;

  /*
   * Return immutable copy of the list.
   */
  List<E> asImmutable([PartialFunction<E, E> transform = null]) {
    if (_immutableList == null) {
      if (transform == null) {
        _immutableList = new PbImmutableList.from(_mutableList);
      } else {
        List<E> tempList = new List(_mutableList.length);
        int i = 0;
        for (E e in _mutableList) {
          tempList[i] = transform(e);
          i++;
        }
        _immutableList = new PbImmutableList.from(tempList);
      }
      _wrappedList = _immutableList;
      _mutableList = null;
    }
    return _immutableList;
  }

  void _validate(E val) {
    if (val == null) {
      throw new ArgumentError();
    }
    // Note: the generic parameter [E] is not preserved by the dart2js compiler.
    // For this reason, in that context both `val is E` and `val is! E` return
    // true. We write this condition as `!(val isE)` so that the check is done
    // at least on the dartvm.
    // TODO(rice,sigmund): remove this trick.
    if (!(val is E)) {
      throw new ArgumentError(
          "Value ($val) is not of the correct type");
    }
  }

  void _ensureMutable() {
    if (_mutableList == null) {
      _mutableList = new List.from(_immutableList);
      _wrappedList = _mutableList;
      _immutableList = null;
    }
  }

  void _modified() {
    // clear local cache of _immutableList
    if (_listener != null) _listener.onChanged();
  }

  Collection mappedBy(f(E element)) {
    throw new UnimplementedError();
  }

  ChangeListener _listener;
  List<E> _mutableList;
  List<E> _immutableList;
  List<E> _wrappedList;

  bool contains(E element) => _wrappedList.contains(element);
  dynamic reduce(dynamic initialValue, combine(var previousValue, E element)) => _wrappedList.reduce(initialValue, combine);
  E get first => _wrappedList.first;
  void remove(E object) {
    _ensureMutable();
    _wrappedList.remove(object);
    _modified();
  }
  E removeAt(int index) {
    _ensureMutable();
    E value = _wrappedList.removeAt(index);
    _modified();
    return value;
  }
  void removeAll(Iterable<E> all){
    _ensureMutable();
   _wrappedList.removeAll(all);
    _modified();
  }
  void retainAll(Iterable<E> all){
    _ensureMutable();
   _wrappedList.retainAll(all);
    _modified();
  }
  void retainMatching(bool test(E)){
    _ensureMutable();
   _wrappedList.retainMatching(test);
    _modified();
  }
  void removeMatching(bool test(E)){
    _ensureMutable();
   _wrappedList.removeMatching(test);
    _modified();
  }
  E get single => _wrappedList.single;
  String join([separator]) => _wrappedList.join(separator);
  List<E> toList() => _wrappedList.toList();
  Set<E> toSet() => _wrappedList.toSet();
  E min([int compare(E,E)]) => _wrappedList.min(compare);
  E max([int compare(E,E)]) => _wrappedList.max(compare);
  Iterable<E> take(int n) => _wrappedList.take(n);
  Iterable<E> takeWhile(bool f(T)) => _wrappedList.takeWhile(f);
  Iterable<E> skip(int n) => _wrappedList.skip(n);
  Iterable<E> skipWhile(bool f(E)) => _wrappedList.skipWhile(f);
  E firstMatching(bool test(E), {E orElse()}) => _wrappedList.firstMatching(test, orElse: orElse);
  E lastMatching(bool test(E), {E orElse()}) => _wrappedList.lastMatching(test, orElse: orElse);
  E singleMatching(bool test(E)) => _wrappedList.singleMatching(test);
  E elementAt(int n) => _wrappedList.elementAt(n);
}

/**
 * A [PbList] that requires its elements to be [int]s in the range
 * [:-2^31, 2^31 - 1:].
 */
class PbSint32List extends PbList<int> {

  PbSint32List(ChangeListener listener) : super(listener);

  void _validate(int val) {
    super._validate(val);
    if (val < _Constants.MIN_SINT32 || val > _Constants.MAX_SINT32) {
      throw new ArgumentError("Illegal to add value (${val}): out "
          "of range for int32");
    }
  }
}

/**
 * A [PbList] that requires its elements to be [int]s in the range
 * [:0, 2^32 - 1:].
 */
class PbUint32List extends PbList<int> {

  PbUint32List(ChangeListener listener) : super(listener);

  void _validate(int val) {
    super._validate(val);
    if (val < 0 || val > _Constants.MAX_UINT32) {
      throw new ArgumentError("Illegal to add value (${val}):"
          " out of range for uint32");
    }
  }
}

/**
 * A [PbList] that requires its elements to be [int]s in the range
 * [:2^-63, 2^63 - 1:] or instances of [Packed64].
 */
//class PbSint64List extends PbList<Dynamic> {
class PbSint64List extends PbList {
  PbSint64List(ChangeListener listener) : super(listener);

  void _validate(int val) {
    super._validate(val);
    if (val is Packed64) {
      return;
    } else if ((val is num) && (val.floor() == val)) {
      if (val < _Constants.MIN_SINT64 || val > _Constants.MAX_SINT64) {
         throw new ArgumentError("Illegal to add value (${val}):"
             " out of range for sint64");
      }
    } else {
      throw new ArgumentError("Value is not int or Packed64");
    }
  }
}

/**
 * A [PbList] that requires its elements to be [int]s in the range
 * [:0, 2^64 - 1:] or instances of [Packed64].
 */
//class PbUint64List extends PbList<Dynamic> {
class PbUint64List extends PbList {
  PbUint64List(ChangeListener listener) : super(listener);

  void _validate(int val) {
    super._validate(val);
    if (val is Packed64) {
      return;
    } else if ((val is num) && (val.floor() == val)) {
      if (val < 0 || val > _Constants.MAX_UINT64) {
        throw new ArgumentError("Illegal to add value (${val}):"
            " out of range for uint64");
      }
    } else {
      throw new ArgumentError("Value is not int or Packed64");
    }
  }
}

/**
 * A [PbList] that requires its elements to be [double]s in the range
 * [:-3.4E38, 3.4E38:], i.e., with the IEEE single-precision range.
 */
class PbFloatList extends PbList<double> {

  PbFloatList(ChangeListener listener) : super(listener);

  void _validate(double val) {
    super._validate(val);
    if (val < -_Constants.MAX_FLOAT || val > _Constants.MAX_FLOAT) {
      throw new ArgumentError("Illegal to add value (${val}):"
          " out of range for float");
    }
  }
}
