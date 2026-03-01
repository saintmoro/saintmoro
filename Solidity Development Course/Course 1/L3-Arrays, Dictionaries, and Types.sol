// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleListStorage {

    // Initialize the variable with no value assigned
    uint256 favoriteNumber;

    // To create an array in Solidity, add square brackets after the type, such as below:
    uint256[] listOfFavoriteNumbers;

    // Creating a new 'type' in Solidity (similar to class) can be constructed by typing 'struct' 
    // before the type name, for example:

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // A 'struct' is used to group multiple variable types into a new data type

    // To create a new variable with the newly created type, it can be created like any type
    // by writing: 'type' visibility 'variable name' = type(arguments)

     Person public Teddy = Person(39, "Teddy");

    // This variable will want to be externally facing so it can be called, 
    // so 'public' is included after declaring the type.

    // When adding multiple variables, they can be created as a new array after constructing the new type:
    Person[] public listOfPeople; 

    // Above, the command creates a new array of 'People' saved as the variable 'listOfPeople', and 
    // its visibility as set as public so it can be viewed and interacted with when the smart contract
    // is deployed. There is currently no limit to how many variables can be saved in the array

    // There are two types of arrays in Solidity,
    // a dynamic array: Person[], which has no maximum limit of values that can be saved
    // a static array: Person[3], which has a maximium limit of values that can be saved, specified by the number within the square brackets

    // -------------------

    // Because smart contracts are to have interaction, a function is created below so we can add new values
    // to the smart contract after it has been deployed, rather than declaring them directly from the function.

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
         // This function will be called when we want to add a new person to the list of people
         // This function will take two arguments, a string and a uint256. The arguments, "_name" and "_favoriteNumber"
         // have underscores in front of the argument variables so the function does not call in the variables
         // declared already within the smart contract.

         // When "memory" is added, this will temporarily save the argument passed into the function
         // so it can be written into the smart contract. Once the function has been interacted with,
         // the argument passed through "memory" will no longer be accessible by the function, but will be
         // written into the data held by the smart contract.

        listOfPeople.push(Person(_favoriteNumber, _name));

        // Arrays have a built-in function, "push()", that can append the new data to the array.
        // Solidity is intuitive that it will recognize the argument types declared within the function,
        // and pass them into the type argument specified within the function.
    }
}