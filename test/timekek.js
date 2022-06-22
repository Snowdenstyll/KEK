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
        console.log(parseInt(totalSupply));

        //let token_uri = await kek.tokenURI(1);
        //console.log(token_uri);
    });

    /*  it("URI 1 ", async function () {
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
    
        it("Token uri 2  test 2", async function () {
            const T1 = await kek.tokenURI(1);
            //await uri1.wait();
            console.log(T1);
        }); */

    /*     it("Token uri 2  test 2", async function () {
            const T1 = await kek.getSVGContent(1, 1);
            //await uri1.wait();
            console.log(T1);
        });
    
        it("Get the hour", async function () {
            const hour = await kek.getHour();
            //await uri1.wait();
            console.log(parseInt(hour));
        });
    
        it("Get the minute", async function () {
            const minute = await kek.getMinute();
            //await uri1.wait();
            console.log(parseInt(minute));
        });
    
        it("Get the second", async function () {
            const second = await kek.getSecond();
            //await uri1.wait();
            console.log(parseInt(second));
        }); */

    /* it("Get the first digit of hour", async function () {
        const hour = await kek.getHour();
        //await uri1.wait();
        console.log(parseInt(hour));
        digits = (parseInt(hour).toString());
        console.log(digits[0], digits[1]);

        const firstDigit = await kek.getFirstDigit(parseInt(hour));
        const secondDigit = await kek.getSecondDigit(parseInt(hour));

        console.log(parseInt(firstDigit));
        console.log(parseInt(secondDigit));
    }); */

    it("Build Digits ", async function () {
        const T1 = await kek.buildDigits(1);
        console.log(T1);
        const T2 = await kek.buildDigits(2);
        console.log(T2);
    });

    it("Token uri 2  test 2", async function () {
        const T1 = await kek.tokenURI(1);
        //await uri1.wait();
        console.log(T1);
    });

});
