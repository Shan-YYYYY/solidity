// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Function{
    // function (<parameter types>) {internal|external|public|private} [pure|view|payable] [returns (<return types>)]
    //internal :只能从合约内部访问，继承的合约可以用（也可用于修饰状态变量）
    //external ：只能从合约外部访问（但是可以使用this.f()来调用，f是函数名）
    //private :只能从本合约内部访问，继承的合约也不能用（也可用于修饰状态变量）
    //public :内外部均可见。（也可用于修饰状态变量，public变量会自动生成getter函数，用于查询数值）
    //payabli ：（可以支付的）带着它的函数，运行的时候可以给合约转入ETH
    //pure :使用此关键词代表函数不能读取也不能写入存储在链上的状态变量
    //view ：使用此关键词代表函数可以读取但不能写入链上的变量
    //不适用pure和view代表函数可以读也可以写入链上的状态变量
    uint256 internal _number = 10;

    function add() external {

        _number = _number + 1;
        
    }
    
    function addPure(uint256 _number1) public pure returns(uint256 new_number){
        new_number = _number1 + 1;
    }
    function git_number() external view returns(uint show_number){
        return show_number = _number;
    }   
    function minus() internal {
        _number = _number - 1;
    }
    function minusCall() external {
        minus();
    }

    function minusPayable() external payable returns(uint256 balance) {
        minus();
        balance = address(this).balance;
    }


 }