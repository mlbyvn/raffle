# Raffle

A fair raffle that requests a random number from Chainlink VRF, also implements Chainlink Automation. Contract address on etherscan: [0xFbf1153bD3BD0A244b5C6A7461DE542FD8C93830](https://sepolia.etherscan.io/address/0xFbf1153bD3BD0A244b5C6A7461DE542FD8C93830). If you enter the raffle and the winner is not picked automatically- there is no more LINK on the Chainlink Automation subscription.

## Description

Functionality: 
* Raffle.sol:
    * function enterRaffle(): Allows a participant to enter the raffle by paying an entrance fee if the raffle is open.
* PriceConverter.sol:
    * function checkUpkeep(): is called by performUpkeep and checks if it is time to pick a winner.
    * function performUpkeep(): is automatically called by Chainlink, if upkeep is needed - changes the raffle state, requests a random number from chainlink vrf and calls fulfillRandomWords.
    * function fulfillRandomWords(): picks a winner based on a function using random number and sends the raffle prize pool to the winner address.

## Getting Started

### Dependencies

* [foundry](https://github.com/foundry-rs) 
* [Node on Alchemy](https://dashboard.alchemy.com/)
* [Connect wallet to Chainlink VRF](https://vrf.chain.link/)
* [Connect wallet to Chainlink Automation](https://automation.chain.link/) 
* [Etherscan](https://etherscan.io/) api (optional)
* 1. Run to install all libraries:
```
make install
```
* 2. Change the account (metamask wallet) address in HelperConfig.s.sol getSepoliaEthConfig() to enable testing on sepolia.
* 3. Get a subscriptionId (either manually at [Chainlink VRF](https://vrf.chain.link/) or by running 'make createSubscription') and change it in HelperConfig.s.sol getSepoliaEthConfig().
* 4. When the contract is deployed, it is needed to register a new upkeep at [Chainlink Automation](https://automation.chain.link/)

### Installing

* Add an .env file, in order to be able to deploy on sepolia using makefile
    * SEPOLIA_RPC_URL: sepolia rpc url 
    * ETHERSCAN_API_KEY: etherscan api key
    * ACCOUNT_NAME: pre-setup account (cast wallet import)

### Executing program

* Build:
```
make build
```
* Tests on anvil:
```
make test
```
* Tests on sepolia:
```
forge test --fork-url $SEPOLIA_RPC_URL
```
* Deploy on anvil:
```
make deploy-anvil
```
* Create subscription on Chainlink VRF:
```
make createSubscription
```
* Fund the created subscription:
```
make fundSubscription
```
* Add a consumer to Chainlink VRF (only works, when a raffle contract is deployed)
```
make addConsumer
```
* I recommend to run 'make createSubscription', change subscriptionId in HelperConfig.s.sol getSepoliaEthConfig(), and then run the following command to deploy on sepolia:
```
make deploy-sepolia
```
It will automatically fund the subscription, deploy a raffle contract and add a consumer.

## Authors

Aleksandr Rybin  

## Version History

* 0.1
    * Initial Release
