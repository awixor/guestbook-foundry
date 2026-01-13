// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

import {Script, console} from "forge-std/Script.sol";
import {Guestbook} from "../src/Guestbook.sol";

contract DeployGuestbook is Script {
    function run() external returns (Guestbook) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        Guestbook guestbook = new Guestbook();

        vm.stopBroadcast();

        console.log("Guestbook deployed at:", address(guestbook));

        return guestbook;
    }
}
