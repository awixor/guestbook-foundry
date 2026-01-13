// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

contract Guestbook {
    struct Message {
        address sender;
        string message;
        uint256 timestamp;
    }

    Message[] public messages;

    event NewMessage(address indexed sender, string message, uint256 timestamp);

    function postMessage(string memory _message) public {
        Message memory newMessage = Message({sender: msg.sender, message: _message, timestamp: block.timestamp});

        messages.push(newMessage);

        emit NewMessage(msg.sender, _message, block.timestamp);
    }

    function getMessages(uint256 _offset, uint256 _limit) public view returns (Message[] memory) {
        if (_offset >= messages.length) {
            return new Message[](0);
        }

        uint256 range = _limit;

        if (_offset + _limit > messages.length) {
            range = messages.length - _offset;
        }

        Message[] memory pagedMessages = new Message[](range);

        for (uint256 i = 0; i < range; i++) {
            pagedMessages[i] = messages[_offset + i];
        }

        return pagedMessages;
    }

    function getTotalMessages() public view returns (uint256) {
        return messages.length;
    }
}
