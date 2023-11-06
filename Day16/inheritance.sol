// Task
// 1. Create two contracts contract "A" and contract "B".

// 2. Define one public uint variable "a" in contract " A"

// 3. Define a constructor in contract "A" which accepts a variable of type uint named "a_".

// 4. Extend contract "B" with contract "A" and pass the value 1 to the constructor of contract A

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;


contract A {
uint public a;

constructor(uint a_){
   a = a_;
}
}

contract B is A(1){
 
}

