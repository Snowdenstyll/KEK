// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Base64.sol";


contract TimeKek is ERC721, Ownable {
    using Strings for string;

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
        _safeMint(msg.sender, totalSupply);

    }

    function baseUri() public view returns (string memory) {
        string memory uri = _baseURI();
        return uri;
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721)
        returns (string memory currentBaseURI)
    {
        //currentBaseURI = baseUri();
       return buildMetadata();
    }

    function _baseURI() internal view virtual override returns (string memory uri) {
        uint256 ts = block.timestamp;
        string memory bst = Strings.toString(ts);
        uri = Base64.encode(
            bytes(
                abi.encodePacked(
                    '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">',
                    '<text x="50%" y="50" text-anchor="middle" font-size="30">',
                    bst,
                    '</text>',
                    "</svg>"
                )
            )
        );
    }

    function getTotalSupply() public view returns (uint256 ts) {
        ts = totalSupply;
    }

    function buildMetadata()
    public
    view
    returns (string memory)
    {
        string memory temp = baseUri();
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"' 'kek',
                                '", "description":"kek',
                                '", "image": "',
                                "data:image/svg+xml;base64,",
                                temp,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

}