// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./L3-SimpleStorage.sol";

// When the keyword "is" is written after the new contract name, it will directly inherit 
// all properties and functionality of the referenced smart contract
contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns(string memory) {
        return("Say Hello!");
    }

    // This function is directly inherited from the parent function, SimpleStorage. Because this function will override
    // the original functionalities of SimpleStorage, a specific keyword, "override" needs to be added after the visibility
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    } 
}