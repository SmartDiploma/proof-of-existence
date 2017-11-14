pragma solidity ^0.4.16;

import "../ownership/Ownable.sol";

/**
 * @title AthorisedAccess
 * @dev This contract allows to organise a permission based access.
 */
contract AthorisedAccess is Ownable {
    event Athorised(address sender, address issuer);
    event Deathorised(address sender, address issuer);

    mapping (address => bool) issuers;

    /**
     * @dev Throws if called by any account other than the athorised issuer.
     * @notice Owner is not authorised by default.
    */
    function authorisedCall() internal constant returns (bool) {
        require(isAuthorised(msg.sender));
        return true;
    }
    
    /**
     * @dev Authorises a new issuer (trusted ethereum address) to issue and revoke documents.
     */
    function authorise(address issuer) onlyOwner external returns (bool) {
        issuers[issuer] = true;
        Athorised(msg.sender, issuer);

        return true;
    }

    /**
     * @dev Deauthorises existing issuer.
     */
    function deauthorise(address issuer) onlyOwner external returns (bool) {
        issuers[issuer] = false;
        Deathorised(msg.sender, issuer);

        return true;
    }

    /**
     * Indicates whether issuer has been authorised.
     */
    function isAuthorised(address issuer) public constant returns (bool) {
        return issuers[issuer];
    }
}