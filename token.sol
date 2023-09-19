// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
// 0x1EFEcb61A2f80Aa34d3b9218B564a64D05946290

contract Token_Managment {

    // Public Token Variables 
    string public tokenName;
    uint public totalSupply;
    string public tokenSymbol;
    mapping(address => uint) public balances;

    // Constructor to initialize the contract with token details
    constructor(string memory name, string memory symbol, uint initialSupply) {
        tokenName = name;
        tokenSymbol = symbol;
        totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }

    // Mint to add more tokens
    function mint(address receiver, uint amount) public {
        // Give Tokens To the Reciver
        balances[receiver] = balances[receiver] + amount;
        totalSupply = totalSupply + amount;     
    }

    // Burn to remove tokens
    function burn(address sender, uint amount) public {
        // Checking if the address has those coins
        require(balances[sender] >= amount, "Not Enough Tokens");
        // Destroying if the condition is true
        balances[sender] = balances[sender] - amount;
        totalSupply = totalSupply - amount;       
    }
}