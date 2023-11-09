// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Election is Ownable {
    struct Candidate {
        string name;
        uint256 index;
        uint256 voteCount;
    }

    struct Voter {
        string name;
        uint256 index;
        bool voted;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => Voter) public voters;

    constructor() {
        // Add candidate 1
        candidates[1] = Candidate("Rahul", 1, 0);

        // Add candidate 2
        candidates[2] = Candidate("Priya", 2, 0);
    }

    function vote(string memory voterName, uint256 candidateIndex) public {
        // Check if the voter has already voted
        require(!voters[msg.sender].voted, "Voter has already voted");

        // Check if the candidate index is valid
        require(candidateIndex > 0 && candidateIndex <= 2, "Invalid candidate index");

        // Record that the voter has voted
        voters[msg.sender] = Voter({
            name: voterName,
            index: candidateIndex,
            voted: true
        });

        // Increment the vote count for the selected candidate
        candidates[candidateIndex].voteCount++;
    }

    function getWinner() public onlyOwner returns (uint256) {
        // Determine the winner based on the vote count
        uint256 winnerIndex;
        uint256 maxVotes = 0;

        for (uint256 i = 1; i <= 2; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        return winnerIndex;
    }
}
