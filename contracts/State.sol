// SPDX-License-Identifier: MIT
// by Hwakyeom Kim(=just-do-halee)
pragma solidity ^0.8.7;

enum StateKind {
    NONE, /* WARNING : Do not change this */
    // for room's owner
    PENDING, // waiting participant
    CONCERN, // participant joined

    // for room's participant
    EXPECTING // waiting owner's aprove
}

struct State {
    StateKind kind;
    address competitor;
    uint256 timestamp;
}

library StateFn {
    function reset(State storage state) internal {
        state.kind = StateKind.NONE;
        state.competitor = address(0x0);
        state.timestamp = 0;
    }

    function toString(State storage state) internal view returns (string memory) {
        if (state.kind == StateKind.NONE) {
            return "none";
        } else if (state.kind == StateKind.PENDING) {
            return "pending";
        } else if (state.kind == StateKind.CONCERN) {
            return "concern";
        } else if (state.kind == StateKind.EXPECTING) {
            return "expecting";
        } else {
            return "";
        }
    }
}