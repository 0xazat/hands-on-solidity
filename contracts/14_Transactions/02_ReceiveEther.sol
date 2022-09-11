// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/** 
   How to receive Ether?
   A contract receiving Ether must have at least one of the functions below
   - receive() external payable
   - fallback() external payable
  receive() is called if msg.data is empty, otherwise fallback() is called.
*/

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
*/

    // Function to receive Ether. msg.data must be empty.
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
