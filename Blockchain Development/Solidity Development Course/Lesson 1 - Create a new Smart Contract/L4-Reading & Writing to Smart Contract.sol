// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// Calldata, Memory and Storage
// -------
// Calldata and memory mean that the variable declared within the function arguments will only exist
// for the duration of calling or interacting with the function. 

// Storage is also another temporary variable but will read data that is permanently persisted on the blockchain,
// or permanently write data onto the blockchain. Storage will write to the blockchain state outside of the function.

// The difference between memory and calldata is that memory can be changed when interacted with in a function, 
// but calldata cannot be modified. Calldata is the temporary argument variable used to read from the memory 
// that is already saved in the blockhain state.

// The "memory" keyword must be added for arrays, structs, or mapping types in Solidity