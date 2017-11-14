pragma solidity ^0.4.16;

import "./BasicDocument.sol";

/**
 * @title TransfarableDocument
 * @dev This contract supports documents transfer between accounts.
 */
contract TransfarableDocument is BasicDocument {
    event DocumentTransfered(address from, address to, bytes32 document);

    /**
     * @dev Transfers existing document to another account.
     */
    function transferDocument(address owner, address recipient, bytes32 document) external returns (bool) {
        require(msg.sender == owner);
        require(documents[document].recipient == owner);
        documents[document].recipient = recipient;

        DocumentTransfered(owner, recipient, document);
        
        return true;
    }
}