// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract Twitter{
    uint16 constant Max_tweet=280;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint likes;
    }
mapping (address =>Tweet[]) public  tweets;
function createTweet(string memory tweet)public{
    require(bytes(tweet).length <= Max_tweet, "Tweet is too long Bro!");

    Tweet memory newTweet=Tweet({
        author:msg.sender,
        content:tweet,
        timestamp:block.timestamp,
        likes:0
    });
    tweets[msg.sender].push(newTweet);
}
function getTweet(uint256 i) public view returns(Tweet memory){
return tweets[msg.sender][i];
}
function getAllTweet(address owner) public view returns(Tweet[] memory){
return tweets[owner];
}
}


