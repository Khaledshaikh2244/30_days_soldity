// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract  solidityVariacles {
    
    uint256  storedData; // this is State variable
    
    function accesingVariable (uint _storedData) public  returns (uint256) {
    
        storedData = _storedData; // local Variable 
        return _storedData;
    }
}