// Voting System
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


// Bank Mechanism
contract bankmechanism {
	address public owner;
	mapping(string => uint256) public balances;

	constructor() {
	owner = msg.sender;
	}
	modifier onlyOwner() {
	require(msg.sender == owner, "Only the owner can perform this action");
	_;
	}
	function deposit() external payable {
	balances[msg.sender] += msg.value;
	}
	function withdraw(uint256 amount) external {
	require(amount > 0, "Amount must be greater than 0);
	require(balances[msg.sender] >= amount);

	balances[msg.sender] -= amount;
	payable(msg.sender).transfer(amount);
	}
	function getBalance() external view returns (uint256) {
	return balances[msg.sender];
	}
}

