// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Variables {
    /**
    There are 3 types of variables in Solidity;

    - state
      declared at contract level
      stored on the blockchain

    - local
     declared inside a function
     not stored on the blockchain permanently

    - global 
    (provides information about the blockchain) 
    */

    /**-----------------State------------------- */

    string public location = "Berlin";
    uint256 price;
    address ownerAddress = 0xdD2FD4581271e230360230F9337D5c0430Bf44C0;

    /**-----------------Local------------------- */

    function doSomething(string memory _location, uint256 _price) public {
        location = _location;
        price = _price;
        /* 
        The memory keyword is required because explicit data location for 
        all variables of type array, string, struct, or mapping is now mandatory. 
        It indicates that the variables will be stored in memory and not in storage.
        Memory keyword can’t be used at contract level
        */
    }

    /**-----------------Global------------------- */

    uint256 timestamp = block.timestamp; // Current block timestamp
    address sender = msg.sender; // address of the caller

    /**
    msg -> contains information about the account that generates the transaction and about the transaction or call, as well.
    - msg.sender -> account address that creates and sends the transaction.
    - msg.value -> ETH value (represented in wei) sent to this contract. 
    - msg.data -> data field in the transaction or call that called the function.
    - this -> the current contract, explicitly convertible to Address. (address)
    - this.balance returns the contract balance.
    - gasleft() -> returns the remaining gas.
    - block.timestamp -> returns the total running seconds since the Unix Epoch.
    - block.number
    - block.difficulty
    - block.gaslimit
    - tx.gasprice -> gas price of the transaction 
    */
}
