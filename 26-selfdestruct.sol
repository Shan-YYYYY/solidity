// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
//selfdestruct命令用于删除智能合约
//并且将剩余ETH转入指定地址
//使用方法sdlfdestruct(_addr)  其中_addr是接受剩余ETH的地址

contract Selfdestruct{
    uint public value = 10;

    constructor() payable {}

    receive() external payable{}

    function deleteContract() external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns(uint balance){
        balance = address(this).balance;
    }

}