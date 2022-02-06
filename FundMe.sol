// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        //Eth -> USD conversion rate
    }
//gets 'import' verison by making a contract call to another contract from this contract (FundMe)
    function getVersion() public view returns (uint256){
        //Define the same way with other contracts as strucs
        //type/name = initalize contract/Link's Eth-usd price feed contract
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getPrice() public view returns (uint256){
        //Type of contract/ name of veriable?
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        //Tuple
        (,int256 answer,,,) =  priceFeed.latestRoundData();
        return uint256(answer);

