// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint public totalSupply;
    address public owner;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;


    constructor (address _owner,string memory _name, string memory _symbol, uint8 _decimal, uint _totalSupply){
        name = _name;
        symbol = _symbol;
        decimals = _decimal;
        totalSupply = _totalSupply;
        owner = _owner;
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value, "Insufficient Amount");
        return _transfer(msg.sender, _to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(allowance[_from][msg.sender] >= _value, "Insufficient Amount");
        allowance[_from][msg.sender] -= _value;
        return _transfer(_from, _to, _value);

    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] += _value;
        return true;
    }

    function _mint(address _to, uint _value) private {
        balanceOf[_to] += _value;
        totalSupply += _value;

    }

    function mint(address _to, uint _value) public {
        require(msg.sender == owner, "Not owner");
        _mint(_to, _value);
    }


    function _transfer(address _from, address _to, uint256 _value) public returns (bool success){
        require(allowance[_from][msg.sender] >= _value, "Insufficient Amount");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        return true;

    }


}


// function name() public view returns (string) done
// function symbol() public view returns (string) done
// function decimals() public view returns (uint8) done
// function totalSupply() public view returns (uint256) done
// function balanceOf(address _owner) public view returns (uint256 balance) done
// function transfer(address _to, uint256 _value) public returns (bool success) done
// function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) done
// function approve(address _spender, uint256 _value) public returns (bool success)
// function allowance(address _owner, address _spender) public view returns (uint256 remaining)
