#!/bin/bash

# Update package list and install necessary packages
sudo apt-get update
sudo apt-get install -y nodejs npm unzip

# Set environment variables
echo "Enter your 12-word mnemonic:"
read MNEMONIC
echo "Enter your Infura API key:"
read INFURA_API_KEY

echo "export MNEMONIC=$MNEMONIC" >> ~/.bashrc
echo "export INFURA_API_KEY=$INFURA_API_KEY" >> ~/.bashrc
source ~/.bashrc

# Create a new directory for the project
mkdir flash-loan-arb
cd flash-loan-arb

# Download the project files (assuming they are hosted on a file server)
echo "Enter the URL of the zipped project files:"
read PROJECT_URL
wget $PROJECT_URL -O flash-loan-arb.zip

# Unzip the project files
unzip flash-loan-arb.zip
rm flash-loan-arb.zip

# Install the project dependencies
npm install

# Compile the smart contracts
npx truffle compile

# Deploy the smart contracts to the desired network
echo "Enter the network name you configured in truffle-config.js:"
read NETWORK_NAME
npx truffle migrate --network $NETWORK_NAME
