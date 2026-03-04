// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Create a named import of the SimpleStorage contract from the Solidity file
import {SimpleStorage} from "./L1-SimpleStorage.sol";

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

    // The function below will interact from within the SimpleStorage contract

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Below, we will call one of the SimpleStorage contracts created from within 
        // the StorageFactory contract to interact with.

        // The structure of this function is as described:
        // 1. A new SimpleStorage contract is created, saved in the variable mySimpleStorage
        // 2. The mySimpleStorage contract is called from one of the created contracts when createSimpleStorageContract was executed

        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

        // From creating a new SimpleStorage contract above, we can access the functions within the SimpleStorage contract.
        // The command below allows the 'store' function to be called, but no information is returned because there is no
        // function that calls the information yet

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}


// When interacting with functions of an imported smart contarct, the smart contract address, 
// and the ABI, or function selector are both needed.

// ABI - Application Binary Interface
// The ABI tells the code how exactly the smart contract can interact with another contract