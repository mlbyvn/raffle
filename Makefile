-include .env 

.PHONY: all test deploy

build:; forge build

test:; forge test

install:; forge install cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install foundry-rs/forge-std --no-commit && forge install transmissions11/solmate@v6 --no-commit

deploy-sepolia:
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT_NAME) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

deploy-anvil:
	@forge script script/DeployRaffle.s.sol:DeployRaffle

createSubscription: 
	@forge script script/Interactions.s.sol:CreateSubscription $(SEPOLIA_RPC_URL) 

fundSubscription: 
	@forge script script/Interactions.s.sol:FundSubscription $(SEPOLIA_RPC_URL) 

addConsumer: 
	@forge script script/Interactions.s.sol:AddConsumer $(SEPOLIA_RPC_URL) 