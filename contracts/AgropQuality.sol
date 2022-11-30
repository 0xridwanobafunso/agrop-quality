// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./interfaces/IAgropQuality.sol";
import "./interfaces/IAgrop.sol";

contract AgropQuality is IAgrop, IAgropQuality {
    /// @dev
    /// constructor
    constructor() {}

    // @dev
    /// validate crop options input
    function calculateQuality(CropOptionsForQuality memory _crop)
        external
        pure
        returns (uint256)
    {
        uint256 qualitypercent = 0;

        // calculate quality
        // _crop.soil, _crop.climate,_crop.tools,_crop.season,_crop.daytime, and _crop.store

        // pepper
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("pepper"))) {
            // soil
            bool soil = keccak256(bytes(_crop.soil)) ==
                keccak256(bytes("sandy")) ||
                keccak256(bytes(_crop.soil)) == keccak256(bytes("loamy"));

            // climate
            uint256 from = _crop.climate[0];
            uint256 to = _crop.climate[1];
            bool climate = from >= 16 && to <= 21;

            // tools

            // season
            bool season = keccak256(bytes(_crop.season)) ==
                keccak256(bytes("raining"));

            // daytime
            bool daytime = keccak256(bytes(_crop.daytime)) ==
                keccak256(bytes("morning"));

            // store
            bool store = keccak256(bytes(_crop.store)) ==
                keccak256(bytes("refrigerator"));

            if (soil) qualitypercent += 20;
            if (climate) qualitypercent += 20;
            if (season) qualitypercent += 20;
            if (daytime) qualitypercent += 20;
            if (store) qualitypercent += 20;
        }

        // vegetables
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("vegetables"))) {
            // soil
            bool soil = keccak256(bytes(_crop.soil)) ==
                keccak256(bytes("loamy"));

            // climate
            uint256 from = _crop.climate[0];
            uint256 to = _crop.climate[1];
            bool climate = from >= 0 && to <= 21;

            // tools

            // season
            bool season = keccak256(bytes(_crop.season)) ==
                keccak256(bytes("raining"));

            // daytime
            bool daytime = keccak256(bytes(_crop.daytime)) ==
                keccak256(bytes("morning"));

            // store
            bool store = keccak256(bytes(_crop.store)) ==
                keccak256(bytes("refrigerator"));

            if (soil) qualitypercent += 20;
            if (climate) qualitypercent += 20;
            if (season) qualitypercent += 20;
            if (daytime) qualitypercent += 20;
            if (store) qualitypercent += 20;
        }

        // fruits
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("fruits"))) {
            // soil
            bool soil = keccak256(bytes(_crop.soil)) ==
                keccak256(bytes("loamy"));

            // climate
            uint256 from = _crop.climate[0];
            uint256 to = _crop.climate[1];
            bool climate = from >= 0 && to <= 21;

            // tools

            // season
            bool season = keccak256(bytes(_crop.season)) ==
                keccak256(bytes("raining")) ||
                keccak256(bytes(_crop.season)) == keccak256(bytes("dry"));

            // daytime
            bool daytime = keccak256(bytes(_crop.daytime)) ==
                keccak256(bytes("night"));

            // store
            bool store = keccak256(bytes(_crop.store)) ==
                keccak256(bytes("refrigerator"));

            if (soil) qualitypercent += 20;
            if (climate) qualitypercent += 20;
            if (season) qualitypercent += 20;
            if (daytime) qualitypercent += 20;
            if (store) qualitypercent += 20;
        }

        // maize
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("maize"))) {
            // soil
            bool soil = keccak256(bytes(_crop.soil)) ==
                keccak256(bytes("sandy")) ||
                keccak256(bytes(_crop.soil)) == keccak256(bytes("loamy"));

            // climate
            uint256 from = _crop.climate[0];
            uint256 to = _crop.climate[1];
            bool climate = from >= 21 && to <= 27;

            // tools

            // season
            bool season = keccak256(bytes(_crop.season)) ==
                keccak256(bytes("raining"));

            // daytime
            bool daytime = keccak256(bytes(_crop.daytime)) ==
                keccak256(bytes("morning"));

            // store
            bool store = keccak256(bytes(_crop.store)) ==
                keccak256(bytes("barn"));

            if (soil) qualitypercent += 20;
            if (climate) qualitypercent += 20;
            if (season) qualitypercent += 20;
            if (daytime) qualitypercent += 20;
            if (store) qualitypercent += 20;
        }

        // cassava
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("cassava"))) {
            qualitypercent += 100;
        }

        // cocoa
        if (keccak256(bytes(_crop.family)) == keccak256(bytes("cocoa"))) {
            qualitypercent += 100;
        }

        return qualitypercent;
    }
}
