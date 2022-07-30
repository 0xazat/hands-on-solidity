// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Functions {
    /**
    To write or update a state variable you need to send a transaction.
    On the other hand, you can read state variables, for free, without any transaction fee. 
    */

    // declaring state variables saved in contract's storage

    string public ticket;
    uint256 ticketPrice; // by default is private

    // can be initialized at declaration or in the constructor only
    address public immutable owner;

    // declaring the constructor
    // is executed only once at contract's deployment
    constructor(string memory _ticket, uint256 _ticketPrice) {
        ticket = _ticket;
        ticketPrice = _ticketPrice;
        owner = msg.sender; // initializing owner to the account's address that deploys the contract
    }

    // getter function, returns a state variable
    // a function declared `view` does not alter the blockchain
    function getPrice() public view returns (uint256) {
        return ticketPrice;
    }

    // setter function, sets a state variable
    function setPrice(uint256 _ticketPrice) public {
        ticketPrice = _ticketPrice;
    }

    function setTicket(string memory _ticket) public {
        //string types must be declared memory or storage
        ticket = _ticket;
    }
}
