//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Will {
    address owner;
    uint256 fortune;
    bool deceased;

    constructor() payable {
        owner = msg.sender; // msg sender represents address being called
        fortune = msg.value; //msg value tells us how much ether is being sent
        deceased = false;
    }

    // create modifier so the only person who can call the contract is the owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // only allocate funds if friend's gramps is deceased

    modifier mustBeDeceased() {
        require(deceased == true);
        _;
    }

    // list of family wallets
    address payable[] familyWallets;

    // map through inheritance
    mapping(address => uint256) inheritance;

    // set inheritance for each address
    function payout() private mustBeDeceased {
        for (uint256 i = 0; i < familyWallets.length; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
            // transferring funds from contract address to reciever address
        }
    }

    // oracle switch
    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }
}
