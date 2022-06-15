// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TimeKek is ERC721, Ownable {
    
    uint256 totalSupply;
    constructor() ERC721("TimeKek", "TKEK") {}

    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        _safeMint(to, tokenId);
    }

    function mint() public onlyOwner {
        totalSupply = totalSupply + 1;
    }

    function baseUri() public view returns (string memory uri) {
        uri = _baseURI();
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721)
        returns (string memory currentBaseURI)
    {
        currentBaseURI = baseUri();
    }

    function _baseURI() internal view virtual override returns (string memory) {
        uint256 ts = block.timestamp;
        return Strings.toString(ts);
    }

    function getTotalSupply() public view returns (uint256 ts) {
        ts = totalSupply;
    }
}