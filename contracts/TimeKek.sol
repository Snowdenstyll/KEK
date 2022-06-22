// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Base64.sol";

contract TimeKek is ERC721, Ownable {
    using Strings for string;
    using Strings for uint256;

    uint256 totalSupply;

    mapping(uint256 => mapping(uint256 => string)) svgContent;
    mapping(uint256 => uint256[]) digitsBuild;

    constructor() ERC721("TimeKek", "TKEK") {
        AddPreSets();
    }

    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
    }

    function safeMint(address to, uint256 tokenId)
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
    
    /** TIMESSTAMP */
    /*  function _baseURI() internal view virtual override returns (string memory uri) {
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
    } */

     /* abi.encodePacked(
        '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">',
        '<text x="50%" y="50" text-anchor="middle" font-size="30">',
        bst,
        '</text>',
        "</svg>"
    ) */

    /* function _baseURI() internal view virtual override returns (string memory uri) {
        uint256 ts = block.timestamp;
        string memory bst = Strings.toString(ts);
        uri = Base64.encode(
            bytes(
                abi.encodePacked(
                    '<svg width="375" height="96" xmlns="http://www.w3.org/2000/svg">',
                        '<g transform="translate(17,0)">',
                            '<g>',
                                '<path d="M10,8L14,4L42,4L46,8L42,12L14,12L10,8z"></path>',
                                '<path d="M8,10L12,14L12,42L8,46L4,42L4,14L8,10z"></path>',
                                '<path d="M48,10L52,14L52,42L48,46L44,42L44,14L48,10z"></path>',
                                '<path d="M10,48L14,44L42,44L46,48L42,52L14,52L10,48z"></path>',
                                '<path d="M8,50L12,54L12,82L8,86L4,82L4,54L8,50z"></path>',
                                '<path d="M48,50L52,54L52,82L48,86L44,82L44,54L48,50z"></path>',
                                '<path d="M10,88L14,84L42,84L46,88L42,92L14,92L10,88z"></path>',
                            '</g>',
                            '<g>',
                                '<path d="M66,8L70,4L98,4L102,8L98,12L70,12L66,8z"></path>',
                                '<path d="M64,10L68,14L68,42L64,46L60,42L60,14L64,10z"></path>',
                                '<path d="M104,10L108,14L108,42L104,46L100,42L100,14L104,10z"></path>',
                                '<path d="M66,48L70,44L98,44L102,48L98,52L70,52L66,48z"></path>',
                                '<path d="M64,50L68,54L68,82L64,86L60,82L60,54L64,50z"></path>',
                                '<path d="M104,50L108,54L108,82L104,86L100,82L100,54L104,50z"></path>',
                                '<path d="M66,88L70,84L98,84L102,88L98,92L70,92L66,88z"></path>',
                                '</g>',
                            '<g>',
                                '<circle r="4" cx="112" cy="28"></circle>',
                                '<circle r="4" cx="103.5" cy="68"></circle>',
                            '</g>',
                            '<g>',
                                '<path d="M134,8L138,4L166,4L170,8L166,12L138,12L134,8z"></path>',
                                '<path d="M132,10L136,14L136,42L132,46L128,42L128,14L132,10z"></path>',
                                '<path d="M172,10L176,14L176,42L172,46L168,42L168,14L172,10z"></path>',
                                '<path d="M134,48L138,44L166,44L170,48L166,52L138,52L134,48z"></path>',
                                '<path d="M132,50L136,54L136,82L132,86L128,82L128,54L132,50z"></path>',
                                '<path d="M172,50L176,54L176,82L172,86L168,82L168,54L172,50z"></path>',
                                '<path d="M134,88L138,84L166,84L170,88L166,92L138,92L134,88z"></path>',
                            '</g>',
                                '<g>',
                                '<path d="M190,8L194,4L222,4L226,8L222,12L194,12L190,8z"></path>',
                                '<path d="M188,10L192,14L192,42L188,46L184,42L184,14L188,10z"></path>',
                                '<path d="M228,10L232,14L232,42L228,46L224,42L224,14L228,10z"></path>',
                                '<path d="M190,48L194,44L222,44L226,48L222,52L194,52L190,48z"></path>',
                                '<path d="M188,50L192,54L192,82L188,86L184,82L184,54L188,50z"></path>',
                                '<path d="M228,50L232,54L232,82L228,86L224,82L224,54L228,50z"></path>',
                                '<path d="M190,88L194,84L222,84L226,88L222,92L194,92L190,88z"></path>',
                            '</g>',
                            '<g>',
                                '<circle r='"4"' cx='"236"' cy='"28"'></circle>',
                                '<circle r="4" cx="227.5" cy="68"></circle>',
                            '</g>',
                            '<g>',
                                '<path d="M258,8L262,4L290,4L294,8L290,12L262,12L258,8z"></path>',
                                '<path d="M256,10L260,14L260,42L256,46L252,42L252,14L256,10z"></path>',
                                '<path d="M296,10L300,14L300,42L296,46L292,42L292,14L296,10z"></path>',
                                '<path d="M258,48L262,44L290,44L294,48L290,52L262,52L258,48z"></path>',
                                '<path d="M256,50L260,54L260,82L256,86L252,82L252,54L256,50z"></path>',
                                '<path d="M296,50L300,54L300,82L296,86L292,82L292,54L296,50z"></path>',
                                '<path d="M258,88L262,84L290,84L294,88L290,92L262,92L258,88z"></path>',
                            '</g>',
                            '<g>',
                                '<path d="M314,8L318,4L346,4L350,8L346,12L318,12L314,8z"></path>',
                                '<path d="M312,10L316,14L316,42L312,46L308,42L308,14L312,10z"></path>',
                                '<path d="M352,10L356,14L356,42L352,46L348,42L348,14L352,10z"></path>',
                                '<path d="M314,48L318,44L346,44L350,48L346,52L318,52L314,48z"></path>',
                                '<path d="M312,50L316,54L316,82L312,86L308,82L308,54L312,50z"></path>',
                                '<path d="M352,50L356,54L356,82L352,86L348,82L348,54L352,50z"></path>',
                                '<path d="M314,88L318,84L346,84L350,88L346,92L318,92L314,88z"></path>',
                            '</g>',
                        '</g>',
                    "</svg>"
                )
            )
        );
    } */

    /* function _baseURI() internal view virtual override returns (string memory uri) {
        uint256 ts = block.timestamp;
        string memory bst = Strings.toString(ts);
        uri = Base64.encode(
            bytes(
                abi.encodePacked(
                    '<svg width="375" height="96" xmlns="http://www.w3.org/2000/svg">',
                        '<g transform="translate(17,0)">',
                            '<g>',
                                '<path d="M10,8L14,4L42,4L46,8L42,12L14,12L10,8z"></path>',
                                '<path d="M8,10L12,14L12,42L8,46L4,42L4,14L8,10z"></path>',
                                '<path d="M48,10L52,14L52,42L48,46L44,42L44,14L48,10z"></path>',
                                '<path d="M10,48L14,44L42,44L46,48L42,52L14,52L10,48z"></path>',
                                '<path d="M8,50L12,54L12,82L8,86L4,82L4,54L8,50z"></path>',
                                '<path d="M48,50L52,54L52,82L48,86L44,82L44,54L48,50z"></path>',
                                '<path d="M10,88L14,84L42,84L46,88L42,92L14,92L10,88z"></path>',
                            '</g>',
                            '<g>',
                                '<path d="M66,8L70,4L98,4L102,8L98,12L70,12L66,8z"></path>',
                                '<path d="M64,10L68,14L68,42L64,46L60,42L60,14L64,10z"></path>',
                                '<path d="M104,10L108,14L108,42L104,46L100,42L100,14L104,10z"></path>',
                                '<path d="M66,48L70,44L98,44L102,48L98,52L70,52L66,48z"></path>',
                                '<path d="M64,50L68,54L68,82L64,86L60,82L60,54L64,50z"></path>',
                                '<path d="M104,50L108,54L108,82L104,86L100,82L100,54L104,50z"></path>',
                                '<path d="M66,88L70,84L98,84L102,88L98,92L70,92L66,88z"></path>',
                            '</g>',
                            '<g>',
                                '<circle r="4" cx="117" cy="28"></circle>',
                                '<circle r="4" cx="117" cy="68"></circle>',
                            '</g>',
                            '<g>',
                                '<path d="M134,8L138,4L166,4L170,8L166,12L138,12L134,8z"></path>',
                                '<path d="M132,10L136,14L136,42L132,46L128,42L128,14L132,10z"></path>',
                                '<path d="M172,10L176,14L176,42L172,46L168,42L168,14L172,10z"></path>',
                                '<path d="M134,48L138,44L166,44L170,48L166,52L138,52L134,48z"></path>',
                                '<path d="M132,50L136,54L136,82L132,86L128,82L128,54L132,50z"></path>',
                                '<path d="M172,50L176,54L176,82L172,86L168,82L168,54L172,50z"></path>',
                                '<path d="M134,88L138,84L166,84L170,88L166,92L138,92L134,88z"></path>',
                            '</g>',
                            '<g>',
                                '<path d="M190,8L194,4L222,4L226,8L222,12L194,12L190,8z"></path>',
                                '<path d="M188,10L192,14L192,42L188,46L184,42L184,14L188,10z"></path>',
                                '<path d="M228,10L232,14L232,42L228,46L224,42L224,14L228,10z"></path>',
                                '<path d="M190,48L194,44L222,44L226,48L222,52L194,52L190,48z"></path>',
                                '<path d="M188,50L192,54L192,82L188,86L184,82L184,54L188,50z"></path>',
                                '<path d="M228,50L232,54L232,82L228,86L224,82L224,54L228,50z"></path>',
                                '<path d="M190,88L194,84L222,84L226,88L222,92L194,92L190,88z"></path>',
                            '</g>',
                            '<g>',
                                '<circle r="4" cx="241" cy="28"></circle>',
                                '<circle r="4" cx="241" cy="68"></circle>',
                            '</g>',
                            '<g>',
                                '<path d="M258,8L262,4L290,4L294,8L290,12L262,12L258,8z"></path>',
                                '<path d="M256,10L260,14L260,42L256,46L252,42L252,14L256,10z"></path>',
                                '<path d="M296,10L300,14L300,42L296,46L292,42L292,14L296,10z"></path>',
                                '<path d="M258,48L262,44L290,44L294,48L290,52L262,52L258,48z"></path>',
                                '<path d="M256,50L260,54L260,82L256,86L252,82L252,54L256,50z"></path>',
                                '<path d="M296,50L300,54L300,82L296,86L292,82L292,54L296,50z"></path>',
                                '<path d="M258,88L262,84L290,84L294,88L290,92L262,92L258,88z"></path>',
                            '</g>',
                            '<g>',
                                '<path d="M314,8L318,4L346,4L350,8L346,12L318,12L314,8z"></path>',
                                '<path d="M312,10L316,14L316,42L312,46L308,42L308,14L312,10z"></path>',
                                '<path d="M352,10L356,14L356,42L352,46L348,42L348,14L352,10z"></path>',
                                '<path d="M314,48L318,44L346,44L350,48L346,52L318,52L314,48z"></path>',
                                '<path d="M312,50L316,54L316,82L312,86L308,82L308,54L312,50z"></path>',
                                '<path d="M352,50L356,54L356,82L352,86L348,82L348,54L352,50z"></path>',
                                '<path d="M314,88L318,84L346,84L350,88L346,92L318,92L314,88z"></path>',
                            '</g>',
                        '</g>',
                    "</svg>"
                )
            )
        );
    } */

    function _baseURI() internal view virtual override returns (string memory uri) {
        uint256 ts = block.timestamp;
        string memory bst = Strings.toString(ts);
        uri = Base64.encode(
            bytes(
                abi.encodePacked(
                    '<svg width="375" height="96" xmlns="http://www.w3.org/2000/svg">',
                        '<g transform="translate(17,0)">',
                            '<g>',
                                buildDigits(getFirstDigit(getHour())),
                            '</g>',
                            '<g>',
                                '<path d="M66,8L70,4L98,4L102,8L98,12L70,12L66,8z"></path>',
                                '<path d="M64,10L68,14L68,42L64,46L60,42L60,14L64,10z"></path>',
                                '<path d="M104,10L108,14L108,42L104,46L100,42L100,14L104,10z"></path>',
                                '<path d="M66,48L70,44L98,44L102,48L98,52L70,52L66,48z"></path>',
                                '<path d="M64,50L68,54L68,82L64,86L60,82L60,54L64,50z"></path>',
                                '<path d="M104,50L108,54L108,82L104,86L100,82L100,54L104,50z"></path>',
                                '<path d="M66,88L70,84L98,84L102,88L98,92L70,92L66,88z"></path>',
                            '</g>',
                            '<g>',
                                '<circle r="4" cx="117" cy="28"></circle>',
                                '<circle r="4" cx="117" cy="68"></circle>',
                            '</g>',
                        '</g>',
                    "</svg>"
                )
            )
        );
    }

    // Add all the content to the contract
    function AddPreSets () private {

        digitsBuild[0] = [1,2,3,5,6,7];
        digitsBuild[1] = [3,6];
        digitsBuild[2] = [1,3,4,5,7];
        digitsBuild[3] = [1,3,4,6,7];
        digitsBuild[4] = [2,4,3,6];
        digitsBuild[5] = [1,2,4,6,7];
        digitsBuild[6] = [1,2,4,5,6,7];
        digitsBuild[7] = [1,3,6];
        digitsBuild[8] = [1,2,3,4,5,6,7];
        digitsBuild[9] = [1,2,3,4,6,7];

        svgContent[1][1] = '<path d="M10,8L14,4L42,4L46,8L42,12L14,12L10,8z"></path>';
        svgContent[1][2] = '<path d="M8,10L12,14L12,42L8,46L4,42L4,14L8,10z"></path>';
        svgContent[1][3] = '<path d="M48,10L52,14L52,42L48,46L44,42L44,14L48,10z"></path>';
        svgContent[1][4] = '<path d="M10,48L14,44L42,44L46,48L42,52L14,52L10,48z"></path>';
        svgContent[1][5] = '<path d="M8,50L12,54L12,82L8,86L4,82L4,54L8,50z"></path>';
        svgContent[1][6] = '<path d="M48,50L52,54L52,82L48,86L44,82L44,54L48,50z"></path>';
        svgContent[1][7] = '<path d="M10,88L14,84L42,84L46,88L42,92L14,92L10,88z"></path>';

        svgContent[2][1] = '<path d="M66,8L70,4L98,4L102,8L98,12L70,12L66,8z"></path>';
        svgContent[2][2] = '<path d="M64,10L68,14L68,42L64,46L60,42L60,14L64,10z"></path>';
        svgContent[2][3] = '<path d="M104,10L108,14L108,42L104,46L100,42L100,14L104,10z"></path>';
        svgContent[2][4] = '<path d="M66,48L70,44L98,44L102,48L98,52L70,52L66,48z"></path>';
        svgContent[2][5] = '<path d="M64,50L68,54L68,82L64,86L60,82L60,54L64,50z"></path>';
        svgContent[2][6] = '<path d="M104,50L108,54L108,82L104,86L100,82L100,54L104,50z"></path>';
        svgContent[2][7] = '<path d="M66,88L70,84L98,84L102,88L98,92L70,92L66,88z"></path>';
        
        /*
        svgContent[3][1] = '<path d="M134,8L138,4L166,4L170,8L166,12L138,12L134,8z"></path>';
        svgContent[3][2] = '<path d="M132,10L136,14L136,42L132,46L128,42L128,14L132,10z"></path>';
        svgContent[3][3] = '<path d="M172,10L176,14L176,42L172,46L168,42L168,14L172,10z"></path>';
        svgContent[3][4] = '<path d="M134,48L138,44L166,44L170,48L166,52L138,52L134,48z"></path>';
        svgContent[3][5] = '<path d="M132,50L136,54L136,82L132,86L128,82L128,54L132,50z"></path>';
        svgContent[3][6] = '<path d="M172,50L176,54L176,82L172,86L168,82L168,54L172,50z"></path>';
        svgContent[3][7] = '<path d="M134,88L138,84L166,84L170,88L166,92L138,92L134,88z"></path>';

        svgContent[4][1] = '<path d="M190,8L194,4L222,4L226,8L222,12L194,12L190,8z"></path>';
        svgContent[4][2] = '<path d="M188,10L192,14L192,42L188,46L184,42L184,14L188,10z"></path>';
        svgContent[4][3] = '<path d="M228,10L232,14L232,42L228,46L224,42L224,14L228,10z"></path>';
        svgContent[4][4] = '<path d="M190,48L194,44L222,44L226,48L222,52L194,52L190,48z"></path>';
        svgContent[4][5] = '<path d="M188,50L192,54L192,82L188,86L184,82L184,54L188,50z"></path>';
        svgContent[4][6] = '<path d="M228,50L232,54L232,82L228,86L224,82L224,54L228,50z"></path>';
        svgContent[4][7] = '<path d="M190,88L194,84L222,84L226,88L222,92L194,92L190,88z"></path>';

        svgContent[5][1] = '<path d="M258,8L262,4L290,4L294,8L290,12L262,12L258,8z"></path>';
        svgContent[5][2] = '<path d="M256,10L260,14L260,42L256,46L252,42L252,14L256,10z"></path>';
        svgContent[5][3] = '<path d="M296,10L300,14L300,42L296,46L292,42L292,14L296,10z"></path>';
        svgContent[5][4] = '<path d="M258,48L262,44L290,44L294,48L290,52L262,52L258,48z"></path>';
        svgContent[5][5] = '<path d="M256,50L260,54L260,82L256,86L252,82L252,54L256,50z"></path>';
        svgContent[5][6] = '<path d="M296,50L300,54L300,82L296,86L292,82L292,54L296,50z"></path>';
        svgContent[5][7] = '<path d="M258,88L262,84L290,84L294,88L290,92L262,92L258,88z"></path>';

        svgContent[6][1] = '<path d="M314,8L318,4L346,4L350,8L346,12L318,12L314,8z"></path>';
        svgContent[6][2] = '<path d="M312,10L316,14L316,42L312,46L308,42L308,14L312,10z"></path>';
        svgContent[6][3] = '<path d="M352,10L356,14L356,42L352,46L348,42L348,14L352,10z"></path>';
        svgContent[6][4] = '<path d="M314,48L318,44L346,44L350,48L346,52L318,52L314,48z"></path>';
        svgContent[6][5] = '<path d="M312,50L316,54L316,82L312,86L308,82L308,54L312,50z"></path>';
        svgContent[6][6] = '<path d="M352,50L356,54L356,82L352,86L348,82L348,54L352,50z"></path>';
        svgContent[6][7] = '<path d="M314,88L318,84L346,84L350,88L346,92L318,92L314,88z"></path>'; */
    }

    function getTotalSupply() public view returns (uint256 ts) {
        ts = totalSupply;
    }

    //TIMESTAMP
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

    function getSVGContent (uint256 index, uint256 num) public view returns (string memory) {
        return svgContent[index][num];
    }

    function getFirstDigit (uint256 digit) public pure returns (uint256 firstDigit) {
        firstDigit = digit % 10;
    }
    
    function getSecondDigit (uint256 digit) public pure returns (uint256 secondDigit) {
        secondDigit = digit / 10 % 10;
    }

    /**
    *   return an array of numbers 
    */
    function getDigitsBuild (uint256 digit) public view returns (uint256[] memory digitsArr) {
        digitsArr = digitsBuild[digit];
    }

    function getHour() public view returns (uint256 hour) {
        hour = (block.timestamp/ 60 / 60) % 24;
    }

    function getMinute() public view returns (uint256 minute) {
        minute = ((block.timestamp / 60) % 60);
    }

    function getSecond() public view returns (uint256 second) {
        second = (block.timestamp % 60);
    }

    /* function buildDigits(uint256 digit) public view returns (string memory hour_) {
        uint256[] memory digitsArr = getDigitsBuild(digit);
        string memory temp;
        for (uint256 index = 0; index < digitsArr.length; index++) {
            temp = getSVGContent(index, digitsArr[index]);
        }
       hour_ = string(abi.encodePacked(temp));
    } */

    function buildDigits(uint256 digit) public view returns (string memory hour_) {
        uint256[] memory digitsArr = getDigitsBuild(digit);

        hour_ = string(abi.encodePacked(digitsArr));
    }
}