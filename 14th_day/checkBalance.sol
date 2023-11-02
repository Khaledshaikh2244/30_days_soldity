// SPDX-License-Identifier: MIT
pragma solidity 0.8;

//function to check balance of given Amount  

contract requestBalanceInfo {
  mapping (address => uint256) public balances;
  
  
  function getBalance (address account) public view returns (uint256) {
        return balances[account];
  }
}