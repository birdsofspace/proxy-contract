// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "../storage/Storage.sol";

/**
 * @author  Birds of Space
 * @title   Proxy contract
 * @dev     Contains the logic for the proxy contract
 * @notice  The proxy contract is used to call the implementation contract
 */

contract Proxy is Storage {
    address functionalAddress;

    /**
     * @notice  Creates a new proxy contract
     * @dev     Initializes the contract with the address of the implementation contract
     * @param   _functionalAddress  Address of the implementation contract
     */
    constructor(address _functionalAddress) {
        _owner = msg.sender;
        _proxyAdmin[msg.sender] = true;
        functionalAddress = _functionalAddress;
    }

    /**
     * @dev     Only admin modifier is used to prevent non-admins from calling the function
     */
    modifier onlyAdmin() {
        require(_proxyAdmin[msg.sender], "Only admins can call this function");
        _;
    }

    /**
     * @dev     Shows the address of the implementation contract
     */
    function listAdmin() internal view returns (mapping(address => bool) storage) {
        return _proxyAdmin;
    }

    /**
     * @dev     onlyAdmin modifier is used to prevent the owner from being added as an admin
     * @param   _admin  Address of the admin to be added
     */
    function addAdmin(address _admin) public onlyAdmin {
        _proxyAdmin[_admin] = true;
    }

    /**
     * @dev     onlyAdmin modifier is used to prevent the owner from being removed as an admin
     * @param   _admin  Address of the admin to be removed
     */
    function removeAdmin(address _admin) public onlyAdmin {
        require(_admin != _owner, "Cannot remove owner");
        _proxyAdmin[_admin] = false;
    }

    /**
     * @dev     Upgrades the implementation contract address
     * @param   _newAddress  New address of the implementation contract
     */
    function upgradeImplementation(address _newAddress) public onlyAdmin {
        functionalAddress = _newAddress;
    }

    /**
     * @dev     Fallback function that redirects call to the functional contract
     */
    fallback() external payable {
        address implementation = functionalAddress;
        require(functionalAddress != address(0));
        bytes memory data = msg.data; // msg.data is all info about the function call (called by the user)

        assembly {
            let result := delegatecall(
                gas(),
                implementation,
                add(data, 0x20), // add is another assembly function; this changes the format to something that delegate call can read
                mload(data), // mload is memory load
                0,
                0
            )
            let size := returndatasize()
            let ptr := mload(0x40) // ptr as in pointer
            returndatacopy(ptr, 0, size)
            switch result // result will either be 0 (as in function call failed), or 1 (function call success)
            case 0 {
                revert(ptr, size)
            } // revert if function call failed
            default {
                return(ptr, size)
            } // default means "else"; else return
        }
    }

    /**
     * @dev     Allows the contract to receive Ether.
     */
    receive() external payable {}
}
