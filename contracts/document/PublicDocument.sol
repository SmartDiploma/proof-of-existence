pragma solidity ^0.4.16;

import "../core/BasicDocument.sol";
import "../core/RevokableDocument.sol";
import "../core/TransfarableDocument.sol";

/**
 * @title PublicDocument
 * @dev Anyone who knows the contract address can issue and revoke documents.
 */
contract PublicDocument is BasicDocument, RevokableDocument, TransfarableDocument {
    /**
     * @dev Returns document's information.
     * @dev Can be called by anyone who knows the contract address.
     */
    function getDocument(bytes32 document) public constant returns (address, address, uint256) {
        return (documents[document].issuer, documents[document].recipient, documents[document].block);
    }
    
    /**
     * @dev Verifies if the document belongs to the given recipient.
     */
    function verifyDocument(address recipient, bytes32 document) public constant returns (bool) {
        return recipient != address(0) && documents[document].recipient == recipient;
    }

    /**
     * @dev This contract accepts donations.
     */
    function () payable public {
        require(msg.value > 0);
        owner.transfer(msg.value);
    }

    /**
     * Forwards all funds to the owner account.
     */
    function widthraw() onlyOwner external {
        owner.transfer(this.balance);
    }
}