// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract solidity_variables {
    
    /* variable declaration */
    address public block_now;   // current miner address
    uint public block_diff;     // current block difficulty
    uint public block_num;      // current block number
    /* bytes32 public block_hash;  // data type for block hash */
    uint public time_stamp;     // blockchain timestamp
    uint public gas_left;       // gas left
    address public sender;      // address of the person who is calling the contract
    bytes4 public sig_id;       // first 4 bytes of the function call
    uint public gas_limit;      // current block gas limit

    /* querying in the blockchain the variables declared */
    function updateParams() public {
        block_now = block.coinbase;
        block_diff = block.prevrandao;
        block_num = block.number;
        time_stamp = block.timestamp;
        gas_left = gasleft();
        sender = msg.sender;   // a very used var to know who is the contract deployer
        sig_id = msg.sig;
        gas_limit = block.gaslimit;
    }

}
