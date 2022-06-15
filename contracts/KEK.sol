// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeCast.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "./Base64.sol";

contract KEK is ERC721Enumerable, Ownable {
    using Strings for uint256;

    struct Word {
        string name;
        string description;
        string bgHue;
        string textHue;
        string value;
    }

    mapping(uint256 => Word) public words;

    constructor() ERC721("KEK", "KEK") {}

    // public
    function mint(string memory word) public payable {
        uint256 supply = totalSupply();
        //require(supply + 1 <= 1000);

        Word memory newWord = Word(
            string(abi.encodePacked("KEK #", uint256(supply + 1).toString())),
            "KEK",
            randomNum(361, block.difficulty, supply).toString(), //get chain id
            randomNum(361, block.timestamp, supply).toString(), //get chain id
            word
        );

        if (msg.sender != owner()) {
            require(msg.value >= 0.001 ether);
        }

        words[supply + 1] = newWord;
        _safeMint(msg.sender, supply + 1);
    }

    function randomNum(
        uint256 _mod,
        uint256 _seed,
        uint256 _salt
    ) public view returns (uint256) {
        uint256 num = uint256(
            keccak256(
                abi.encodePacked(block.timestamp, msg.sender, _seed, _salt)
            )
        ) % _mod;
        return num;
    }

    function buildImage(uint256 _tokenId) public view returns (string memory) {
        Word memory currentWord = words[_tokenId];
        return
            Base64.encode(
                bytes(
                    abi.encodePacked(
                        '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">',
                        '<rect height="500" width="500" fill="hsl(',
                        currentWord.bgHue,
                        ', 50%, 25%)"/>',
                        '<text x="50%" y="50" dominant-baseline="left" fill="hsl(',
                        currentWord.textHue,
                        ', 100%, 80%)" text-anchor="middle" font-size="30">',
                        currentWord.value,
                        "</text>",
                        "</svg>"
                    )
                )
            );
    }

     function buildImage_v2(string memory word_) public view returns (string memory) {
        return
            Base64.encode(
                bytes(
                    abi.encodePacked(
                       word_
                    )
                )
            );
    }

    /*  function buildTextForImage (string memory word_) public pure returns (uint) {
        bytes32 b3 = stringToBytes32(word_);
        //uint numRows = ((b3)) / 1 ether;
        return numRows;
    } */

    function buildMetadata(uint256 _tokenId)
        public
        view
        returns (string memory)
    {
        Word memory currentWord = words[_tokenId];
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                currentWord.name,
                                '", "description":"',
                                currentWord.description,
                                '", "image": "',
                                "data:image/svg+xml;base64,",
                                buildImage(_tokenId),
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    function buildMetadata_v2(string memory svg)
        public
        view
        returns (string memory)
    {
        //Word memory currentWord = words[_tokenId];
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                'image": "',
                                "data:image/svg+xml;base64,",
                                buildImage_v2(svg)
                            )
                        )
                    )
                )
            );
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return buildMetadata(_tokenId);
    }

    function withdraw() public payable onlyOwner {
        (bool os, ) = payable(owner()).call{value: address(this).balance}("");
        require(os);
    }

    function stringToBytes32(string memory source)
        public
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

    //get the amount of rows needed
    function utfStringLength(string memory str)
        public
        pure
        returns (uint256 length)
    {
        uint256 i = 0;
        bytes memory string_rep = bytes(str);

        while (i < string_rep.length) {
            if (string_rep[i] >> 7 == 0) i += 1;
            else if (string_rep[i] >> 5 == bytes1(uint8(0x6))) i += 2;
            else if (string_rep[i] >> 4 == bytes1(uint8(0xE))) i += 3;
            else if (string_rep[i] >> 3 == bytes1(uint8(0x1E)))
                i += 4;
                //For safety
            else i += 1;

            length++;
        }

        return uint256(length) / 32;
    }
}
