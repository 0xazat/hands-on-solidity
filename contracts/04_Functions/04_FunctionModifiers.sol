// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract FunctionModifiers {
    /**
    - Function modifiers are used to modify the behaviour of a function. 
    - Modifiers are code that can be run before and / or after a function call.
    - Using function modifiers you avoid redundant-code and possible errors;
    - They are contract properties and are inherited;
    - They don’t return and use only require();
    - They are defined using the modifier keyword; 
    - Modifiers can be used to:
    Restrict access
    Validate inputs
    Guard against reentrancy hack
    */

    address public owner;
    string name = "John Doe";
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function changeName(string memory _newName) public onlyOwner {
        name = _newName;
    }

    // Modifiers can take inputs. This modifier checks that the address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // can use multiple modifiers
    function changeOwner(address _newOwner)
        public
        onlyOwner
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}
