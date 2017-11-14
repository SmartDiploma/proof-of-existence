pragma solidity ^0.4.16;

import "../core/AthorisedAccess.sol";
import "./PublicDocument.sol";

/**
 * @title PermissionBasedDocument
 * @dev Owner can authorise/deauthorise any address to allow/disallow issue and revoke documents.
 */
contract PermissionBasedDocument is PublicDocument, AthorisedAccess {
    /**
     * @dev Issues document.
     * @dev Can be called by the authorised issuer only.
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(authorisedCall());
        super.issueDocument(recipient, document);
    }

    /**
     * @dev Revokes document and sets the recipient to 0x0.
     * @dev Can be called by the authorised issuer only.
     */
    function revokeDocument(address recipient, bytes32 document) public returns (bool) {
        require(authorisedCall());
        super.revokeDocument(recipient, document);
    }
}