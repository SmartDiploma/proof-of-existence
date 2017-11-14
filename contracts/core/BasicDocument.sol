pragma solidity ^0.4.16;

import "../ownership/Ownable.sol";

/**
 * @title Document
 * @dev This basic contract allows to issue documents.
 */
contract BasicDocument is Ownable {
    event DocumentIssued(address recipient, bytes32 document);

    struct DocumentBody {
        address issuer;
        address recipient;
        uint256 block;
    }

    mapping (bytes32 => DocumentBody) documents;

    /**
     * @dev Issues document.
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(documents[document].issuer == address(0));

        documents[document].issuer = msg.sender;
        documents[document].recipient = recipient;
        documents[document].block = block.number;

        DocumentIssued(recipient, document);

        return true;
    }
}