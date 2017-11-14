# Smart contract to prove the existence of documents

This contract allows you and your organisation to store documents unique identifiers in the Ethereum blockchain to prove their existance. The key advantages are anonymity, privacy, and getting a decentralized proof which can't be erased or modified by anyone (third parties or governments).

## How it works

You may use ready to work builders to setup your smart contract via transaction, without compile and deploy process.

Builder name and description | Builder address | Service fee | Abi for created contract
-----------------------------|-----------------|-------------|-------------------------
`PublicDocumentBuilder` — anyone who knows the contract address can issue and revoke documents. |[0x36f858d51efd7a560e280C94bDC60970E4Ee47B6](https://etherscan.io/address/0x36f858d51efd7a560e280C94bDC60970E4Ee47B6)| 0.1 ETH |[PublicDocument.json](/build/contracts/PublicDocument.json)
`PrivateDocumentBuilder` — only contract's owner can issue and revoke documents. |[0x38e46c0cfca6636084ae33629673de14d36ae44c](https://etherscan.io/address/0x38e46c0cfca6636084ae33629673de14d36ae44c)| 0.1 ETH |[PrivateDocument.json](/build/contracts/PrivateDocument.json)
`PermissionBasedDocumentBuilder` — owner can authorise/deauthorise any address to allow/disallow issue and revoke documents. |[0x22461c5b6b1363ff49e504b623e322a1717B4047](https://etherscan.io/address/0x22461c5b6b1363ff49e504b623e322a1717B4047)| 0.1 ETH |[PermissionBasedDocument.json](/build/contracts/PermissionBasedDocument.json)
`PublicPayableDocumentBuilder` — charges a fixed fee (goes to the contract's owner) for document issue. Anyone who knows the contract address can issue and revoke documents. |[0xd909029abbd14c2ca52369979adf102f4d16d393](https://etherscan.io/address/0xd909029abbd14c2ca52369979adf102f4d16d393)| 0.1 ETH |[PublicPayableDocument.json](/build/contracts/PublicPayableDocument.json)
`PermissionBasedPayableDocumentBuilder` — charges a fixed fee (goes to the contract's owner) for document issue. Owner can authorise/deauthorise any address to allow/disallow issue and revoke documents. |[0x7cBcE162af4986F49c9ca6eE675F582EB5106f26](https://etherscan.io/address/0x7cBcE162af4986F49c9ca6eE675F582EB5106f26)| 0.1 ETH |[PermissionBasedPayableDocument.json](/build/contracts/PermissionBasedPayableDocument.json)

## Usage

- `issueDocument` issues a `document` to a `recipient`. Fires `DocumentIssued` event.
- `revokeDocument` revokes a `document` and sets a recipient as 0x0. Fires `DocumentRevoked` event.
- `transferDocument` transfers a `document` from the current `owner` to a new `recipient`. Fires `DocumentTransfered` event.
- `verifyDocument` verifies if the `document` belongs to the given `recipient`.
- `getDocument` returns `document's` information.
- `setIssuePrice` sets a fixed fee for document issue (only payable contracts). Fires `NewPriceSet` event.
- `authorise` authorises new `issuer` (trusted ethereum address) to issue and revoke documents. Fires `Athorised` event.
- `deauthorise` deathorises `issuer`. Fires `Deathorised` event.
- `isAuthorised` indicates whether `issuer` has been authorised.
- `transferOwnership` allows the current owner to transfer control of the contract to a `newOwner`. Fires `OwnershipTransferred` event.