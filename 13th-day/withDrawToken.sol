
// SPDX-License-Identifier: MIT

pragma solidity 0.8;


contract WithDrawToken  {
   address public owner;
   uint256 public balance;
   
   constructor () {
   owner  == msg.sender;
   }
   
   modifier onlyOwner() {
    require(msg.sender == owner , "only can call Function");
    _;
   }
   
   
   function deposit () public payable {
    balance += msg.value;
   }
   
   function withdrawToken(uint256 amount) public onlyOwner {
    require(amount <= balance , "insuffficient balance in wallet !");
    balance -= amount;
    payable(owner).transfer(amount);
   }
}


>>>>>>> e3c628364c522f24e983d39163b8e5e41d61cc04
