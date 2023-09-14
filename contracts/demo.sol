// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract PriceConsumerV3{

    AggregatorV3Interface internal  priceFeed;
    constructor(){
       // https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1#Goerli%20Testnet
        priceFeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);//goerli USD/ETH price feed address
    }

    function getLatestPrice() public view returns(int){
(,int price,,,)=priceFeed.latestRoundData();
return price;
    }

}
