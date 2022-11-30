// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./IAgrop.sol";

interface IAgropQuality {
    // @dev
    /// validate crop options input
    function calculateQuality(IAgrop.CropOptionsForQuality memory _crop)
        external
        pure
        returns (uint256);
}
