// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./contracts/token/ERC20/ERC20.sol";
import "./contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "./contracts/access/Ownable.sol";
import "./contracts/security/Pausable.sol";

contract BattleTanksCity is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable {
    constructor() ERC20("BattleTanksCity", "TNK-VIP") {
        _mint(msg.sender, 20000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
