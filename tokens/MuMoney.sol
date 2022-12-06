// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract MuMoney is ERC20, ERC20Burnable, Ownable{

     address private muBank;
                         
    
    constructor() ERC20("Mu Money", "MUMO") {
        
    }

    function setMuBankAddress(address _bank) public onlyOwner{
        muBank = _bank;
    }

    function MuBank() public view returns(address MuBankAddress){
            return muBank;
    }

    function mint(address _to, uint256 amount) public{
        require(msg.sender == muBank, "Only the Mu Bank can mint new Mu Money");
        _mint(_to, amount);
    }

    

    function recoverTokens(address tokenAddress) external onlyOwner {
		IERC20 token = IERC20(tokenAddress);
		token.transfer(msg.sender, token.balanceOf(address(this)));
	}

    
}
