// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// The contract allows only its creator to create new coins (different issuance schemes are possible).
// Anyone can send coins to each other without a need for registering with a username and password, all you need is an Ethereum keypair.
contract Coin {
    // the keyword public it's making the variables
    // here accessible from other contracts
    address public minter;
    mapping(address => uint) public balances;

    // Event allow client to react to specific
    // contract changes you declare
    /*
    Event is an inheritable member of a contract An event is emitted, it stores the arguments passed in transaction logs.
    These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
    */
    event Sent(address from, address to, uint amount);

    // construcrtor only runs when we deploy contract
    constructor() {
        minter = msg.sender;
    }

    // make new coins and send them to an address
    // only the owner can send these coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide infomation about
    // why an operation failed. They are returned
    // to the caller of the function.
    error insufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender]) 
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        emit Sent(msg.sender, receiver, amount);
    }
}