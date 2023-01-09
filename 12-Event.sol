// SPDX-License-Identifier:MIT

pragma solidity ^0.8.16;

contract _Event{
    //定义_balances映射变量 记录每个地址的持币数量
    mapping(address => uint256) public _balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    //带有indexed关键字会保存在以太坊虚拟机日志的topics中 方便以后检索 topics对于超过256的数据存储其哈希
    //日志中不带有indexed的存储在data中 data一般用于存储超过256bit的大数据

    //定义_transfer函数 执行转账逻辑
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) external {

        _balances[from] = 10000000;//给转账地址一些初始代币

        _balances[from] -= amount;// from地址减去转账数量
        _balances[to] += amount;//to地址加上转账数量

        //释放事件
        emit Transfer(from, to, amount);
    }


}
