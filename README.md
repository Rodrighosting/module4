# Module 4

This program is for creating a smart contract project that implements minting, transferring, redeeming tokens, checking token balances, and burning tokens.

# Description

Avalanche is a blockchain platform that provides decentralized apps and blockchain networks. Avalanche is designed to address the scalability issues of conventional blockchain systems. The platform offers exceptional transaction speed and finality in milliseconds because of the consensus protocol, Avalanche. The adaptable architecture of Avalanche complements this scalability by enabling developers to design customized blockchain networks, or subnets, that satisfy particular needs and use cases.

# Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `project.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Degen is ERC20, Ownable {
    uint256[] internal No_Ids;

    mapping(uint256 => VALUE) public items;

    struct VALUE {
        string ching;
        uint256 value;
    }

    constructor(address ching)
        ERC20("Degen", "DGN")
        Ownable(ching)
    {
        _mint(msg.sender, 1000);
    }

    function createItem(string memory _ching, uint256 _amount) external onlyOwner {
        VALUE memory newItem = VALUE({ching: _ching, value: _amount});
        items[No_Ids.length] = newItem;
        No_Ids.push(No_Ids.length);
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function mintTo(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function Burn(address receiver, uint256 _token) public {
        _burn(receiver, _token);
    }

    function transferTo(address receiver, uint256 amount) public {
        transfer(receiver, amount);
    }

    function checkTokenBalance(address _account) public view returns (uint) {
        return balanceOf(_account);
    }

    event ItemRedeemed(address indexed player, uint256 indexed id, string itemName, uint256 itemValue);

    function redeem(uint256 id) external {
        require(items[id].value > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= items[id].value, "Insufficient balance");

        // Mint new tokens to the sender's balance
        _mint(msg.sender, items[id].value);

        emit ItemRedeemed(msg.sender, id, items[id].ching, items[id].value);

        // Remove the redeemed item from the list
        delete items[id];
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile `project.sol`" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `Degen` contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract has been deployed, you can interact with it through various functions such as minting, transferring, redeeming tokens, checking token balances, and burning tokens.

# Authors

Contributors names and contact info:

Rodrigo B. Macabudbud

# License

This project is unlicensed.
