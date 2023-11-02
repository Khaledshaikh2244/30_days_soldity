// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
   //Modifier is piece of which can be run before and After the Functiom
   //Generally use for 3 reasons 
   //  Restrict Acces , Validate I/P , Guard Agaist Retrancy Attacks

   contract FunctiomModifier {
       address public owner;
       uint public x =10;
       bool public locked;
        

        constructor() {
            owner = msg.sender;
        }

        modifier onlyOwner() {
            require(msg.sender == owner , "Not the Owner ");
            _;
        } 
        modifier validateData(address _addr) {
            require(_addr != address(0), "Not Valid address "); 
            _;
        }

        function changeOwner(address _newOwnwer) public onlyOwner validateData(_newOwnwer){
            owner = _newOwnwer; 
        }
   } 