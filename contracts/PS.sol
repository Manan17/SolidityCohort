// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.7;

contract PS{
    address payable owner;
    address payable ram = payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    address payable lakhan = payable (0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
    uint ramMoney=0;
    uint lakhanMoney=0;
    uint timeToWithdraw = 10 seconds;
    mapping (address => uint) public family;
    mapping (address => bool) public authorizedUsers;
    mapping (address => uint) public timestamps;
    constructor() {
        owner = payable(msg.sender);
    }

    function addMoney() public payable {}

    function authorizeAUser(address accountAddress) public {
        require(owner == msg.sender, "Not Authorized");
        authorizedUsers[accountAddress] = true;
        timestamps[accountAddress] = block.timestamp;
    }

    function transferMoneyToFamily() public payable  {
        require(family[msg.sender] <= 4, "Enough is enough");
        require(authorizedUsers[msg.sender]== true,"User Not Authorized");
        require(block.timestamp - timestamps[msg.sender] >= timeToWithdraw , "Not Enough Time Passed");
        family[msg.sender] +=1;
        payable(msg.sender).transfer(1 ether);
        timestamps[msg.sender] = block.timestamp;
    }

    function getBalance() public view returns(uint){
        return msg.sender.balance;
    }

    function viewBalance() public view returns(uint) {
        return address(this).balance;
    }

    function viewRamBalance() public view returns(uint) {
        return ram.balance;
    }

    function viewLakhanBalance() public view returns(uint) {
        return lakhan.balance;
    }

    function payRam() public payable{
        require(ramMoney <=  4, "Money limit exceeded");
        ramMoney +=1;
        ram.transfer(1 ether);
    }

    function payLakhan() public payable {
        require(lakhanMoney <= 4, "Money Limit exceeded");
        lakhanMoney +=1;
        lakhan.transfer(1 ether);
    }

    function transferToOwner() public payable{
        require(owner == msg.sender,"Not Authorized");
        owner.transfer(1 ether);
    }
}
