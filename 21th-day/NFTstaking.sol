// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTStaking is ERC721, Ownable {
    IERC20 public stakingToken;
    uint256 public stakingDuration; // in seconds
    uint256 public stakingReward; // reward per second

    uint256 public lastStakingTime;
    uint256 public totalStaked;

    mapping(uint256 => uint256) public stakedBalances;

    constructor(
        string memory _name,
        string memory _symbol,
        address _stakingToken,
        uint256 _stakingDuration,
        uint256 _stakingReward
    ) ERC721(_name, _symbol) {
        stakingToken = IERC20(_stakingToken);
        stakingDuration = _stakingDuration;
        stakingReward = _stakingReward;
    }

    function stake(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner");
        require(stakedBalances[tokenId] == 0, "Token already staked");
        require(stakingToken.balanceOf(msg.sender) > 0, "Insufficient staking tokens");

        // Transfer staking tokens to this contract
        stakingToken.transferFrom(msg.sender, address(this), 1);

        // Update staking details
        stakedBalances[tokenId] = 1;
        totalStaked++;
        lastStakingTime = block.timestamp;
    }

    function unstake(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner");
        require(stakedBalances[tokenId] == 1, "Token not staked");

        // Calculate reward
        uint256 reward = calculateReward(tokenId);
        
        // Transfer staking tokens and reward to the owner
        stakingToken.transfer(msg.sender, 1 + reward);

        // Update staking details
        stakedBalances[tokenId] = 0;
        totalStaked--;
    }

    function calculateReward(uint256 tokenId) public view returns (uint256) {
        if (stakedBalances[tokenId] == 0) {
            return 0;
        }

        uint256 elapsedTime = block.timestamp - lastStakingTime;
        return elapsedTime * stakingReward;
    }
}
