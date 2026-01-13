# Guestbook Smart Contract

A simple guestbook smart contract that allows users to post messages on-chain.

## Features

- Post messages to the guestbook
- Retrieve paginated messages
- View total message count
- All messages are stored on-chain with sender address and timestamp

## Deployments

### Sepolia Testnet

- **Contract Address**: `0xb8Ee3634253dF7BCb4ed7CD656C728327499480a`
- **Explorer**: [View on Etherscan](https://sepolia.etherscan.io/address/0xb8Ee3634253dF7BCb4ed7CD656C728327499480a)

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/DeployGuestbook.s.sol:DeployGuestbook --rpc-url <your_rpc_url> --broadcast --verify
```

**Note**: Make sure to set your `PRIVATE_KEY` environment variable before deploying.

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
