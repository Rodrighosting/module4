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

    function mint(address to, uint256 amount) public onlyOwner {
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

        _transfer(msg.sender, address(this), items[id].value);

        emit ItemRedeemed(msg.sender, id, items[id].ching, items[id].value);


        delete items[id];
    }
}
