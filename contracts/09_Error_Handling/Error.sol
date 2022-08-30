// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Error {
    /**-----------------require------------------- */

    /**
   require is used to validate inputs and conditions before execution.
   if we want to check whether the balance of an account is greater than a certain amount, 
   we can write the following statement. 
   -  require(balanceOf[account] > 100);
   Thus, if the expression inside the parentheses is false, the transaction will roll back
   There is a more gas-efficient way of sending errors back to the sender. 
   In Solidity there is the possibility to define error objects. Unfortunately, 
   they cannot be used in conjunction with the require function.
   */

    function testRquire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Inputs must be greater than 10");
    }

    /**-----------------revert------------------- */

    /**
   The revert function is used to reverse a transaction at any time during its execution. 
   It is best used in conjunction with custom errors, 
   but for compatibility with earlier versions of the EVM, 
   the revert function can also be used with an argument of type string, 
   whose purpose is to indicate the reason of reversion. 

   if (balanceOf[msg.sender] <= 100) revert("Insufficient Balance");

   In general, using if (!condition) revert(…) and require(condition,…) have the same effect. 
   However, we can use the revert function with custom errors.
   */

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testRevert(uint256 _withdrawAmount) public view {
        uint256 _balance = address(this).balance;
        if (_balance < _withdrawAmount)
            revert InsufficientBalance(_balance, _withdrawAmount);
    }

    /**
   The custom error sent back can be parsed as an object. 
   We can see the result in the figure below, where the error sent is indicated, 
   along with the value of its parameters. 
    
    InsufficientBalance
    Parameters: 
    {
        "balance": {
            "value": 0
        },
        "withdrawAmount": {
            "value": "100"
        }
    }

    - Errors are returned to the sender ABI-encoded, just like functions.
    - One of the advantages of using custom errors is the ability to deserialize the arguments on the client.
   */

    /**-----------------assert------------------- */

    /**
    - Its usage is similar to require, 
    but it is mostly used to make sure that a condition that should be true, is in fact true. 

    - In other words, require is used to check a condition that may or may not be true, 
    depending on the parameters of a function, for example. 

    - Assert is used to make sure that there is nothing wrong in the contract logic, 
    and in case assert finds a true condition, 
    this indicates a possible bug in the contract that must be fixed.

    - While revert sends an error whose type is Error(string), assert sends an error of type Panic(uint256). 
    
    - Unlike require, assert cannot receive a text indicating the reason for the error.
    */

    uint256 public num;

    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check variants.

        // Here we assert that num is always equal to 0
        // Since it is impossible to update the value of num
        assert(num == 0);
    }
}
