pragma solidity ^0.4.16;

import "./Builder.sol";
import "../document/PrivateDocument.sol";

contract PrivateDocumentBuilder is Builder {
    function create() payable external {
        require(msg.value >= buildingCostWei);

        PrivateDocument documentStorage = new PrivateDocument();        
        documentStorage.transferOwnership(msg.sender);

        ContractCreated(documentStorage);
        super.processPayment();
    }
}