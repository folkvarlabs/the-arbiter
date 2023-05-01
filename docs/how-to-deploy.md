# How to Deploy

This guide provides an overview of how to deploy the flash loan contracts to a testnet or mainnet.

## Prerequisites

1. Install [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/).
2. Install [Truffle](https://www.trufflesuite.com/) globally: `npm install -g truffle`
3. Clone the repository and install the necessary dependencies.

## Deploying the Contracts

1. Create a `.env` file in the project's root directory with the following content:

```bash
MNEMONIC=your_12_word_mnemonic
INFURA_API_KEY=your_infura_api_key
```


Replace `your_12_word_mnemonic` with your wallet's 12-word mnemonic and `your_infura_api_key` with your Infura API key.

2. Configure the `truffle-config.js` file for the desired network (testnet or mainnet).
3. Compile the smart contracts: `truffle compile`
4. Deploy the smart contracts to the desired network: `truffle migrate --network network_name`

Replace `network_name` with the name of the network you configured in the `truffle-config.js` file.

After deploying the contracts, take note of the contract addresses for future reference and interaction.
