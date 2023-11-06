//  Create a function named public_func of public visibility that returns value 1

// 2. Create a function named priavte_func of internal visibility that returns value 2

// 3. Create a function named internal_func of internal visibility that returns value 3

// 4. Create a function named external_func of external visibility that returns value 4

// 5.   Create a public function named check_private to call the private_fun and store the return value in a variable and return it

// 6.   Create a public function named check_internal to call the internal_fun and store the return value in a variable and return it


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract TestContract {
    function public_func() public pure returns (uint) {
        return 1;
    }

    function private_func() internal pure returns (uint) {
        return 2;
    }

    function internal_func() internal pure returns (uint) {
        return 3;
    }

    function external_func() external pure returns (uint) {
        return 4;
    }

    function check_private() public pure returns (uint) {
        uint x = private_func();
        return x;
    }

    function check_internal() public pure returns (uint) {
        uint y = internal_func();
        return y;
    }
}
