const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TimeKek", function () {
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

    it("Testing Build MetaData v2", async function () {
        let svg = `
        <svg height="90" width="200">
            <text x="10" y="20" style="fill:red;">Several lines:
            <tspan x="10" y="45">First line.</tspan>
            <tspan x="10" y="70">Second line.</tspan>
            </text>
        </svg>
        `;
        const meta_tx = await kek.buildMetadata_v2(svg);
        console.log(meta_tx);
    });

    it("Should Mint new kek", async function () {
        const mint_tx = await kek.mint("hello world");
        await mint_tx.wait();
        const kek_balance = await kek.balanceOf(owner.address);
        console.log(kek_balance);
        //expect(kek.totalSupply()).to.equal(kek_balance);

        let token_uri = await kek.tokenURI(1);
        console.log(token_uri);
    });

});
