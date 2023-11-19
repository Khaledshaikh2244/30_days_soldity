// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract HashFunction {
    function hash(string  memory _text,
    uint _num,
    address _addr
    ) pure public returns (bytes32 ) {
        return keccak256(abi.encodePacked(_text ,_num ,_addr));
    }

    //Ex of Hash collision
    // hash collison occur when you pass more than one dynamic data type 
    // to abi.encodePacked, in such case we should use abi.encode instead

    function collison(string memory _text ,
                      string memory _anotherText) public pure returns(bytes32){
                        return keccak256(abi.encodePacked(_text , _anotherText));
                      }
}   

//Another Contract 

contract GuessTheMagicWord{
    bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    function guess(string memory _word) public view returns(bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}