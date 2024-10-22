// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract solidity_native_variables {

    // only the person who initialized the contract can access this variable
    string private fullName;

    constructor(string memory _lastName) {
        fullName = string.concat("My name is:", " ", _lastName);
    }

    function getName() public view returns (string memory){
        return fullName;
    }

    /* uint unsigned integers (non-negative)
    uint8 range from 0 to 2*10^(8-1)
    uint16 range from 0 to 2*10^(16-1) */    

    uint8 public uint_8 = 1;
    uint16 public uint_16 = 123; 

    // it allows me to store numbers with negative sign
    int8 public int_8 = -1;

    // address like this one is in fact, an address
    address public my_address = 0x9663CFe87d8c06E861d0D5fcBd358d50988a4b7E;

}
