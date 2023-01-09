// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract idAndWhile{
    //实现插入排序

    //if-else Test
    function ifElseTest(uint256 _number) public pure returns(bool){
        if(_number == 0){
            return(true);
        }else{
            return(false);
        }
    }

    //for循环
    function forLootTest() public pure returns(uint256){
        uint sum = 0;
        for(uint i = 0;i < 10; i++){
            sum += i;
        }
        return(sum);
    }

    //while循环
    function whileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        while(i < 10){
            sum += i;
            i ++;
        }
        return(sum);
    }

    //do-while 循环
    function doWhileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        do{
            sum += i;
            i++;
        }while(i < 10);
        return(sum);
    }

    //三元操作符
    //三元操作符是solidity中唯一一个接受三个操作数的运算符 规则 条件？条件为真的表达式：条件为假的表达式 用于快捷if
    function ternaryTest(uint256 x,uint256 y) public pure returns(uint256){
        return(x > y ? x : y);
    }

    //continue 和 break 同样适用于solidity
}

















