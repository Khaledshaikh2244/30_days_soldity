// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//making use of openzeppelin libraray for creating ERC-20 interface
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyToken is IERC20 {
   

    // Function to transfer tokens from one address to another
    function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Transfer to the zero address is not allowed");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }
}

