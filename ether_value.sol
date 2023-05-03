// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherConverter {
    uint256 public weiValue;
    uint256 public etherValue;
    uint256 public gweiValue;

    function convertEther(uint256 amount) public payable returns (uint256) {
        require(amount > 0, "Amount must be greater than 0");
        require(msg.value >= amount, "Not enough ether sent");

     return   weiValue = amount;
      //return   etherValue = amount / 1 ether;
       //return  gweiValue = amount / 1 gwei;
    }

    fallback() external payable {
        convertEther(msg.value);
    }
    receive() external payable {}

}
