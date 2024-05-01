// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../storage/Storage.sol";

abstract contract Context is Storage {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}