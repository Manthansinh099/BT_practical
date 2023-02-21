pragma solidity >=0.4.22 <0.9.0;

import "./manthanToken.sol" ;

contract manthanTokenSale {

    address admin;
    manthanToken public tokenContract;
    uint256 public tokenPrice;

   constructor( manthanToken _tokenContract  , uint256 _tokenPrice ){
        //assign on admin
        admin = msg.sender;
        //token contract
         tokenContract = _tokenContract;
        // token price
        tokenPrice = _tokenPrice;
      
    }
}