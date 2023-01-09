// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
//代理调用delegatecall 
//用户调用合约A中的调用合约B的函数 改变的是合约B的变量
//用户调用合约A中的代理调用合约B的函数 改变的是合约A的变量
//delegatecall语法和call语法类似
//目标合约地址.delegatecall(二进制编码);
//abi.encodeWithSignature("函数签名", 逗号分隔的具体参数)
//和call不一样，delegatecall在调用合约时可以指定交易发送的gas，但不能指定发送的ETH数额

//被调用的合约C
contract C{
    uint public num;
    address public sender;

    function setVars(uint _num) public payable{
        num = _num;
        sender = msg.sender;
    }
}

//发起调用的合约 
//使用delegatecall 发起调用的合约必须和被调用的合约状态变量相同
contract B{
    uint public num;
    address public sender;

    function callsetVars(address _addr,uint _num) external payable{
        (bool success,bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)",_num)
        );
    }

    function delegatecallsetVars(address _addr,uint _num) external payable{
        (bool success,bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)",_num)
        );
    }
}

