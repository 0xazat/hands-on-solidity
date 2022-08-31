// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
You can interact with other contracts by declaring an Interface.

Interface

- cannot have any functions implemented
- can inherit from other interfaces
- all declared functions must be external
- cannot declare a constructor
- cannot declare state variables 
*/

contract Counter {
    uint256 public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint256);

    function increment() external;
}

contract MyContract {
    function increment(address _counter) public {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) public view returns (uint256) {
        return ICounter(_counter).count();
    }
}
