const { expect } = require("chai");
const { ethers } = require("hardhat");

describe.only("TIME KEK", function () {
    let KEK;
    let kek;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {
        // Get the ContractFactory and Signers here.
        KEK = await ethers.getContractFactory("TimeKek");
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

        // To deploy our contract, we just have to call Token.deploy() and await
        // for it to be deployed(), which happens once its transaction has been
        // mined.
        kek = await KEK.deploy();
        await kek.deployed();
    });


    it("Should Mint new kek", async function () {
        const mint_tx = await kek.mint();
        await mint_tx.wait();
        const mint2 = await kek.mint();
        await mint2.wait();

        const totalSupply = await kek.getTotalSupply();
        console.log(totalSupply);

        //let token_uri = await kek.tokenURI(1);
        //console.log(token_uri);
    });

    it("URI 1 ", async function () {
        const uri1 = await kek.baseUri();
        //await uri1.wait();
        console.log(uri1);

        //let token_uri = await kek.tokenURI(1);
        //console.log(token_uri);
    });

    it("URI 2", async function () {
        const uri1 = await kek.baseUri();
        //await uri1.wait();
        console.log(uri1);

        //let token_uri = await kek.tokenURI(1);
        //console.log(token_uri);
    });

    it("Token uri 1 ", async function () {
        const T1 = await kek.tokenURI(1);
        //await uri1.wait();
        console.log(T1);
    });

    it("Token uri 2 ", async function () {
        const T1 = await kek.tokenURI(1);
        //await uri1.wait();
        console.log(T1);
    });

});
