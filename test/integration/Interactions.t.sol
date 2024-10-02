// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployRaffle} from "script/DeployRaffle.s.sol";
import {HelperConfig, CodeConstants} from "script/HelperConfig.s.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "script/Interactions.s.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract InteractionTest is Test {
    /*//////////////////////////////////////////////////////////////
                          SUBSCRIPTION FUNDED?
    //////////////////////////////////////////////////////////////*/

    function testIfSubscriptionGetsFunds() public {}
}
