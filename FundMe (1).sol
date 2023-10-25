//accept funds from the user
//withdraw funds to owner of contract
//send min amount in usd

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract FundMe {
    
    address private s_owner;
  

    constructor() {
        s_owner = msg.sender;
    }

    modifier onlyOwner() {
       if(msg.sender != s_owner) {
        revert("not owner!!");
       }
        _;
    }
    function fund() public payable  {
    }

    function withdraw(uint _amount) public onlyOwner() {
        if(_amount > address(this).balance) {
            revert("insufficient funds");
        }
        (bool sent,) = payable(msg.sender).call{value: _amount}("");
        if(!sent){
            revert("failed transfer");
        }
    }   

    function balance() public view returns (uint256) {
        return address(this).balance;
    }  

    function getOwner() public view  returns(address) {
        return s_owner;
    }
}