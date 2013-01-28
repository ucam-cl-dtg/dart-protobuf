// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of protobuf;

class _Constants {
  static final int MIN_SINT32 = -2147483648;
  static final int MAX_SINT32 =  2147483647;
  static final int MAX_UINT32 =  4294967295;
  static final int MIN_SINT64 = -9223372036854775808;
  static final int MAX_SINT64 =  9223372036854775807;
  static final int MAX_UINT64 =  18446744073709551615;
  static final double MIN_FLOAT_DENORM = 1.401298464324817E-45;
  static final double MAX_FLOAT = 3.4028234663852886E38;

  static final int POWER_64_INT = 18446744073709551616;
  static final int POWER_63_INT = 9223372036854775808;
  static final int POWER_32_INT = 4294967296;
  static final int POWER_31_INT = 2147483648;
  static final int POWER_25_INT = 33554432;
  // use literal to avoid browser issues
  static final int MAX_BITS_32 = 0xffffffff;
  static final int MAX_BITS_64 = (1 << 64) - 1;
  static final int MAX_BITS_8 = (1 << 8) - 1;
  static final int MAX_BITS_7 = (1 << 7) - 1;
  static final int MIN_BITS_8 = (1 << 7);
  static final int OCTET_BIT_COUNT = 8;
  static final int SEPTET_BIT_COUNT = 7;
  static final int BYTES_IN_32_BITS = 4;
  static final int BYTES_IN_64_BITS = 8;
  static final List<int> trueBytes = const [0x01];
  static final List<int> falseBytes = const [0x00];

  // 2^512, 2^-512
  static final double POWER_512 = 1.3407807929942597E154;
  static final double POWER_MINUS_512 = 7.458340731200207E-155;
  // 2^256, 2^-256
  static final double POWER_256 = 1.157920892373162E77;
  static final double POWER_MINUS_256 = 8.636168555094445E-78;
  // 2^128, 2^-128
  static final double POWER_128 = 3.4028236692093846E38;
  static final double POWER_MINUS_128 = 2.9387358770557188E-39;
  // 2^64, 2^-64
  static final double POWER_64 = 18446744073709551616.0;
  static final double POWER_MINUS_64 = 5.421010862427522E-20;
  // 2^52, 2^-52
  static final double POWER_52 = 4503599627370496.0;
  static final double POWER_MINUS_52 = 2.220446049250313E-16;
  // 2^32, 2^-32
  static final double POWER_32 = 4294967296.0;
  static final double POWER_MINUS_32 = 2.3283064365386963E-10;
  // 2^31
  static final double POWER_31 = 2147483648.0;
  // 2^20, 2^-20
  static final double POWER_20 = 1048576.0;
  static final double POWER_MINUS_20 = 9.5367431640625E-7;
  // 2^16, 2^-16
  static final double POWER_16 = 65536.0;
  static final double POWER_MINUS_16 = 0.0000152587890625;
  // 2^8, 2^-8
  static final double POWER_8 = 256.0;
  static final double POWER_MINUS_8 = 0.00390625;
  // 2^4, 2^-4
  static final double POWER_4 = 16.0;
  static final double POWER_MINUS_4 = 0.0625;
  // 2^2, 2^-2
  static final double POWER_2 = 4.0;
  static final double POWER_MINUS_2 = 0.25;
  // 2^1, 2^-1
  static final double POWER_1 = 2.0;
  static final double POWER_MINUS_1 = 0.5;
  // 2^-149 (smallest single non-denorm)
  static final double POWER_MINUS_149 = 1.401298464324817E-45;
  // 2^-1022 (smallest double non-denorm)
  static final double POWER_MINUS_1022 = 2.2250738585072014E-308;

  static final List<double> powers = [
    POWER_512, POWER_256, POWER_128, POWER_64, POWER_32, POWER_16, POWER_8,
    POWER_4, POWER_2, POWER_1
  ];

  static final List<double> invPowers = [
    POWER_MINUS_512, POWER_MINUS_256, POWER_MINUS_128, POWER_MINUS_64,
    POWER_MINUS_32, POWER_MINUS_16, POWER_MINUS_8, POWER_MINUS_4, POWER_MINUS_2,
    POWER_MINUS_1
  ];
}

/**
 * An unsigned 64-bit number, stored internally as two unsigned 32-bit numbers.
 */
class Packed64 {

  int64 _packed;

  // Determine whether the platform supports ints greater than 2^53
  // without loss of precision.
  static bool _haveBigIntsCached = null;

  static bool get _haveBigInts {
    if (_haveBigIntsCached == null) {
      int x = 9007199254740992;
      // Defeat compile-time constant folding.
      if (2 + 2 != 4) {
        x = 0;
      }
      int y = x + 1;
      bool same = y == x;
      _haveBigIntsCached = !same;
    }
    return _haveBigIntsCached;
  }

  static final bool _allowSoftInts = true;

  bool get _softInts =>
      (null != _haveBigIntsCached && _haveBigIntsCached) ||
      (null != _allowSoftInts && _allowSoftInts);

  /**
   * Constructs a [Packed64] instance with given high and low 32-bit words.
   * Throws [:ArgumentError:] if either the [lo] or [hi] int is
   * outside the range of a signed 32-bit INT.
   */
  Packed64(int hi, int lo) {
    if (hi < -_Constants.POWER_32_INT || hi >= _Constants.POWER_32_INT) {
      throw new ArgumentError("Hi value out of range: $hi");
    }
    if (lo < -_Constants.POWER_32_INT || lo >= _Constants.POWER_32_INT) {
      throw new ArgumentError("Lo value out of range: $lo");
    }
    _packed = new int64.fromInts(hi, lo);
  }

  /**
   * Constructs a [Packed64] instance from a list of byte values, LSB first.
   */
  Packed64.fromBytes(List<int> b) {
    _packed = new int64.fromBytes(b);
  }

  /**
   * Constructs a [Packed64] instance that will have the bit pattern of the
   * given [double] value.  All [:NaN:] values are converted to a canonical
   * bit pattern.
   */
  factory Packed64.fromDouble(double d) {
    if (d.isNaN) {
      return new Packed64(0x7ff80000, 0x0);
    }

    bool negative = false;
    if (d.isNegative) {
      negative = true;
      d = -d;
    }
    if (d == 0.0) {
      if (negative) {
        return new Packed64(_Constants.POWER_31_INT, 0x0);
      } else {
        return new Packed64(0x0, 0x0);
      }
    }
    if (d.isInfinite) {
      if (negative) {
        return new Packed64(0xfff00000, 0x0);
      } else {
        return new Packed64(0x7ff00000, 0x0);
      }
    }

    int exp = 0;

    // Scale d by powers of 2 into the range [1.0, 2.0)
    // If the exponent would go below -1023, scale into (0.0, 1.0) instead
    if (d < 1.0) {
      int bit = 512;
      for (int i = 0; i < 10; i++, bit >>= 1) {
        if (d < _Constants.invPowers[i] && exp - bit >= -1023) {
          d *= _Constants.powers[i];
          exp -= bit;
        }
      }
      // Force into [1.0, 2.0) range
      if (d < 1.0 && exp - 1 >= -1023) {
        d *= 2.0;
        exp--;
      }
    } else if (d >= 2.0) {
      int bit = 512;
      for (int i = 0; i < 10; i++, bit >>= 1) {
        if (d >= _Constants.powers[i]) {
          d *= _Constants.invPowers[i];
          exp += bit;
        }
      }
    }

    if (exp > -1023) {
      // Remove significand of non-denormalized mantissa
      d -= 1.0;
    } else {
      // Insert 0 bit as significand of denormalized mantissa
      d *= 0.5;
    }

    // Extract high 20 bits of mantissa
    int ihi = (d * _Constants.POWER_20).toInt();

    // Extract low 32 bits of mantissa
    d -= ihi * _Constants.POWER_MINUS_20;
    int ilo = (d * _Constants.POWER_52).toInt();

    // Exponent bits
    ihi |= (exp + 1023) << 20;
    // Sign bit
    if (negative) {
      ihi += _Constants.POWER_31_INT;
    }

    return new Packed64(ihi, ilo);
  }

  void _orShifted(int bits, int shift) {
    _packed |= new int64.fromInt(bits) << shift;
  }

  /**
   * Constructs a [Packed64] instance from a variable-length representation.
   * Throws an [:ArgumentError:] if the encoding is invalid.
   */
  Packed64.fromVarintBytes(List<int> b) {
    try {
      _packed = int64.ZERO;
      int i = 0;
      bool lastByte = ((b[i] & _Constants.MIN_BITS_8) == 0);
      while (i < 10 && !lastByte) {
        _orShifted(b[i] & _Constants.MAX_BITS_7,
            _Constants.SEPTET_BIT_COUNT * i);
        i++;
        lastByte = (b[i] & _Constants.MIN_BITS_8) == 0;
      }
      _orShifted(b[i] & _Constants.MAX_BITS_7,
          _Constants.SEPTET_BIT_COUNT * i);
    } on RangeError catch (e) {
      throw new ArgumentError("Invalid Encoding");
    }
  }

  /**
   * Constructs a [Packed64] instance whose value is equivalent to the given
   * value. Throws an [:ArgumentError:] if the value is &lt;
   * -9223372036854775808 (MIN_SINT64) or &gt; 18446744073709551615
   * (MAZ_UINT64).
   */
  Packed64.fromInt(int x) {
    if (x < -9223372036854775808 || x > 18446744073709551615) {
      throw new ArgumentError("Out of range: $x");
    }
    _packed = new int64.fromInt(x);
  }

  /**
   * Compares this [Packed64] with a given [Packed64] or [int] value.
   */
  bool operator ==(var other) {
    if (other is num) {
      return this.toInt() == new Packed64.fromInt(other);
    }
    if (other is !Packed64) {
      return false;
    }
    return other._packed == _packed;
  }


  int get hashCode {
    return _packed.hashCode;
  }


  /**
   * Returns the 32 high bits of this [Packed64] value as an unsigned integer
   * in the range [0, 2^31 - 1].
   */
  int get hi => ((_packed >> 32) & 0xffffffff).toInt();

  /**
   * Returns the 32 low bits of this [Packed64] value as an unsigned integer
   * in the range [0, 2^31 - 1].
   */
  int get lo => (_packed & 0xffffffff).toInt();

  /**
   * Decodes this [Packed64] from the zig-zag representation
   * [:(n << 1) ^ (n >> 63):].
   */
  Packed64 decodeZigZag() {
    int ihi = this.hi;
    int ilo = this.lo;

    int sign = ilo % 2;
    ilo = ((ihi % 2 == 1) ? _Constants.POWER_31_INT : 0) + (ilo ~/ 2);
    ihi = ihi ~/ 2;
    if (sign == 1) {
      ihi = _bitFlip(ihi);
      ilo = _bitFlip(ilo);
    }
    Packed64 result = new Packed64(ihi, ilo);
    return result;
  }

  static int _bitFlip(int x) => _Constants.MAX_BITS_32 - x;

  /**
   * Encodes this [Packed64] in the zig-zag representation
   * [:(n << 1) ^ (n >> 63):].
   */
  Packed64 encodeZigZag() {
    int ihi = hi;
    int ilo = lo;
    bool negative = ihi >= _Constants.POWER_31_INT;
    ihi = ihi * 2 + (ilo >= _Constants.POWER_31_INT ? 1 : 0);
    ilo = ilo * 2;
    if (ihi >= _Constants.POWER_32_INT) {
      ihi -= _Constants.POWER_32_INT;
    }
    if (ilo >= _Constants.POWER_32_INT) {
      ilo -= _Constants.POWER_32_INT;
    }
    if (negative) {
      ihi = _bitFlip(ihi);
      ilo = _bitFlip(ilo);
    }
    return new Packed64(ihi, ilo);
  }

  /**
   * Returns [true] if this [Packed64] can safely be converted to a signed
   * integer in the range [-2^51, 2^51 - 1].
   */
  bool isSafeAsInt() {
    if (_haveBigInts) {
      return true;
    } else {
      int top = (hi >> 20) & 0xfff;
      return top == 0x0 || top == 0xfff;
    }
  }

  /**
   * Returns [true] if this [Packed64] can safely be converted to an unsigned
   * integer in the range [0, 2^52 - 1].
   */
  bool isSafeAsUint() {
    if (_haveBigInts) {
      return true;
    } else {
      int top = (hi >> 20) & 0xfff;
      return top == 0x0;
    }
  }

  /**
   * Return the number of bytes required to encdode this [Packed64] using
   * the variable-length representation.
   */
  int sizeOfVarint() {
    int ihi = this.hi;
    int ilo = this.lo;

    int i = 0;
    while (i < 10) {
      ilo = ((ihi % 128) * _Constants.POWER_25_INT) + (ilo ~/ 128);
      ihi ~/= 128;
      i++;
      if (ihi == 0 && ilo == 0) {
        return i;
      }
    }
    return i;
  }

  /**
   * Return this [Packed64] as a list of 8 ints, LSB first.
   */
  List<int> toBytes() => _packed.toBytes();

  /**
   * Return this [Packed64] interpreted as an IEEE double-precision value.
   */
  double toDouble() {
    int ihi = this.hi;
    int ilo = this.lo;
    if (ihi < 0) {
      ihi += _Constants.POWER_32_INT;
    }
    if (ilo < 0) {
      ilo += _Constants.POWER_32_INT;
    }

    bool negative = (ihi & _Constants.POWER_31_INT) != 0;
    int exp = (ihi >> 20) & 0x7ff;
    ihi &= 0xfffff; // remove sign bit and exponent

    if (exp == 0x0) {
      double d = (ihi * _Constants.POWER_MINUS_20) +
          (ilo * _Constants.POWER_MINUS_52);
      d *= _Constants.POWER_MINUS_1022;
      return negative ? (d == 0.0 ? -0.0 : -d) : d;
    } else if (exp == 0x7ff) {
      if (ihi == 0 && ilo == 0) {
        return negative ? double.NEGATIVE_INFINITY : double.INFINITY;
      } else {
        return double.NAN;
      }
    }

    // Normalize exponent
    exp -= 1023;

    double d = 1.0 + (ihi * _Constants.POWER_MINUS_20) +
        (ilo * _Constants.POWER_MINUS_52);
    if (exp > 0) {
      int bit = 512;
      for (int i = 0; i < 10; i++, bit >>= 1) {
        if (exp >= bit) {
          d *= _Constants.powers[i];
          exp -= bit;
        }
      }
    } else if (exp < 0) {
      while (exp < 0) {
        int bit = 512;
        for (int i = 0; i < 10; i++, bit >>= 1) {
          if (exp <= -bit) {
            d *= _Constants.invPowers[i];
            exp += bit;
          }
        }
      }
    }
    return negative ? -d : d;
  }

  /**
   * Return the value of this [Packed64] as an int if the resulting value
   * is in the legal range of [-2^51, 2^51 -1], otherwise throw an
   * ArgumentError.
   */
  int toInt() => _packed.toInt();

  /**
   * Return the value of this [Packed64] as an int if the resulting value
   * is in the legal range of [-2^51, 2^51 -1], otherwise return [this].
   */
  toIntIfSafe() {
    if (_softInts && this.isSafeAsInt()) {
      return this.toInt();
    }
    return this;
  }

  /**
   * Return the value of this [Packed64] as an int if the resulting value
   * is in the legal range of [0, 2^52 -1], otherwise throw an
   * ArgumentError.
   */
  int toUint() {
    if (!isSafeAsUint()) {
      throw new ArgumentError("Out of range");
    }
    int value = this.hi * _Constants.POWER_32_INT + this.lo;
    return value;
  }

  /**
   * Return the value of this [Packed64] as an int if the resulting value
   * is in the legal range of [0, 2^52 -1], otherwise return [this].
   */
  toUintIfSafe() {
    if (_softInts && this.isSafeAsUint()) {
      return this.toUint();
    }
    return this;
  }

  /**
   * Return a list of up to 10 ints encoding this [Packed64] using a
   * variable-length representation.
   */
  List<int> toVarintBytes() {
    int ihi = this.hi;
    int ilo = this.lo;

    List<int> b = [];
    int i = 0;
    while (true) {
      i++;
      if ((ihi != 0 || ilo >= 128) && i < 10) {
        int v = 128 + (ilo % 128);
        b.add(v);
      } else {
        int v = ilo % 128;
        b.add(v);
        break;
      }
      ilo = ((ihi % 128) * 33554432) + (ilo ~/ 128);
      ihi ~/= 128;
    }
    return b;
  }

  /**
   * Return a String useful for debugging.
   */
  String toDebugString() {
    return "Packed64[0x${hi.toRadixString(16)},0x${lo.toRadixString(16)}]";
  }

  /**
   * Return a String in decimal representation.
   */
  String toString() {
    return _packed.toString();
  }
}

/*
 * Provides conversion utilities from dart types to/from protocol buffer wire
 * format.
 */
class PbCodec {
  static bool toBool(List<int> b) => b[0] != 0;

  static int toFixed32(List<int> b) => packedToUint32(bytesToPacked(b));

  // return value may be an int or a Packed64
  static toFixed64(List<int> b) => int64ToUint64(bytesToPacked64(b));

  static int toInt32(List<int> b) => packedToInt32(varintBytesToPacked(b));

  // return value may be an int or a Packed64
  static toInt64(List<int> b) =>
      int64ToSigned(varintBytesToPacked64(b));

  static int toSfixed32(List<int> b) => packedToInt32(bytesToPacked(b));

  // return value may be an int or a Packed64
  static toSfixed64(List<int> b) => bytesToPacked64(b);

  static int toSint32(List<int> b) => packedToSint32(varintBytesToPacked(b));

  // return value may be an int or a Packed64
  static toSint64(List<int> b) =>
      int64ToSint64(varintBytesToPacked64(b));

  static int toUint32(List<int> b) => packedToUint32(varintBytesToPacked(b));

  // return value may be an int or a Packed64
  static toUint64(List<int> b) =>
      int64ToUint64(varintBytesToPacked64(b));

  static double toFloat(List<int> b) => packedToFloat(bytesToPacked(b));

  static double toDouble(List<int> b) => int64ToDouble(bytesToPacked64(b));

  static List<int> boolToBytes(bool value) =>
      value ? _Constants.trueBytes : _Constants.falseBytes;

  static List<int> fixed32ToBytes(int value) =>
      packed32ToBytes(uint32ToPacked(value));

  // value may be an int or a Packed64
  static List<int> fixed64ToBytes(var value) => packed64ToBytes(value);

  static List<int> int32ToBytes(int value) =>
      packedToVarintBytes(int32ToPacked(value));

  // value may be an int or a Packed64
  static List<int> int64ToBytes(var value) =>
    int64ToVarintBytes(value);

  static List<int> sfixed32ToBytes(int value) =>
      packed32ToBytes(int32ToPacked(value));

  // value may be an int or a Packed64
  static List<int> sfixed64ToBytes(var value) =>
      packed64ToBytes(value);

  static List<int> sint32ToBytes(int value) =>
      packedToVarintBytes(sint32ToPacked(value));

  // value may be an int or a Packed64
  static List<int> sint64ToBytes(var value) =>
      int64ToVarintBytes(sint64ToPacked64(value));

  static List<int> uint32ToBytes(int value) =>
      packedToVarintBytes(uint32ToPacked(value));

  // value may be an int or a Packed64
  static List<int> uint64ToBytes(var value) =>
      int64ToVarintBytes(uint64ToPacked64(value));

  static List<int> floatToBytes(double value) =>
      packed32ToBytes(floatToPacked(value));

  static List<int> doubleToBytes(double value) =>
      packed64ToBytes(doubleToPacked64(value));

  static final int sizeOfBool = 1;

  static int sizeOfFixed32 = _Constants.BYTES_IN_32_BITS;

  static int sizeOfFixed64 = _Constants.BYTES_IN_64_BITS;

  static int sizeOfSfixed32 = _Constants.BYTES_IN_32_BITS;

  static int sizeOfSfixed64 = _Constants.BYTES_IN_64_BITS;

  static int sizeOfInt32(int value) => value < 0 ? 5 : sizeOfVarint(value);

  // value may be an int or a Packed64
  static int sizeOfInt64(var value) {
    if (value is Packed64) {
       return value.sizeOfVarint();
    } else if (value is num) {
      if (value < 0) {
        return 10;
      } else {
        return sizeOfVarint64(new Packed64.fromInt(value.toInt()));
      }
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static int sizeOfSint32(int value) => sizeOfVarint(encodeZigZag32(value));

  // value may be an int or a Packed64
  static int sizeOfSint64(var value) => sizeOfVarint64(encodeZigZag64(value));

  static int sizeOfUint32(int value) => sizeOfVarint(value);

  // value may be an int or a Packed64
  static int sizeOfUint64(var value) => sizeOfVarint64(value);

  static int sizeOfVarint(int value) {
    int i = 0;
    while (i < 10) {
      value >>= _Constants.SEPTET_BIT_COUNT;
      i++;
      if (value == 0) return i;
    }
    return i;
  }

  // value may be an int or a Packed64
  static int sizeOfVarint64(var value) {
    if (value is Packed64) {
      return value.sizeOfVarint();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).sizeOfVarint();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static int int32ToPacked(int value) {
    if (value < 0) {
      return _Constants.POWER_32_INT + value;
    }
    return value;
  }

  static int sint32ToPacked(int value) => encodeZigZag32(value);

  // value and return may be an int or a Packed64
  static sint64ToPacked64(var value) => encodeZigZag64(value);

  static int uint32ToPacked(int value) => value;

  // value and return may be an int or a Packed64
  static uint64ToPacked64(var value) => value;

  static int packedToInt32(int packed) {
    if (packed >= _Constants.POWER_32_INT) {
      packed &= _Constants.MAX_BITS_32;
    }
    if (packed < 0 || ((packed & _Constants.POWER_31_INT) == 0)) {
      return packed;
    } else {
      return packed - _Constants.POWER_32_INT;
    }
  }

  static int packedToSint32(int packed) => decodeZigZag32(packed);

  static int packedToUint32(int packed) => packed;

  // value and return may be an int or a Packed64
  static int64ToSint64(var packed) => decodeZigZag64(packed);

  // value and return may be an int or a Packed64
  static int64ToUint64(var packed) {
    if (packed is Packed64) {
      return packed;
    } else if (packed < 0) {
      return _Constants.POWER_64_INT + packed;
    } else {
      return packed;
    }
  }

  // value and return may be an int or a Packed64
  static int64ToSigned(var packed) {
    if (packed is Packed64) {
      return packed;
    } else if (packed >= _Constants.POWER_63_INT) {
      return packed - _Constants.POWER_64_INT;
    } else {
      return packed;
    }
  }

  static int bytesToPacked(List<int> b) {
    int result = 0;
    int factor = 1;
    for (int i = 0; i < b.length && i < _Constants.BYTES_IN_64_BITS;
        i++, factor *= 256) {
      result += (b[i] & _Constants.MAX_BITS_8) * factor;
    }
    return result;
  }

  static bytesToPacked64(List<int> b) =>
      new Packed64.fromBytes(b).toIntIfSafe();

  static int _unsigned(int x) => x < 0 ? x + _Constants.POWER_32_INT : x;

  static int varintBytesToPacked(List<int> b) {
    try {
      int result = 0;
      int i = 0;
      bool lastByte = ((b[i] & _Constants.MIN_BITS_8) == 0);
      while (i < 10 && !lastByte) {
        result |= (((b[i] & _Constants.MAX_BITS_7) <<
            (_Constants.SEPTET_BIT_COUNT * i)));
        i++;
        lastByte = (b[i] & _Constants.MIN_BITS_8) == 0;
      }
      result |= (b[i] & _Constants.MAX_BITS_7) <<
          (_Constants.SEPTET_BIT_COUNT * i);
      return _unsigned(result);
    } on RangeError catch ( e) {
      throw new ArgumentError("Invalid Encoding");
    }
  }

  static varintBytesToPacked64(List<int> b) =>
     new Packed64.fromVarintBytes(b).toUintIfSafe();

  static List<int> packed32ToBytes(int value) {
    List<int> b = new List(4);
    for (int i = 0; i < 4; i++) {
      if (value == 0) {
        while (i < 4) {
          b[i] = 0;
          i++;
        }
      } else {
        b[i] = value & _Constants.MAX_BITS_8;
        value >>= _Constants.OCTET_BIT_COUNT;
      }
    }
    return b;
  }

  // value may be an int or a Packed64
  static List<int> packed64ToBytes(var value) {
    if (value is Packed64) {
      return value.toBytes();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).toBytes();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static List<int> packedToVarintBytes(int value) {
    List<int> b = [];
    int i = 0;
    while (true) {
      i++;
      int nextVal = value ~/ 128;
      if (nextVal != 0 && i < 10) {
        int v = 128 + (value % 128);
        b.add(v);
      } else {
        int v = value % 128;
        b.add(v);
        break;
      }
      value = nextVal;
    }
    return b;
  }

  static List<int> int64ToVarintBytes(var value) {
    if (value is Packed64) {
      return value.toVarintBytes();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).toVarintBytes();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static int encodeZigZag32(int value) {
    if (value < 0) {
      return -(value * 2) - 1;
    } else {
      return value * 2;
    }
  }

  // value and return may be an int or a Packed64
  static encodeZigZag64(var value) {
    if (value is Packed64) {
      return value.encodeZigZag().toUintIfSafe();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).encodeZigZag().toUint();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static int decodeZigZag32(int value) {
    if ((value & 0x1) == 0) {
      return value ~/ 2;
    } else {
      value = (value - 1) ~/ 2;
      if (value < _Constants.POWER_32_INT) {
        return -value - 1;
      } else {
        return value;
      }
    }
  }

  // value and return may be an int or a Packed64
  static decodeZigZag64(var value) {
    if (value is Packed64) {
      return value.decodeZigZag().toIntIfSafe();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).decodeZigZag().toIntIfSafe();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  // value may be an int or a Packed64
  static double int64ToDouble(var value) {
    if (value is Packed64) {
      return value.toDouble();
    } else if (value is num) {
      return new Packed64.fromInt(value.toInt()).toDouble();
    } else {
      throw new ArgumentError("Expected Packed64 or int");
    }
  }

  static double packedToFloat(int packed) {
    bool negative = (packed & _Constants.POWER_31_INT) != 0;
    int exp = (packed >> 23) & 0xff;
    packed &= 0x7fffff;

    if (exp == 0x0) {
      // Handle +/- 0 here, denorms below
      if (packed == 0) {
        return negative ? -0.0 : 0.0;
      }
    } else if (exp == 0xff) {
      // Inf & NaN
      if (packed == 0) {
        return negative ? double.NEGATIVE_INFINITY : double.INFINITY;
      } else {
        return double.NAN;
      }
    }

    // Build the bits of a 64-bit double from the incoming bits
    int ihi = negative ? _Constants.POWER_31_INT : 0x0;
    int ilo = 0x0;
    if (exp == 0) {
      // Input is denormalized, renormalize by shifting left until there is a
      // leading 1
      exp = 897;
      while ((packed & 0x800000) == 0) {
        packed <<= 1;
        exp--;
      }
      packed &= 0x7fffff;
      ihi |= exp << 20;
      ihi |= packed >> 3;
      ilo = (packed & 0x7) << 29;
    } else {
      // Normalized number, rebias exponent and shift mantissa into place
      ihi |= (exp + 896) << 20;
      ihi |= packed >> 3;
      ilo = (packed & 0x7) << 29;
    }
    return int64ToDouble(new Packed64(ihi, ilo));
  }

  /**
   * Return the 32-bit IEEE single-precision representation that represents
   * the value [d] truncated to 23 fractional bits.
   */
  static int floatToPacked(double d) {
    // Return a canonical NaN since we have no way to detect anything else
    if (d.isNaN) {
      return 0x7fc00000;
    }

    bool negative = false;
    if (d.isNegative) {
      negative = true;
      d = -d;
    }
    // Numbers below min float map to 0.0
    if (d < _Constants.MIN_FLOAT_DENORM) {
      return negative ? _Constants.POWER_31_INT : 0x0;
    }
    // Numbers above max float map to Infinity
    if (d.isInfinite || d > _Constants.MAX_FLOAT) {
      return negative ? 0xff800000 : 0x7f800000;
    }

    // Obtain the 64-bit representation and extract its exponent and
    // mantissa.
    var packed = doubleToPacked64(d);
    int exp, mantissa;
    if (packed is Packed64) {
      Packed64 packed64 = packed;
      exp = ((packed64.hi >> 20) & 0x7ff) - 1023;
      mantissa = ((packed64.hi & 0xfffff) << 3) | ((packed64.lo >> 29) & 0x7);
    } else if (packed is num) {
      int ipacked = packed.toInt();
      exp = ((ipacked >> 52) & 0x7ff) - 1023;
      mantissa = (ipacked & 0xfffffffffffff) >> 29;
    }

    // If the number will be a denorm in the float representation
    // (i.e., its exponent is -127 or smaller), add a leading 1 to the
    // mantissa and shift it right to maintain an exponent of -127.
    if (exp <= -127) {
      mantissa = (0x800000 | mantissa) >> (-127 - exp + 1);
      exp = -127;
    }

    // Construct the 32-bit representation
    int packed32 = negative ? _Constants.POWER_31_INT : 0x0;
    packed32 |= (exp + 127) << 23;
    packed32 |= mantissa;
    if (packed32 < 0) {
      packed32 += _Constants.POWER_32_INT;
    }
    return packed32;
  }

  static doubleToPacked64(double d) {
    Packed64 packed = new Packed64.fromDouble(d);
    if (packed.isSafeAsUint()) {
      return packed.toUint();
    }
    return packed;
  }

  // JSON

  // ('0' + x) or ('a' + x - 10)
  static int _hexDigit(int x) => x < 10 ? 48 + x : 87 + x;

  // Escape a string to be suitable as a JSON value
  static String escapeString(String x) {
    List<int> chars = x.charCodes;
    List<int> output = new List<int>();
    for (int i = 0; i < chars.length; i++) {
      int c = chars[i];
      // Escape control characters, double-quote, and backslash
      if (c < 32) { // control characters
        output.add(92); // '\'
        switch (c) {
        case 8: // backspace
          output.add(98); // 'b'
          break;
        case 9: // tab
          output.add(116); // 't'
          break;
        case 10: // newline
          output.add(110); // 'n'
          break;
        case 12: // formfeed
          output.add(102); // 'f'
          break;
        case 13: // carriage return
          output.add(114); // 'r'
          break;
        default:
          output.add(117); // 'u'
          output.add(_hexDigit((c >> 12) & 0xf));
          output.add(_hexDigit((c >> 8) & 0xf));
          output.add(_hexDigit((c >> 4) & 0xf));
          output.add(_hexDigit(c & 0xf));
          break;
        }
      } else if (c == 34 || c == 92) { // double-quote or backslash
        output.add(92); // '\'
        output.add(c);
      } else {
        output.add(c);
      }
    }
    return new String.fromCharCodes(output);
  }
}

// TODO - make this a separate library
class Base64Codec {

  // MIME Base64 characters plus padding char '=' (RFC 2045)
  static final String MIME_ALPHABET =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

  static Base64Codec _defaultInstance = null;

  static Base64Codec get defaultInstance {
    if (_defaultInstance == null) {
      _defaultInstance = new Base64Codec();
    }
    return _defaultInstance;
  }

  List<int> _base64Chars = null;
  List<int> _base64InverseChars = null;
  int _padding;

  Base64Codec({String alphabet: null}) {
    assert(alphabet == null || alphabet.length == 65);
    if (alphabet == null) {
      alphabet = MIME_ALPHABET;
    }
    _initTables(alphabet);
  }

  void _initTables(String alphabet) {
    _base64Chars = alphabet.charCodes;
    _base64InverseChars = new List<int>(128);
    // Use -1 to indicate an illegal character
    for (int i = 0; i < 128; i++) {
      _base64InverseChars[i] = -1;
    }
    for (int i = 0; i < 64; i++) {
      _base64InverseChars[_base64Chars[i]] = i;
    }
    // The padding character is interpreted as 0
    _padding = alphabet.charCodeAt(64);
    _base64InverseChars[_padding] = 0;
  }

  int _base64Inverse(int x) {
    // Look at 7 low bits only
    int result = _base64InverseChars[x & 0x7f];
    if (result == -1) {
      throw new ArgumentError("Unknown character code: ${x & 0x7f}");
    }
    return result;
  }

  List<int> decodeAsList(String s) {
    int olen = 3 * (s.length ~/ 4);
    // Inspect the last two characters of the input for padding
    for (int i = Math.max(0, s.length - 2); i < s.length; i++) {
      if (s.charCodeAt(i) == _padding) {
        --olen;
      }
    }

    int iidx = 0;
    int oidx = 0;
    List<int> data = createIntArray(olen);
    int lastStartIndex = s.length - 3;
    while (iidx < lastStartIndex) {
      int c0 = _base64Inverse(s.charCodeAt(iidx++));
      int c1 = _base64Inverse(s.charCodeAt(iidx++));
      int c2 = _base64Inverse(s.charCodeAt(iidx++));
      int c3 = _base64Inverse(s.charCodeAt(iidx++));
      int c24 = (c0 << 18) | (c1 << 12) | (c2 << 6) | c3;

      data[oidx++] = (c24 >> 16) & 0xff;
      if (oidx == olen) {
        break;
      }
      data[oidx++] = (c24 >> 8) & 0xff;
      if (oidx == olen) {
        break;
      }
      data[oidx++] = c24 & 0xff;
    }

    return data;
  }

  String decode(String s) => new String.fromCharCodes(decodeAsList(s));

  // Encode a String as a Base64 string.  Only the low 8 bits of each
  // character code are used.
  String encodeList(List<int> x, [bool pad = true]) {
    int idx = 0;
    int bytesLeft = x.length;
    List<int> data = new List<int>();
    while (bytesLeft > 0) {
      // Concatenate up to 3 input characters into a 24-bit chunk
      int b0 = x[idx++] & 0xff;
      int b1 = (bytesLeft > 1) ? x[idx++] & 0xff : 0;
      int b2 = (bytesLeft > 2) ? x[idx++] & 0xff : 0;
      int b24 = (b0 << 16) | (b1 << 8) | b2;

      // Extract 4 6-bit chunks
      int c0 = (b24 >> 18) & 0x3f;
      int c1 = (b24 >> 12) & 0x3f;
      int c2 = (b24 >> 6) & 0x3f;
      int c3 = b24 & 0x3f;

      // Ouput 4 characters, padding unused bits with "="
      data.add(_base64Chars[c0]);
      data.add(_base64Chars[c1]);
      if (bytesLeft > 1 || pad) {
        data.add(bytesLeft > 1 ? _base64Chars[c2] : _padding);
      }
      if (bytesLeft > 2 || pad) {
        data.add(bytesLeft > 2 ? _base64Chars[c3] : _padding);
      }
      bytesLeft -= 3;
    }
    return new String.fromCharCodes(data);
  }

  String encode(String s, [bool pad = true]) => encodeList(s.charCodes, pad);
}
