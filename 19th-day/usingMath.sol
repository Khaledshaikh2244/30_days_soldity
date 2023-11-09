// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    function add(uint256 a, uint256 b) pure internal returns (uint256) {
        return a + b;
    }
}

contract Addition {
    using Math for uint256;

    function addNumbers(uint256 x, uint256 y) pure public returns (uint256) {
        // Using the add function from the Math library
        return x.add(y);
    }
}
