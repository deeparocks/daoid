// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC20Base.sol";

abstract contract DaoId is ERC20Base {
    // Removed state variable declarations for name, symbol, and decimals. We will override the functions instead.
    
    mapping(address => uint256) private _balances;
    uint256 private _totalSupply;

    enum Role {
        Founder,
        Recruiter,
        Steward,
        BountyHunter,
        GuildLead,
        Core,
        Infra
    }

    struct DaoIdDetail {
        Role role;
        uint256 startTime;
        uint256 endTime;
        uint8 roleLevel;
        bool isCodeContributor;
    }

    mapping(address => DaoIdDetail) public daoIdDetails;

    // Overriding the name, symbol, and decimals functions from the inherited ERC20Base
    function name() public view virtual override returns (string memory) {
        return "DaoId";
    }

    function symbol() public view virtual override returns (string memory) {
        return "DID";
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function mintWithDetails(
        address to, 
        uint256 amount, 
        Role role, 
        uint256 startTime, 
        uint256 endTime, 
        uint8 roleLevel,
        bool isCodeContributor // added the missing argument
    ) external returns (bool) {
        _mint(to, amount);
        
        DaoIdDetail memory detail = DaoIdDetail({
            role: role,
            startTime: startTime,
            endTime: endTime,
            roleLevel: roleLevel,
            isCodeContributor: isCodeContributor // set the value for the new argument
        });

        daoIdDetails[to] = detail;
        return true;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address, uint256) public override returns (bool) {
        revert("DaoIdToken: Transfer is not allowed");
    }

    // ... additional standard ERC20 methods, but ensure that 'transferFrom', 
    // 'approve', and any other transfer-related methods also revert.
}
