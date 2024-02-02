// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IShield {
    function approveStablecoin(address _token, address _contract) external;
}
