// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract BaseContract {
    /**
    Functions and state variables have to declare whether they are accessible by other contracts. 
    There are 4 visibility specifiers for functions and state variables: */

    int256 public x = 10;
    int256 y = 20; // internal by default

    /**-----------------Public------------------- */

    /**  1.Public
    - The function is  part of the contract interface and can be called both internally 
    (from within the same contract) and externally (from other contracts or by EOA(user) accounts);
    - A getter is automatically created for public variables. They can be easily accessed from dApps;  */

    function get_y() public view returns (int256) {
        return y;
    }

    /**-----------------Private------------------- */

    /** 2.Private
    - Private functions and variables are available only in the contract they are defined.
    - This is the default for state variables, they can be accessed only by a getter function; */

    // can be called only within this contract (not within derived contracts)
    function get_x_privately() private view returns (int256) {
        return x;
    }

    function get_x_publicly() public view returns (int256) {
        int256 a;
        a = get_x_privately(); // can call get_x
        return a;
    }

    /**-----------------Internal------------------- */

    /** 3.Internal
    - Functions are accessible only from the contract they are defined in and from derived contracts; */

    // can be called only within this contract and derived ones
    function get_x_internally() internal view returns (int256) {
        return x;
    }

    /**-----------------External------------------- */

    /** 4.External
    - The function is part of the contract interface, can be accessed only from other contracts or 
    by EOA(user) accounts using transactions. It’s automatically public;
    - Not-available for state variables */

    // can be called only from external contracts and application (more efficient than public)
    function get_x_externally() external view returns (int256) {
        return x;
    }

    function get_datas() public view returns (int256) {
        int256 b;
        b = get_x_privately(); // OK => get_x_privately() is private
        b = get_x_internally(); // OK => get_x_internally() is internal
        // b = get_x_externally(); // ERROR => get_x_externally() is external
        return b;
    }
}

/**-----------------Derive------------------ */

contract DerivedContract is BaseContract {
    int256 public xx = get_x_internally(); // can call an internal function
    // int public yy = get_x_privately(); // ERROR => get_x_privately() is private and cannot be called from derived contracts
}

contract TestContract {
    BaseContract public baseContract = new BaseContract(); // TestContract deploys FunctionVisibility
    int256 public xx = baseContract.get_x_externally(); // OK => get_x_externally() is external
    // int public y = baseContract.get_x_privately(); // ERROR => get_x_privately() is private
    // int public yy = baseContract.get_x_internally; // ERROR => get_x_internally() is internal
}
