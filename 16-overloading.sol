// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract overloanding{
    //solidity 允许函数重载 即同名函数不同输入 允许存在 被视为不同函数
    //但是不允许修饰器重载

    function saySomething() public pure returns(string memory){
        return "Nothing";
    }

    function saySomething(string memory _string) public pure returns(string memory ){
        return _string;
    }

    //实参匹配 当调用重载函数时会吧输入参数和函数参数做匹配 当有多个匹配的重载函数时 会报错
    function f(uint256 _in) public pure returns(uint256){
        return _in;
    }

    function f(uint8 _in) public pure returns(uint8){
        return _in;
    }
    //当调用f(20)时 由于 20 既是uint8又是uint256 则会报错;


}


