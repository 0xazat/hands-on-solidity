// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Mapping {
    /*
    - Maps are created with the syntax mapping(kyType => valueType)
    - The keyType can be built-in type, bytes, string, or any contract.
    - valuType can be any type including another mapping or any array.
    - Mappings are not iterable.
    */

    // Mapping from address to uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        return myMap[_addr];
    }

    function set(address _addr, uint256 _value) public {
        // Update the value at this address
        myMap[_addr] = _value;
    }

    function remove(address _addr) public {
        // Reset the value to the default value
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint256 => bool)) public nestedMap;

    function get(address _addr, uint256 _value) public view returns (bool) {
        return nestedMap[_addr][_value];
    }

    function set(
        address _addr,
        uint256 _value,
        bool _boo
    ) public {
        nestedMap[_addr][_value] = _boo;
    }

    function remove(address _addr, uint256 _value) public {
        delete nestedMap[_addr][_value];
    }
}
