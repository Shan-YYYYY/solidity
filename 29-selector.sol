// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract Selector{
    //定义事件 返回msg.data
    event Log(bytes data);

    function mint(address to) external {
        require(to == msg.sender);
        emit Log(msg.data);
    }

    function mintSelector() external pure returns(bytes4 mSelector){
        return bytes4(keccak256("mint(address"));
    }

    //使用selector来调用目标函数 例如想要调用mint函数 
    //只需要调用abi.encodeWithSelector将mint函数的method id作为selector和参数打包编码 传给call函数
    // function callWithSignature() external returns(bool, bytes memory){
    //     (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector("0x7f9c8b47")
    // }
}