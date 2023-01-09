// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract Modifiter{
    //定义owmer
    address public owner;

    //构造函数 每个合约可以定义一个 在部署的时候自动运行 用于初始化一些变量
    constructor(){
        owner = msg.sender;//在部署合约的时候将owner的值设置为msg.sender的值
    }

    //定义modifier
    modifier onlyOwner{
        require(msg.sender == owner);//检查调用者是否为owner地址
        _;//如果是则继续运行函数主体，否则报错
    }

    //带有onlyOwner修饰符的函数，只能被owner地址调用
    function changeOwner(address _newOwener) external onlyOwner{
        owner = _newOwener;//只有owner地址才能运行这个函数 修改owner
    }

}
