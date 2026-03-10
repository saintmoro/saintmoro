// SPDX-License-Identifier: MIT

// Solidity is the primary programming language for developing smart contracts.

// Smart contracts (written in Solidity) are initiated by declaring which version of Solidity will be used,
// as below:

pragma solidity 0.8.19; // This will be the primary version of Solidity used while learning through this course

// The version specified instructs which compiler to use. When compiling a smart contract, 
// it is possible to use certain versions and above, or a range of versions:

// pragma solidity ^0.8.19
// The caret specifies that any compilier from version 0.8.19 or newer can compile this Solidity file, but none below

// pragma solidity >=0.8.19 <0.9.0
// The operators before the version number specify the range that the compiler can compile this Solidity file,
// in this example, the file can be compiled using version 0.8.19, AND above; up to, but not including
// version 0.9.0

contract SimpleStorage {
    // contract is a keyword that tells Solidity the name of the smart contract.
    // The 'contract' keyword can be related to a class in JavaScript or Python

    // Solidity has different 'types' of values used to create variables. 
    // Some of the basic types include:

    // bool: true or false
    // uint256 : unsigned integer, always positive; maximum of 256 bits/128 bytes
    // int128 : integers, positive or negative; maximium of 128 bits/64 bytes
    // address: Ethereum address, 42 hex characters long
    // string: a text-value variable representing a bytes(2-32) type;
    // bytes: a low-level value for EVM 

    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 39;
    string favoriteNumberInText = "thirty-nine";
    int256 favoriteInt = -39;
    address myDevAddress = 0x116A6bc6D22e151eB34B346Dc1BD9b907F54faD1;

    // Solidity is an explicit-preferred programming language. With uint and int types, it is
    // best practice to include how many bits the variable type is limited to.

    // Variables in Solidity can be initialized without initially being assigned a value, similar to
    // { let name } in JavaScript
}