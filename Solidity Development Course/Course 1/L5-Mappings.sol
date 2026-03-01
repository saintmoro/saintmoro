// SPDX-License-Identifier: MIT

// Mapping - Recalling values saved in a smart contract
// ---------------------------

// Mapping can be considered as a dictionary, and can directly find the value associated with the key

pragma solidity 0.8.19;

contract SimpleStorage {
    // Creating a new type, "Person"
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Create a new dynamic array by declaring the type, the visibility, and the variable name:
    Person[] public People;

    // Create a new mapping to associate every name with a favorite number. Only the types are declared,
    // and the variables they are referenced by will be passed within the function.

    // Set the visibility so that the mapping can be called when externally interacting with the smart contract
    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People.push(Person(_favoriteNumber, _name));

        // Below, the mapping variable "nameToFavoriteNumber" takes the index key of "name", and returns their favorite number.
        // mappingName[index] = value

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}