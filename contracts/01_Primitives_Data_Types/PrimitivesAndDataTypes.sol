// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Primitives {
    /** -----------------------Primtive Data Types-------------------------------*/
    /**
    There are a few different primitive data types;
    boolean
    int
    uint
    address
    */

    bool isHas = true; // Initialized by default with false. boolean takes only 1 byte of storage in Solidity.

    /**
    Solidity provides multiple types to store signed and unsigned integers.
    signed integers types: It uses store positive and negative numbers: int8, int16,.... int256
    unsigned integers types: It uses store positive numbers: uint8, uint16,.... uint256
    */

    /** signed integers
    Int8 — [-128 : 127]
    Int16 — [-32768 : 32767]
    Int32 — [-2147483648 : 2147483647]
    Int64 — [-9223372036854775808 : 9223372036854775807]
    Int128 — [-170141183460469231731687303715884105728 : 170141183460469231731687303715884105727]
    Int256 — [-57896044618658097711785492504343953926634992332820282019728792003956564819968 : 57896044618658097711785492504343953926634992332820282019728792003956564819967]
     */

    /** unsigned integers
    UInt8 — [0 : 255]
    UInt16 — [0 : 65535]
    UInt32 — [0 : 4294967295]
    UInt64 — [0 : 18446744073709551615]
    UInt128 — [0 : 340282366920938463463374607431768211455]
    UInt256 — [0 : 115792089237316195423570985008687907853269984665640564039457584007913129639935]
    */

    int256 number1 = 15; // -2^256 to 2^256 - 1
    uint256 number2 = 55; // 0 to 2^256 - 1

    /** NOTE
    int is alias to int256 and uint is an alias to uint256.
    By default an int is initialized with zero.
    There is no full support for float/double (fixed point numbers) in Solidity
    */

    address addresss = 0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199; // - 20 bytes

    /** -----------------------Bytes & Strings-------------------------------*/

    /**
    - bytes and Strings are special dynamic arrays.
    - String is equal to bytes but does not allow length or index access.
    - A string is UTF-8 encoded in solidity.
    - Bytes and Strings are reference types, not of value types,
    - Pay attention, fixed size arrays use less gas than dynamic arrays. 
    */

    string public firstString = "hello this is a string"; // 32 bytes

    // You can also define arrays of 1–32 bytes using the type bytes2, byte3, up to bytes32
    bytes public b1 = "abc"; // 1 byte but can make larger by specifying
    bytes32 public my32bytes = "abcss";
}
