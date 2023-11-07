// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mine {
    modifier cost() {
        require(msg.value >= 2 ether, "Insufficient funds sent");
        _;
    }

    function modifier_func() public payable cost returns (bool) {
        return true;
    }
}
