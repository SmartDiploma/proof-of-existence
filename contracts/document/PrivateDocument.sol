pragma solidity ^0.4.16;

import "./PublicDocument.sol";

/**
 * @title PrivateDocument
 * @dev Only contract's owner can issue and revoke documents.
 */
contract PrivateDocument is PublicDocument {
    /**
     * @dev Issues document.
     * @dev Can be called by the current onwner only.
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(msg.sender == owner);
        super.issueDocument(recipient, document);
    }

    /**
     * @dev Revokes document and sets the recipient to 0x0.
     * @dev Can be called by the current onwner only.
     */
    function revokeDocument(address recipient, bytes32 document) public returns (bool) {
        require(msg.sender == owner);
        super.revokeDocument(recipient, document);
    }
}