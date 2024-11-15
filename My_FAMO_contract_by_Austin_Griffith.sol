// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "hardhat/console.sol";

contract My_FAMO_contract_by_Austin_Griffith {
    event SetPurpose(address sender, string purpose);
    string public purpose = "Building Unstoppable Apps!!!";
    address public owner = 0x9663CFe87d8c06E861d0D5fcBd358d50988a4b7E;
    constructor() {
        // what should we do on deploy?
    }

    function setPurpose(string memory newPurpose) public {
        purpose = newPurpose;
        console.log(msg.sender,"set purpose to",purpose);
        emit SetPurpose(msg.sender, purpose);
    }
}