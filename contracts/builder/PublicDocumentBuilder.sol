pragma solidity ^0.4.16;

import "./Builder.sol";
import "../document/PublicDocument.sol";

contract PublicDocumentBuilder is Builder {
    function create() payable external {
        require(msg.value >= buildingCostWei);

        PublicDocument documentStorage = new PublicDocument();        
        documentStorage.transferOwnership(msg.sender);

        ContractCreated(documentStorage);
        super.processPayment();
    }
}