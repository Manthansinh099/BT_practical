pragma solidity >=0.4.22 <0.9.0;

import "./manthanToken.sol" ;

contract manthanTokenSale {

    address admin;
    manthanToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

   constructor( manthanToken _tokenContract  , uint256 _tokenPrice ){
        //assign on admin
        admin = msg.sender;
        //token contract
         tokenContract = _tokenContract;
        // token price
        tokenPrice = _tokenPrice;
      
    }
     //multiply
    function multiply(uint x,uint y) internal pure returns (uint z) {
        require(y==0 || (z=x*y)/y==x);
}
   
   //buy token
    function buyTokens(uint256 _numberOfTokens) public payable {

        //Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens,tokenPrice));
       
        //Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
       
        //Require that a transfer is successful

        //Keep track of tokenSold
        tokensSold+= _numberOfTokens;
        //Trigger Sell event
        emit Sell(msg.sender, _numberOfTokens);
    }
    //Ending Token manthanTokenSale
    function endSale() public {
        //require admin
        require(msg.sender == admin);
        // Transfer remaining dapp tokens to admin
        require(tokenContract.transfer(admin,tokenContract.balanceOf(address(this))));
        //Destroy contract
        // UPDATE: Let's not destroy the contract here
        // Just transfer the balance to the admin
        admin.transfer(address(this).balance);
        selfdestruct(payable(admin));
    }
}