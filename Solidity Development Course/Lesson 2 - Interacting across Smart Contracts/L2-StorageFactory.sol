// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Create a named import of the SimpleStorage contract from the Solidity file
// The SimpleStorage file is different from the L1-SimpleStorage file, as this lesson does not include the "_name" variable to be stored
import {SimpleStorage} from "./L2-SimpleStorage.sol";

// Create a new smart contract that creates new SimpleStorage smart contracts
contract StorageFactory {

    // Create a new array of SimpleStorage smart contracts. Set the visibility to public
    // so that the array can be viewed when interacting with the StorageFactory smart contract.
    SimpleStorage[] public listOfSimpleStorageContracts;


    // Create a function so new SimpleStorage contracts can be created, and set the visibility
    // to public so the function can be called externally when interacting with the StorageFactory contract.
    function createSimpleStorageContract() public {

        // From the imported smart contract type, a new variable 'newSimpleStorageContract' will be created
        // when the function is called.
        SimpleStorage newSimpleStorageContract = new SimpleStorage();

        // When the function is executed, a new SimpleStorage contract will be added to the array.
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    // Below, we will call one of the SimpleStorage contracts created from within 
    // the StorageFactory contract to interact with.

    // The structure of this function is as described:
    // 1. A new SimpleStorage contract is created, saved in the variable mySimpleStorage
    // 2. The mySimpleStorage contract is called from one of the created contracts when createSimpleStorageContract was executed

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // The command below allows the 'store' function to be called from the SimpleStorage contract of a specific index, 
        // but no information is returned because there is no function that calls the information yet.

        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];

        // From creating a new SimpleStorage contract above, we can access the functions within the SimpleStorage contract.
        // In the command below, we are calling the "store" function, and saving it at the SimpleStorage contract index that would
        // be entered from the argument above
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    // Below, this function retrieves the favorite number from the SimpleStorage contract created 
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();

        // return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve()
    }
}