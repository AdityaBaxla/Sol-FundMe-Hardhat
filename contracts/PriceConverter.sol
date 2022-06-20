//SPDX-License-Identifer: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//why is this library not abstracted ?? why not an interface 

library PriceConverter {
    //We could make this public but then we will have to deploy it

    function getPrice() internal view returns (uint256) {
        //rinkeby ETH/USD address
        AggregatorV3Interface priceFeed AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (, int256 answer, , ,) = priceFeed.latestRoundData();

        return uint256(answer * 10 ** 10)
    }

    //1000000000

    function getConversionRate(uint 256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        // the actual ETH/USD conversion rate after conversion adjustion the extra 0s
        return ethAmountInUsd;
    }
}
