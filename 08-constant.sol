// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
contract constantAndImmutable{
    //常量constant和不变量immtable 状态变量声明加入这两个关键字后 不能在合约内更改数值 并且可以节省gas 
    //同时只有数值变量可以声明constant和immtable string和bytes可以声明为constant 不能声明immtable
    
    //constant变量必须在声明的时候初始化 之后不能改变 不然编译报错
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "asd";
    bytes constant CONSTANT_BYTES = "Shan";
    address constant CONSTANT_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //immutable变量可以在声明时或构造函数中初始化
    uint256 public immutable IMMUTABLE_NUM = 99999;
    uint256 public immutable IMMUTABLE_BLOCK;
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_TEST;
    
    constructor(){
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_BLOCK = block.number;
        IMMUTABLE_TEST = test();
    } 

    function test() public pure returns(uint256){
        uint256 what = 990;
        return(what);
    }


}