// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "./ERC20.sol";

contract ERC20Factory {
    address[] public deployedToken;
    mapping(address => address[]) public userToken;

    function createNewToken(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) public returns (address){
        ERC20 newErc20 = new ERC20(msg.sender, _name, _symbol, _decimals, _totalSupply);
        address newTokenAddress = address(newErc20);
        deployedToken.push(newTokenAddress);
        userToken[msg.sender].push(newTokenAddress);
        return newTokenAddress;
    }

    function getDeployedTokens() external view returns(address[] memory){
        return deployedToken;
    }


}