//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract AddressWallets {
    address payable[] investorWallets;

    mapping(address => uint256) investors;

    function payInvestors(address payable wallet, uint256 amount) public {
        investorWallets.push(wallet);
        investors[wallet] = amount;
    }

    function checkInvestors() public view returns (uint256) {
        return investorWallets.length;
    }
}
