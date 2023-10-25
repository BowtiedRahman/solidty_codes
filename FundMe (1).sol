//accept funds from the user
//withdraw funds to owner of contract
//send min amount in usd

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract FundMe {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("not owner!!");
        }
        _;
    }

    receive() external payable {}

    function withdraw(uint256 _amount) public onlyOwner {
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        if (!sent) {
            revert("failed transfer");
        }
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
