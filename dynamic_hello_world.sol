// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract dynamic_hello_world {

    string dyn_Greeting = unicode"卐 ► Dynamic Hello World ◄ 卐";
    string public sta_Greeting = unicode"卐 ► Initial greeting on deployment ◄ 卐";

    function readGreeting() public view returns (string memory) {
        return dyn_Greeting;
    }

    function saveGreeting(string memory _newGreeting) public {
        dyn_Greeting = _newGreeting;
    }

}