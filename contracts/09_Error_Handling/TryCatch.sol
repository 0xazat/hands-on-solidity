// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract TryCatch {
    /** 
    - The use of try/catch in Solidity is more restricted than in other programming languages. 
    - Try/catch is only used in two conditions: when invoking external calls and when creating new contracts. 
    - In general try/catch is mostly used to invoke functions in other cosntracts, 
    */

    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        foo = new Foo(msg.sender);
    }

    // Example of try / catch with external call
    // tryCatchExternalCall(0) => Log("external call failed")
    // tryCatchExternalCall(1) => Log("my func was called")
    function tryCatchExteranlCall(uint256 _i) public {
        try foo.testFoo(_i) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("external call failed");
        }
    }

    // Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo _foo) {
            // you can use variable foo here
            _foo.testFoo(1);
            emit Log("Foo created");
        } catch Error(string memory reason) {
            // catch failing revert() and require()
            emit Log(reason);
        } catch (bytes memory data) {
            // catch failing assert()
            emit LogBytes(data);
        }
    }
}

contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function testFoo(uint256 x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my function was called";
    }
}
