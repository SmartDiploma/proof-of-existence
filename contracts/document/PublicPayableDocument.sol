pragma solidity ^0.4.16;

import "../math/SafeMath.sol";
import "./PublicDocument.sol";

/**
 * @title PublicPayableDocument
 * @dev Charges a fixed fee (goes to the contract's owner) for document issue. 
 *      Anyone who knows the contract address can issue and revoke documents.
 */
contract PublicPayableDocument is PublicDocument {
    using SafeMath for uint256;
    
    event NewPriceSet(uint256 newPrice);
    
    uint256 public issuePrice;

    /**
     * @dev Issues document for a fixed fee.
     * @dev Can be called by anyone who knows the contract address.
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(msg.value >= issuePrice);
        require(super.issueDocument(recipient, document));

        owner.transfer(issuePrice);
        if (msg.value > issuePrice)
            msg.sender.transfer(msg.value.sub(issuePrice));

        return true;
    }

    /**
     * @dev Set a fixed fee for document issue.
     */
    function setIssuePrice(uint256 newPrice) onlyOwner external {
        require(newPrice >= 0);
        
        issuePrice = newPrice;
        NewPriceSet(newPrice);
    }
}