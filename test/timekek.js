const { expect } = require("chai");

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

        const mint_tx = await kek.mint();
        await mint_tx.wait();
        const mint2 = await kek.mint();
        await mint2.wait();
        const seconds = await kek.addSeconds();
        await seconds.wait();
    });

    it("Add the second", async function () {
        const seconds = await kek.addSeconds();
        await seconds.wait();
    });

    /* it("get Color way", async function () {
        colorWayOne = await kek.getColorSet(1);
        console.log((colorWayOne));

        colorWayTwo = await kek.getColorSet(2);
        console.log((colorWayTwo));
    }); */

    it("Token uri 1 ", async function () {
        const T1 = await kek.tokenURI(1);
        //await uri1.wait();
        console.log(T1);
    });

    it("Token uri 2  test 2", async function () {
        const T2 = await kek.tokenURI(2);
        //await uri1.wait();
        console.log(T2);
    });

    it("Total Supply, async function", async function () {
        const totalSupply = await kek.TotalSupply();
        console.log(parseInt(totalSupply));
    });

    it("Get SVG CONTENT FOR SECONDS", async function () {
        const seconds = await kek.addSeconds();
        await seconds.wait();
        let seconds_svg = await kek.getSVGContent(6, 7);
        //await uri1.wait();
        console.log(seconds_svg);
    });

    /* it("Get ColorwayString", async function () {
        const T1 = await kek.GetColorWayString(1);
        //await uri1.wait();
        console.log(T1);
    });

    it("Get Colorway Index", async function () {
        const T1 = await kek.getColorSetIndex(1);
        //await uri1.wait();
        console.log(parseInt(T1));
    }); */

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
    
         */

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

    /*     it("Add Minutes", async function () {
            addSeconds = await kek.addSeconds();
            await addSeconds.wait();
        });
    
        it("Get the second", async function () {
            const seconds = await kek.getSVGContent(5, 5);
            //await uri1.wait();
            console.log((seconds));
        });
    
        it("Token uri 1  test 1", async function () {
            addSeconds = await kek.addSeconds();
            await addSeconds.wait();
    
            const T1 = await kek.tokenURI(1);
            //await uri1.wait();
            console.log(T1);
        }); */

    /* it("address to number", async function () {
        addressNumber = await kek.addressToNumber(owner.address);
        console.log((addressNumber));
    });

    it("address to number Array", async function () {
        addressNumber = await kek.getNumbersFromAddress();
        addressNumber.forEach(element => {
            console.log(parseInt(element));
        });
    }); */


});
