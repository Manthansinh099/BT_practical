var manthanToken = artifacts.require("./manthanToken.sol");
var manthanTokenSale = artifacts.require("./manthanTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(manthanToken ,1000000).then(function(){
var tokenPrice = 1000000000000000;

  return deployer.deploy(manthanTokenSale , manthanToken.address , tokenPrice );
});
};
