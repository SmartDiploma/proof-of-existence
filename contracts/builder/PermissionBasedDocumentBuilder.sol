pragma solidity ^0.4.16;

import "./Builder.sol";
import "../document/PermissionBasedDocument.sol";

contract PermissionBasedDocumentBuilder is Builder {
    function create() payable external {
        require(msg.value >= buildingCostWei);

        PermissionBasedDocument documentStorage = new PermissionBasedDocument();        
        documentStorage.transferOwnership(msg.sender);

        ContractCreated(documentStorage);
        super.processPayment();
    }
}