const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("KEK", function () {
    let KEK;
    let kek;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {
        // Get the ContractFactory and Signers here.
        KEK = await ethers.getContractFactory("KEK");
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

        // To deploy our contract, we just have to call Token.deploy() and await
        // for it to be deployed(), which happens once its transaction has been
        // mined.
        kek = await KEK.deploy();
        await kek.deployed();
    });

    it("Should Mint new kek", async function () {
        const mint_tx = await kek.mint("Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism. Apart from counting words and characters, our online editor.");
        await mint_tx.wait();
        const kek_balance = await kek.balanceOf(owner.address);
        console.log(kek_balance);
        //num rows = 9
        const numRows = await kek.utfStringLength("Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text");
        //wait numRows.wait();
        console.log((numRows/32));

        const strToBytes = await kek.stringToBytes32("Lorem Ipsum is simply dummy1 text Lorem Ipsum is simply dummy2 text Lorem Ipsum is simply dummy3 text Lorem Ipsum is simply dummy4 text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text");
        console.log(strToBytes);
        //console.log(token_uri);
    });
    
    return

    it("Should Mint new kek", async function () {
        const mint_tx = await kek.mint("hello world");
        await mint_tx.wait();
        const kek_balance = await kek.balanceOf(owner.address);
        console.log(kek_balance);
        //expect(kek.totalSupply()).to.equal(kek_balance);

        let token_uri = await kek.tokenURI(1);
        console.log(token_uri);
    });

    it("Should Mint new kek", async function () {
        const mint_tx = await kek.mint("Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism. Apart from counting words and characters, our online editor.");
        await mint_tx.wait();
        const kek_balance = await kek.balanceOf(owner.address);
        console.log(kek_balance);
        //expect(kek.totalSupply()).to.equal(kek_balance);

        let token_uri = await kek.tokenURI(1);
        console.log(token_uri);
    });

});
