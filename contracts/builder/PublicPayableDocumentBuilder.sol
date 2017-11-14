pragma solidity ^0.4.16;

import "./Builder.sol";
import "../document/PublicPayableDocument.sol";

contract PublicPayableDocumentBuilder is Builder {
    function create(uint256 issuePrice) payable external {
        require(msg.value >= buildingCostWei);
        require(issuePrice > 0);

        PublicPayableDocument documentStorage = new PublicPayableDocument();     
        documentStorage.setIssuePrice(issuePrice);
        documentStorage.transferOwnership(msg.sender);      

        ContractCreated(documentStorage);
        super.processPayment();
    }
}