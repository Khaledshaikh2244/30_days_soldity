// Create a public function named "deposit" to deposit the amount in the contract (Keep this function empty).

// 2. Create a public function named "getbalance" that returns the balance of the smart contract.

// 3. Create a public function named "transfer" to transfer 1 ether from the contract to the sender.


 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mine {
    function deposit() public payable {
        // This function now can receive Ether sent along with the transaction.
    }

    function getbalance() public view returns (uint) {
        return address(this).balance;
    }

    function transfer() public payable {
        payable(msg.sender).transfer(1 ether);
    }
}
