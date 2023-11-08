// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Create a math library
library Math {
    // Function to add two numbers
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

// Create a contract that uses the Math library
contract Addition {
    // Import the Math library
    using Math for uint256;

    // Function to add two numbers using the Math library
    function addNumbers(uint256 x, uint256 y) public pure returns (uint256) {
        return x.add(y); // Using the Math library's add function
    }
}
