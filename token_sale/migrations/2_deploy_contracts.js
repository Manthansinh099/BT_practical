var manthanToken = artifacts.require("./manthanToken.sol");

module.exports = function(deployer) {
  deployer.deploy(manthanToken ,1000000 );
}; 