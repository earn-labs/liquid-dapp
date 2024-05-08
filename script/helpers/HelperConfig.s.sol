// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {ERC20Token} from "../../src/ERC20Token.sol";
import {NFTContract} from "./../../src/NFTContract.sol";

contract HelperConfig is Script {
    // deployment arguments
    address public constant TOKENOWNER =
        0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    string public constant NAME = "Liquid";
    string public constant SYMBOL = "LIQUID";
    string public constant BASE_URI =
        "ipfs://bafybeieybuwkv3kq4qgwpnpbm3lof6wgfn4xzuvwrmml4niotc6sjz6qh4/";
    string public constant CONTRACT_URI =
        "ipfs://bafybeie2a65kn5rhd7dzt3wnqxwgjpwl2gsaeyzhozfsaxzlcgzq7vtpjq/contractMetadata";
    uint256 public constant MAX_SUPPLY = 1000;

    uint256 public constant TOKEN_FEE = 500 ether;
    uint256 public constant ETH_FEE = 0;
    uint96 public constant ROYALTY = 500;

    // chain configurations
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        NFTContract.ConstructorArguments args;
    }

    constructor() {
        if (
            block.chainid == 1 /** ethereum */ ||
            block.chainid == 8453 /** base */
        ) {
            activeNetworkConfig = getMainnetConfig();
        } else if (
            block.chainid == 11155111 /** sepolia */ ||
            block.chainid == 84532 /** base sepolia */
        ) {
            activeNetworkConfig = getTestnetConfig();
        } else {
            activeNetworkConfig = getAnvilConfig();
        }
    }

    function getActiveNetworkConfigStruct()
        public
        view
        returns (NetworkConfig memory)
    {
        return activeNetworkConfig;
    }

    function getMainnetConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                args: NFTContract.ConstructorArguments({
                    name: NAME,
                    symbol: SYMBOL,
                    owner: 0x4671a210C4CF44C43dC5E44DAf68e64D46cdc703,
                    tokenFee: TOKEN_FEE,
                    ethFee: ETH_FEE,
                    feeAddress: 0x0cf66382d52C2D6c1D095c536c16c203117E2B2f,
                    tokenAddress: 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913,
                    baseURI: BASE_URI,
                    contractURI: CONTRACT_URI,
                    maxSupply: MAX_SUPPLY,
                    royaltyNumerator: ROYALTY
                })
            });
    }

    function getTestnetConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                args: NFTContract.ConstructorArguments({
                    name: NAME,
                    symbol: SYMBOL,
                    owner: 0x11F392Ba82C7d63bFdb313Ca63372F6De21aB448,
                    tokenFee: TOKEN_FEE,
                    ethFee: ETH_FEE,
                    feeAddress: 0x11F392Ba82C7d63bFdb313Ca63372F6De21aB448,
                    tokenAddress: 0xdcdF94053C9fCfe5BB7525c060B47Bbc6d166ce3,
                    baseURI: BASE_URI,
                    contractURI: CONTRACT_URI,
                    maxSupply: MAX_SUPPLY,
                    royaltyNumerator: ROYALTY
                })
            });
    }

    function getAnvilConfig() public returns (NetworkConfig memory) {
        // Deploy mock contract
        vm.startBroadcast();
        ERC20Token token = new ERC20Token(TOKENOWNER);
        vm.stopBroadcast();

        return
            NetworkConfig({
                args: NFTContract.ConstructorArguments({
                    name: NAME,
                    symbol: SYMBOL,
                    owner: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
                    tokenFee: TOKEN_FEE,
                    ethFee: ETH_FEE,
                    feeAddress: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
                    tokenAddress: address(token),
                    baseURI: BASE_URI,
                    contractURI: CONTRACT_URI,
                    maxSupply: MAX_SUPPLY,
                    royaltyNumerator: ROYALTY
                })
            });
    }
}
