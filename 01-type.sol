// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract _type{
    
    //布尔
    bool public _bool = true;

    // 布尔运算
    bool public _bool1 = !_bool; //取非
    bool public _bool2 = _bool && _bool1; //与
    bool public _bool3 = _bool || _bool1; //或
    bool public _bool4 = _bool == _bool1; //相等
    bool public _bool5 = _bool != _bool1; //不相等

    // 整型
    int public _int = -1;// 整数 包括负数
    uint public _uint = 1;// 正整数
    uint256 public _number = 20220918;// 256位正整数

    //整数运算
    uint256 public _number1 = _number + 1; // + - * / 
    uint256 public _number2 = 2**2;// 指数
    uint256 public _number3 = 7 % 2; // 取余数
    bool public _numberbool = _number2 > _number3; // 比大小

    //地址类型
    address public _address = 0x45B5b7E140B1ce14337B03F65A7948eFCd5CE077;
    address payable public  _address1 = payable (_address);// payable address 可以转账、查余额
    //地址类型成员
    uint256 public balance = _address1.balance;//balance of address

    //固定长度字节数组
    bytes32 public _byte32 = "MiniSolidity";
    bytes1 public _byte = _byte32[0];

    //枚举
    // 用enum将uint，1,2表示为buy，hold，sell
    enum ActionSet{Buy,Hold,Sell}
    // 创建enum变量 action
    ActionSet action = ActionSet.Buy;

    // enum可以和uint显式的转换
    function enumToUint() external view returns(uint){
        return uint(action);
    }
}
