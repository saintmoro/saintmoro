// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Create a new smart contract
contract SimpleStorage {

    // Create a new struct variable of a favorite number
    struct FavoriteNumbers {
        uint256 FavoriteNumber;
    }

    uint256 myFavoriteNumber;

    // Create a new dynamic array to store newly created persons into a list
    FavoriteNumbers[] public Numbers;

    // Create a new function to save a person to the dynamic array, People. Set the visibility to public
    // so the smart contract can be interacted with after it is deployed.

        function store(uint256 _favoriteNumber) public virtual{
        // Add a new person to the people array with the array's inherent .push() function
        Numbers.push(FavoriteNumbers(_favoriteNumber));
    }

    // The "virtual" keyword is added because it will be inherited and overriden in L3-Inheritance
}