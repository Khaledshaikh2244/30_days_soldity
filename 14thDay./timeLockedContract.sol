function withdrawFunds(address recipient, uint256 amount) public {
  // Checking  if the caller is authorized to withdraw funds.
  require(hasRole(ROLE_WITHDRAWER, msg.sender), "Unauthorized withdrawal");

  // Checking  if the withdrawal time has elapsed.
  require(block.timestamp >= unlockTime, "Withdrawal time has not elapsed");

  // Checking  if the contract has enough funds to withdraw.
  require(address(this).balance >= amount, "Insufficient balance");

  // Transfering the funds to the recipient.
  recipient.transfer(amount);
}
