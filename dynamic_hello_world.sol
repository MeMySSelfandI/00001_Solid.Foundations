// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract dynamic_hello_world {

    string dyn_Greeting = unicode"卐 ► Dynamic Hello World v1 from BOGOTÁ ◄ 卐";
    string public sta_Greeting = unicode"卐 ► Static HW greeting on deployment from BOGOTÁ ◄ 卐";

    function readGreeting() public view returns (string memory) {
        return dyn_Greeting;
    }

    function saveGreeting(string memory _newGreeting) public {
        dyn_Greeting = _newGreeting;
    }

}