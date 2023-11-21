// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract timeLocked is AccessControl {
    // Role to authorize withdrawals
    bytes32 public constant ROLE_WITHDRAWER = keccak256("ROLE_WITHDRAWER");

    uint256 public unlockTime;

    constructor(uint256 _unlockTime) {
        unlockTime = _unlockTime;

        // Assign the deployer the WITHDRAWER role
        _setupRole(ROLE_WITHDRAWER, msg.sender);

        // Set the deployer as the admin
        _setRoleAdmin(ROLE_WITHDRAWER, DEFAULT_ADMIN_ROLE);
    }

    function withdrawFunds(address recipient, uint256 amount) public {
        // Checking if the caller is authorized to withdraw funds.
        require(hasRole(ROLE_WITHDRAWER, msg.sender), "Unauthorized withdrawal");

        // Checking if the withdrawal time has elapsed.
        require(block.timestamp >= unlockTime, "Withdrawal time has not elapsed");

        // Checking if the contract has enough funds to withdraw.
        require(address(this).balance >= amount, "Insufficient balance");

        // Transferring the funds to the recipient.
        payable(recipient).transfer(amount);
    }
}