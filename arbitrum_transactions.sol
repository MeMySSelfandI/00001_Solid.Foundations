// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract arbitrum_transactions {

    /* 
    A sort of purchase made on some portal by FABIÁN MEDINA ORTEGA
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

    // Constructor to set the contract owner
    constructor() {
        owner = payable(msg.sender);  // Sets the owner as the wallet that creates the contract
    }

    // Function to update data (as an example)
    function updateData(
        string memory _date,
        string memory _delivery_date,
        string memory _product,
        string memory _price,
        string memory _code,
        string memory _cel_number,
        int8 _status
    ) public {
        // Update data
        data = Data({
            date: _date,
            delivery_date: _delivery_date,
            product: _product,
            price: _price,
            code: _code,
            cel_number: _cel_number,
            status: _status,
            wallet: msg.sender  // Set the caller as the wallet
        });

        // Emit event
        emit newData(_date, _delivery_date, _product, _price, _code, _cel_number, _status, msg.sender);
    }

}