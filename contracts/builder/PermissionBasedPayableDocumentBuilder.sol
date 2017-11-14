pragma solidity ^0.4.16;

import "./Builder.sol";
import "../document/PermissionBasedPayableDocument.sol";

contract PermissionBasedPayableDocumentBuilder is Builder {
    function create(uint256 issuePrice) payable external {
        require(msg.value >= buildingCostWei);
        require(issuePrice > 0);

        PermissionBasedPayableDocument documentStorage = new PermissionBasedPayableDocument();  
        documentStorage.setIssuePrice(issuePrice);
        documentStorage.transferOwnership(msg.sender);      

        ContractCreated(documentStorage);
        super.processPayment();
    }
}