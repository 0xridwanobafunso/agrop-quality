// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface IAgrop {
    struct CropOptionsForQuality {
        string family;
        string soil;
        uint256[] climate;
        string[] tools;
        string season;
        string daytime;
        string store;
    }
}
