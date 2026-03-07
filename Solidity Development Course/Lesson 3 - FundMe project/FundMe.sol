// SPDX-License-Identifier: MIT

// Get fund from users

// Withdraw funds

// Set a minimum funding value in USD
pragma solidity ^0.8.19;

// Import the internal library, PriceConverter
import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    // Goals of this function:
    // 1. Allow users to send money to my Ethereum address
    // 2. Have a minimum $ sent

    // Create a variable to store the minimum amount of USD anticipated
    uint256 public minimumUSD = 5e18;

    // Create an array to save the list of funders who have sent funds
    address[] public funders;

    // Create a mapping to see how much each funder sent
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // From the functions written below, the minimum amount of USD expected is refactored, expressed in Wei

    // The "payable" keyword allows the function to receive and hold funds. It acts the same as an Ethereum wallet.
    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUSD, "The amount sent to the smart contract was less than $5 USD");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

        // msg.value is the number of wei sent with the message (interaction/call of function)

        // From the getConversionRate function written below, the msg.value will be converted from Wei to USD, 
        // because the argument of getConversionRate expects the value of Ethereum, expressed in Wei

        // The "require" keyword makes the success of this function conditional to the arguments provided.
        // In the line above, the minimum amount of funds to be sent must be greater or equal to the value of minimumUSD.
        // If the value of funds sent is less than minimumUSD, then the function will 'revert', or fail.

        // If a function reverts, there will be no change to the state of the contract.
        // However, because of any code written within the contract was executed, the gas will be spent to complete those
        // commands, and any remaining gas to execute the entire function will be returned to the initiator.        
    }

    function withdraw() public {
        // For loop:
        // Starting index, ending index, step count
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
    }

}
