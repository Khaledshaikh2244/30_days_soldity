// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;



 contract newreferencing {
     uint[4]  public myArray = [10,20,30,40];


     //referencing the stateVAr through the 'storage' keyword
     function referencingArray() public {
          uint[4]  storage changeArray  = myArray;
          changeArray[0]=90;
     }

     function memArray () public view {
         uint[4] memory mArraych = myArray;
         mArraych[2] = 50;
     }

  
 }