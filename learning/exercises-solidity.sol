// this is where our code goes

// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// creat a contract that can store data and return the data back

// be able to do the following:

// 1. reciev information, 2. store information, 3. retrun the information back

contract simpleStorage {
    // write all the code inside here - functions and its state
    
    uint storeData;

    // set and get

    // public enables visibility so that we can call this outside of the contract itsel

    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns (uint) {
        return storeData;
    }

}

// 1. create a storage contract that sets and gets values - only the value it returns is multipled 5x
contract multipledStorage {
    // write a integer variable
    uint storeData;

    // set data
    function set(uint x) public {
        storeData = x;
    }

    // get the data and returns it multiplied by 5.
    function get() public view returns (uint) {
        return storeData * 5;
    }

}

// 2. create a storage contract that sets and gets values of NAMES
contract nameStorage {
    // write a string variable
    string storeData; 

    // set string data but need use string for memory keyword
    function set(string memory x) public {
        storeData = x;
    }

    // get string data
    function get() public view returns (string memory) {
        return storeData;
    }
}