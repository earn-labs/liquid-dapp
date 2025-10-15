# LIQUID DAPP SMART CONTRACT 🔥

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?style=for-the-badge)
![Forge](https://img.shields.io/badge/Forge-v0.2.0-blue?style=for-the-badge)


<!-- ABOUT THE PROJECT -->
## About The Project

Smart contract inheriting from ERC721A with a native and ERC20 token fee for minting including full deployment/testing suite using Foundry.

### Smart Contracts Testnet

**Payment Token Contract**  
https://sepolia.basescan.org/address/0xdcdf94053c9fcfe5bb7525c060b47bbc6d166ce3

**NFT Contract**    
https://sepolia.basescan.org/address/0x9b5a03340a9778a02f24dfa7ea2f83a90379738d

### Smart Contracts Mainnet

**Payment Token Contract**   
https://basescan.org/address/0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913

**NFT Contract**  
https://basescan.org/address/0x0528c4dfc247ea8b678d0ca325427c4ca639dec2


<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/earn-labs/liquid-dapp.git
   ```
2. Navigate to the project directory
   ```sh
   cd liquid-dapp/contracts
   ```
3. Install Forge submodules
   ```sh
   forge install
   ```

### Usage

#### Compiling
```sh
forge compile
```

#### Testing locally

Run local tests:  
```sh
forge test
```

Run test with bsc mainnet fork:
1. Start local test environment
    ```sh
    make fork
    ```
2. Run fork tests
    ```sh
    forge test
    ```

#### Deploy to testnet

1. Create test wallet using keystore. Enter private key of test wallet when prompted.
    ```sh
    cast wallet import <KeystoreName> --interactive
    ```
    Update the Makefile accordingly.

2. Deploy to testnet
    ```sh
    make deploy-testnet
    ```

#### Deploy to mainnet
1. Create deployer wallet using keystore. Enter private key of deployer wallet when prompted.
    ```sh
    cast wallet import <KeystoreName> --interactive
    ```
    Update the Makefile accordingly.

2. Deploy to mainnet
    ```sh
    make deploy-mainnet
    ```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- ACKNOWLEDGMENTS -->
<!-- ## Acknowledgments -->

