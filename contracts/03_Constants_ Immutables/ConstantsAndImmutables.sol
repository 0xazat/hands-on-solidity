// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ConstantsAndImmutables {
    /**-----------------Constants------------------- */
    /**
    Constants 
      - They are variables that cannot be modified.
      - Their value is hard coded and using constants can save gas cost. 
      */
    address public constant MY_CONSTANT_ADDRESS =
        0x14dC79964da2C08b23698B3D3cc7Ca32193d9955;
    uint256 public constant MY__CONSTANT_UINT = 1234;

    /**-----------------Immutables------------------- */
    /**
    Immutables
      - Immutables variables are like constants. 
      - Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
    */

    address public immutable MY_IMMUTABLE_ADDRESS;
    uint256 public immutable MY_IMMUTABLE_UINT;

    constructor(uint256 _myUint) {
        MY_IMMUTABLE_ADDRESS = msg.sender;
        MY_IMMUTABLE_UINT = _myUint;
    }

    /** NOTE
    NOT: Compared to regular state variables, 
    the gas costs of constant and immutable variables are much lower. 
    And This allows for local optimization.
     */
}
