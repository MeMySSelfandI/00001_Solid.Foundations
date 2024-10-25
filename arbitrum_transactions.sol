// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract arbitrum_transactions {

    /* 
    A sort of purchase made on some portal 
    ▬▬▬▬
    determine the wallet address that creates the contract 
    */
    address payable public owner;

    // Define the structure Data
    struct Data {
        string date;           // shipping date
        string delivery_date;  // estimated arrival date
        string product;        // requested product name
        string price;          // requested product price
        string code;           // ID provider
        string cel_number;     // product purchaser's cellular phone
        int8 status;           // 4 transaction states: [1] on the way, [2] arrived in the country, [3] in customs, [4] delivered.
        address wallet;        // person who executed the contract
    }

    // Declare a public instance of the Data struct
    Data public data;

    // Event to log the creation of new data
    event newData(
        string date,           // shipping date
        string delivery_date,  // estimated arrival date
        string product,        // requested product name
        string price,          // requested product price
        string code,           // ID provider
        string cel_number,     // product purchaser's cellular phone
        int8 status,           // 4 transaction states: [1] on the way, [2] arrived in the country, [3] in customs, [4] delivered.
        address wallet         // person who executed the contract
    );

// modifier so that only the owner can withdraw the funds from the contract
modifier onlyOwner(){
require(msg.sender == owner, "only the owner can withdraw the funds"); _;
}

// modifier that verifies within other functions that when the function is executed it has the value of the fee plus the gas
modifier cost(uint amount){
require(msg.value >= amount, "It does not have a balance in ARB to execute"); _;
}

    // Constructor to set the contract owner
    constructor(){
        owner = payable(msg.sender);  // Sets the owner as the wallet that creates the contract
    }

// Function to change enum data
    function pushData(
        string memory _date,
        string memory _delivery_date,
        string memory _product,
        string memory _price,
        string memory _code,
        string memory _cel_number,
        int8 _status) public payable cost(1000000000000000){

data = Data(_date,
            _delivery_date,
            _product,
            _price,
            _code,
            _cel_number,
            _status,
            msg.sender);

// emit event as a kind of log
emit newData(_date,
             _delivery_date,
             _product,
             _price,
             _code,
             _cel_number,
             _status,
             msg.sender);

}

// function to withdraw funds from the contract
function withdraw() public onlyOwner{
    uint balance = address(this).balance;
    require(balance>0,"There are no funds in the contract yet");
    owner.transfer(balance);
}

// function to query the value found in the contract
function getBalance() public view returns(uint256){
    return address(this).balance;
}

}