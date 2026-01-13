// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

import {Test, console} from "forge-std/Test.sol";
import {Guestbook} from "../src/Guestbook.sol";

contract GuestbookTest is Test {
    Guestbook public guestbook;
    address public user1 = address(0x1);
    address public user2 = address(0x2);

    // This runs before every single test function
    function setUp() public {
        guestbook = new Guestbook();
        // Labels make the trace logs easier to read
        vm.label(user1, "Alice");
        vm.label(user2, "Bob");
    }

    function test_PostMessage() public {
        string memory myMessage = "Hello from Foundry!";
        
        // Tells the VM that the next call comes from user1
        vm.prank(user1);
        guestbook.postMessage(myMessage);

        assertEq(guestbook.getTotalMessages(), 1);
        
        // Check if the content is correct
        (address sender, string memory text, uint256 timestamp) = guestbook.messages(0);
        assertEq(sender, user1);
        assertEq(text, myMessage);
        assertEq(timestamp, block.timestamp);
    }

    function test_PaginationLogic() public {
        // Post 5 messages quickly
        for (uint256 i = 0; i < 5; i++) {
            guestbook.postMessage("Message");
        }

        // Test offset and limit
        // Get 2 messages starting from index 1
        Guestbook.Message[] memory paged = guestbook.getMessages(1, 2);
        
        assertEq(paged.length, 2);
        assertEq(guestbook.getTotalMessages(), 5);
    }

    function test_PaginationOutOfBounds() public {
        guestbook.postMessage("Only one message");

        // Try to get 10 messages when only 1 exists
        Guestbook.Message[] memory paged = guestbook.getMessages(0, 10);
        
        // Should return 1 message instead of crashing
        assertEq(paged.length, 1);
    }

    function test_EmitEvent() public {
        // Expect the next call to emit this specific event
        vm.expectEmit(true, false, false, true);
        emit Guestbook.NewMessage(user1, "Event Test", block.timestamp);
        
        vm.prank(user1);
        guestbook.postMessage("Event Test");
    }
}