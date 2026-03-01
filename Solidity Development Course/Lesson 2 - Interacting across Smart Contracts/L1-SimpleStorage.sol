// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Create a new smart contract
contract SimpleStorage {

    // Create a new struct to save the name of a person, and their favorite number
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Create a new dynamic array to store newly created persons into a list
    Person[] public People;

    // Create a new mapping so we can locate a favorite number by entering the persons name
    // This is a public mapping so we can read from it, declared by adding public after mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    // Create a new function to save a person to the dynamic array, People. Set the visibility to public
    // so the smart contract can be interacted with after it is deployed
    function store(uint256 _favoriteNumber, string memory _name) public {
        // Add a new person to the people array with the array's inherent .push() function
        People.push(Person(_favoriteNumber, _name));

        // The mapping is referenced by the key (square brackets for index) of the name to their favorite number
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}