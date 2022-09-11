// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/** 
    How to send Ether?
    You can send Ether to other contracts by
    - transfer (2300 gas, throws error)
    - send (2300 gas, returns bool)
    - call (forward all gas or set gas, returns bool)
*/

/** Note
  Which method should you use?
  call in combination with re-entrancy guard is the recommended method to use after December 2019.
  Guard against re-entrancy by
  - making all state changes before calling other contracts
  - using re-entrancy guard modifier
 */

contract SendEther {
    function sendEtherViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
