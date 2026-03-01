// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {

    // Initially, the variable is set to internally update the value, but does not display
    // what the variable has been updated to when interacted with. To see updated values
    // after interacting with the function or smart contract, set the variable that is wanted
    // to be tracked as 'public', after the the type, for example:

    // uint256 favoriteNumber = 39; turns into:

    uint256 public favoriteNumber = 39;

    // Functions are created by typing 'function', the name of the function, 
    // and parenthesis of the conditions, or inputs, for the function to operate
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

        // The variable 'favoriteNumber' initiated within the smart contract will be updated
        // to the condition inputted through the function's conditions.
    }

    // retrieve() function will reads the variable and does not write
    // the 'view' argument listed in a function will only read the state, and
    // the 'view' argument does not allow any modification to the state of the contract.

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    // If the 'pure' argument is included in the function, it will only return the value
    // from within the function, and not the state of the smart contract. The 'pure'
    // argument also does not allow any modification

    function retrievePure() public pure returns(uint256){
        return 47;
    }
}