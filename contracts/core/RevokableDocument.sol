pragma solidity ^0.4.16;

import "./BasicDocument.sol";

/**
 * @title RevokableDocument
 * @dev This contract supports revokable documents.
 */
contract RevokableDocument is BasicDocument {
    event DocumentRevoked(address recipient, bytes32 document);

    /**
     * @dev Revokes existing document and sets the recipient to 0x0.
     */
    function revokeDocument(address recipient, bytes32 document) public returns (bool) {
        require(documents[document].recipient == recipient);
        documents[document].recipient = address(0);

        DocumentRevoked(recipient, document);

        return true;
    }
}