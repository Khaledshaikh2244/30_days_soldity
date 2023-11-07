// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract A{
 function myfunction() virtual external returns(uint){
    return 1;
 }
}

contract B is A{
  function myfunction() public pure override returns(uint){
   return 2;
  }
}