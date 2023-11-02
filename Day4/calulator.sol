// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Calculator {
    //Addition 
    function addingNumber (uint256 firstNumb, uint256 secondNumb) public pure returns  (uint256){
        return (firstNumb + secondNumb);
    }

    function subtractOfNumb (uint256 firstNumb, uint256 secondNumb) public pure returns  (uint256){
       require(firstNumb > 0 && secondNumb > 0 , "Number should not be zero or less than zero");
        return (firstNumb - secondNumb);
    }

    
    function diivdingNumber (uint256 firstNumb, uint256 secondNumb) public pure returns  (uint256){
        require(firstNumb > 0 && secondNumb > 0 , "Number should not be zero or less than zero");
        return (firstNumb/secondNumb);
    }
}