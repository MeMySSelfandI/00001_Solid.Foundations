// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract array {
    
    uint256[] public arr1;                  // empty array
    uint256[] public arr2 = [22, 33, 44];   // array with elements
    uint256[10] public arr3;                // array has no elements but I know how many I am going to save

    // fetches a particular element from the array
    function get(uint _i) public view returns (uint256) {
        return arr2[_i];
    }    

    // fetches the full array
    function getArr() public view returns (uint256[] memory){
        return arr2;
    }

    // places a new element into the array
    function push(uint256 _i) public {
        arr2.push(_i);
    }

    // deletes the last element in the array
    function pop() public  {
        arr2.pop();
    }

    // counts the number of elements in the array
    function getLength() public view returns (uint256) {
        return arr2.length;
    }

    // counts the number of elements in the array
    function remove(uint256 _index) public {
        delete arr2[_index];
    }

}