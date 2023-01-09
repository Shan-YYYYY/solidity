// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract receiveAndFallback{
    //solidity 支持的两种回调函数
    //receive()和fallback()
    //用于1.接受ETH 2.处理合约中不存在的函数调用

    //receive()只用于处理接受ETH 一个合约最多有一个receive()函数 声明方式和一般函数不一样
    //不需要function关键字 :receive() external payable {}
    //不能有任何参数 不能返回任何值 必须带有 external和payable
    //当合约接收ETH的时候，receive()会被触发。
    //receive()最好不要执行太多的逻辑因为如果别人用send和transfer方法发送ETH的话，gas会限制在2300
    //receive()太复杂可能会触发Out of Gas报错；如果用call就可以自定义gas执行更复杂的逻辑

    // 定义事件
    event Received(address Sender, uint Value);
    // 接收ETH时释放Received事件
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    //fallback()函数会在调用合约不存在的函数时被触发。
    //可用于接收ETH，也可以用于代理合约proxy contract。fallback()声明时不需要function关键字
    //必须由external修饰，一般也会用payable修饰，用于接收ETH:fallback() external payable { ... }。

    event fallbackCalled(address Sender, uint Value,bytes dat);
    fallback() external payable{
        emit fallbackCalled(msg.sender,msg.value,msg.data);
    }
}
