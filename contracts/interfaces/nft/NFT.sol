// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * @title NFT interface.
 * @dev Interface of the NFT contract.
 */
struct Attributes {
    string uniqueAttribute;
    uint8 speice;
    uint8 rarity;
    uint8 cannon;
    uint8 laser;
    uint8 bomb;
    uint8 shields;
    uint8 armour;
    uint8 health;
    bool set;
}

interface nftTokenURI{
    function getTokenURI(uint256 _tokenId,Attributes memory NFTData, uint level) external view returns (string memory);
}