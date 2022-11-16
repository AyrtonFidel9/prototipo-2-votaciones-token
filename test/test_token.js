const VoteToken = artifacts.require('VoteToken');

contract('VoteToken', (accounts) =>{
    console.log(accounts);
    before(async()=>{
        this.token = await VoteToken.deployed();
    });

    it("gives the owner of the token 1M tokens ", async()=>{
        let balance = await this.token.balanceOf(accounts[0]);
        console.log(balance.toString());
        assert.equal(balance, '1000000', "Balance should be 1M tokens for contract creator");
        
        await this.token.transfer("0xdCCC48E2A50cCdF5F40ab0d54fD611dFA1e15240",1)
        balance = await this.token.balanceOf("0xdCCC48E2A50cCdF5F40ab0d54fD611dFA1e15240")
        console.log(balance.toString());
    });
});