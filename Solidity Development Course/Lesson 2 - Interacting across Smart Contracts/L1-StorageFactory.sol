//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Let's import the previous smart contract, SimpleStorage, so we can interact with it from this new smart contract.
import {SimpleStorage} from "./L1-SimpleStorage.sol";

// From the import above, this is called a "named import", where the specific contract in the referenced Solidity file
// is the only contract being imported. Multiple contracts can be imported by separating the contract names with commas

// The following new contract, StorageFactory, will deploy/create a simple storage contract
contract StorageFactory {

    // From importing the SimpleStorage contract from the file, it will automatically be available in this smart contract.
    
    // A smart contract can also take upon a struct datatype. Below, the SimpleStorage contract is called, and it will create
    // a new smart contract, within this contract, by the variable called "simpleStorage".

    // The smart contract is initialized, and its visibility is set to public so it can be externally interacted with once
    // the StorageFactory contract is deployed

    SimpleStorage public simpleStorage;

    // In Solidity, best practice includes calling the smart contract, and renaming it as a variable with the first word
    // taking on a lowercase letter.

    // In the function below, a new smart contract, the SimpleStorage contract, will be deployed once executed
    // from the StorageFactory contact.
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

}