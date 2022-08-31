// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Events {
    /**
    - It is not possible to access an external server from within a smart contract. 
    - Thus, it is not possible for the EVM to directly notify external applications 
      about the occurrence of some event.

    - That’s why there are events in Solidity. 
    - It is information issued within contracts and has two purposes: recording such data in a log form, 
      and indirectly warning about the occurrence of events on the blockchain. 
    - This can be done because external applications can monitor the emission of events, 
      and thus react to changes in the state of the blockchain.


    - One of the uses of events is to log data into the blockchain, at a much lower cost than using the storage.
    - Currently, the price of changing a variable in storage from zero to non-zero is 20,000 units of gas. 
    - As a comparison, each recorded log costs 375 units of gas, plus 375 units for each indexed topic, 
      plus a lower value for non-indexed parameters (8 units per byte).
    */

    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function testEvent() public {
        emit Log(msg.sender, "Hello World");
        emit Log(msg.sender, "Hello EVM");
        emit AnotherLog();
    }

    /**-----------------Anonymous events-------------------*/

    /**
    - Events may be declared as anonymous. 
    - Thus, the first topic no longer refers to the event signature and can be used freely. 
    - This way, anonymous events can have up to 4 indexed parameters.

    - Anonymous events are declared with the anonymous modifier, 
      which must be placed after the parameter declaration. 

    - Anonymous events, in addition to allowing the use of 4 indexed parameters, 
    also allows recording logs without any indexed parameters. 
    - This is the cheapest way to record information on the blockchain for external access.  
    */

    event NotMe(
        address indexed _to,
        address indexed _from,
        address indexed _spender,
        string indexed _message
    ) anonymous;

    /**  @notice;
    - The developer must understand that the transaction log does not keep information whether 
    the event is anonymous or not. 
    - All that are recorded are the indexed values as topics and the non-indexed values as data. 
    - To correctly interpret the meaning of the topics it is necessary to know the contract code, or its ABI.
     */
}
