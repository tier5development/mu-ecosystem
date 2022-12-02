// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";



contract MuMeme is ERC20, ERC20Burnable  {

    uint256 _maxSupply = 1000000000000000000000000000000000;
                         
    
    constructor() ERC20("Mu Meme", "MUME") {
        _mint(msg.sender, 100000000000000000000000000000000);
    }

    function mint(address _to, uint256 amount) public  {
        require( totalSupply() + amount <= _maxSupply , "ECR20: Minting this would excede max supply...");
        require(msg.sender == 0xF243d79910cBd70a0eaF405b08E80065a67D5e14);
        _mint(_to, amount);
    }
}
