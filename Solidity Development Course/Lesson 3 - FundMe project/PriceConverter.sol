// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    // Import ABIs available from the following npm package. The ABI can be called at the address defined in the getPrice function below
    // from the available interface functions.

    function getPrice() internal view returns (uint256) {
        // What is the address of the contract that is providing the current price of the desired currency
        // Scroll Sepolium ETH/USD contract address: 0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41

        // What is the ABI, or the function of the contract getting the price
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // The following line will return the price of USD relative to its value in Wei
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }
}