// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract GasGolf {
// amount of gas will be used 
//start => 50908 gas
//when using Calldata => 49163 gas 
//loading state variables to memory =>  48952 gas 
//short circuit => 48634
// loop increments => 48244
// cache array length - 48209 gas
// load array elements to memory - 48047 gas
// uncheck i overflow/underflow - 47309 gas


uint public total;


    // start - not gas optimized
    // function sumIfEvenAndLessThan99(uint[] memory nums) external {
    //     for (uint i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if (isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

// gas optimized
    // [1, 2, 3, 4, 5, 100]

    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;

        for(uint i  = 0; i < len;) {
            uint num = nums[i];

            if(num % 2 == 0 && num < 99) {
                _total += num ;

            }

            unchecked {
                 ++i;
            }
        }

        total = _total;
    }
}