//Using this contract , we can send ETH or withdraw
// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;
import "./PriceConverter.sol";//importing AggregatorV3Interface.sol from a library function 
//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"//importing from root directory
error NotOwner();
contract FundMe{
    using PriceConverter for uint256;
    uint256 public constant minimumUSD=50*1e18;
    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;
  //  address public  owner;
  address public immutable i_owner;
    constructor(){
       i_owner=msg.sender;
    }
    //in order to make a function payable we have to declare it payable
    function fund()  public payable {
    
              require(msg.value.getConversionRate()>=minimumUSD,"not enough money!");
              funders.push(msg.sender);
              addressToAmountFunded[msg.sender]+=msg.value;
            
    }
    function withdraw()public  onlyOwner{
           for(uint256 funderIndex=0;funderIndex<funders.length;funderIndex++)
           {
               address funder=funders[funderIndex];
               addressToAmountFunded[funder]=0;
           }
    
   funders = new address[](0);
  ( bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}(" ");
    require(callSuccess,"call failed");
    }
    modifier onlyOwner{
       require(msg.sender==i_owner);
       // if(msg.sender!=i_owner){revert NotOwner()};
        _;
    }
    

    receive() external payable {
        fund();
    }
    fallback() external payable{
        fund();
    }

}

//contract 