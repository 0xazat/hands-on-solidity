// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Gas {
    /**-----------------Ether & Wei------------------- */
    // Transactions are paid with ether.
    // 1 wei = 1
    // 1 gwei = 10^9
    // 1 ether = 10^18

    uint256 public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint256 public oneGwei = 1 gwei;
    // 1 gwei is equal to 10^9 wei
    bool public isOneGwei = 1 gwei == 1e9;

    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;

    /**-----------------Gas------------------- */
    /**
    You pay gas spent * gas price amount of ether, where;
     - gas is a unit of computation
     - gas spent is the total amount of gas used in a transaction
     - gas price is how much ether you are willing to pay per gas

    Transactions with higher gas price have higher priority to be included in a block.

    Unspent gas will be refunded.

 */
}
