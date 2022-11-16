// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract VoteCoin{

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;

    mapping (address => mapping ( address => uint256)) public allowance;

    event Transfer(
        address indexed _from, 
        address indexed _to,
        uint256 _value
    );

    event Approval (
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    // consultar sobre INDEXED ?

    constructor(){
        name = "Ballot Coop Nueva Esperanza";
        symbol = "BNE";
        decimals = 12;
        totalSupply = 1000000 * (uint256 (10) ** decimals); // pasarlos a decimales
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer (address _to, uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value); // si el balance es mayor a lo que se va a transferir, continuar!!
        balanceOf[msg.sender] -= _value; // se compensa, se quita el valor a transferir
        balanceOf[_to] += _value; // se aumentan los tokens que se le envian
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve (address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom (address _from, address _to, uint256 _value) 
    public returns (bool success){
        require(balanceOf[_from] >= _value);
        require(allowance[_from][msg.sender] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}   