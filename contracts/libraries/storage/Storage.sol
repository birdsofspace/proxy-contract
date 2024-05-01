// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

/**
 * @author  Birds of Space
 * @title   Storage
 * @dev     Storage contract for the Birds of Space project.
 */

contract Storage {   
    mapping(string => uint256) _uintStorage;
    mapping(string => address) _addressStorage;
    mapping(string => bool) _boolStorage;
    mapping(string => string) _stringStorage;
    mapping(string => bytes4) _bytesStorage;
    mapping(address => bool) _proxyAdmin;
    address public _owner;
    bool public _initialized;   
}
