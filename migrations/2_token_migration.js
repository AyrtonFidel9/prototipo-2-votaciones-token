const VoteCoin= artifacts.require("VoteCoin");

module.exports = function (deployer) {
    deployer.deploy(VoteCoin);
};
