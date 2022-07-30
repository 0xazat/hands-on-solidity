// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ViewAndPure {
    uint256 public x = 1;

    /**
    Getter functions can be declared view or pure;

    - View function declares that no state will be changed.

    - Pure function declares that no state variable will be changed or read */

    // Promise not to modify the state, but read state
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}
