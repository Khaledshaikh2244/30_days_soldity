// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;


contract NFTCount {
    uint public numberOfNft;

    function TotalNFT () public view returns(uint) {
        return numberOfNft;
    }


    function addNFT () public {
        numberOfNft += 1;
    }

    function DeleteNFT ()  public {
        numberOfNft -= 1;
    }
}