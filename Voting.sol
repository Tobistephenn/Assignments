//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract votingsystem {
	address public owner;
	mapping(string => uint256) public votes
	
	constructor(){
	owner = msg.sender;
 	}
	modifier onlyOwner(){
 	require(msg.sender == owner, "only the owner can perform this action");
	_;
 	}
	function voteForCandidate(string memory candidate) external {
 	require(bytes(candidate).length > 0, "candidate name must not be empty)";
	votes[candidate]++;
	}
 	function getVotesForCandidate(string memory candidate) external view returns (uint256){
 	return votes[candidate];
 	}
}
