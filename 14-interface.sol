// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
//抽象合约
//当一个合约中至少有一个未实现函数时 即某个函数缺少主体{}中的内容时
//必须将合约标为abstract 并且未实现的函数必须添加virtual以便子合约重写

//接口：类似于抽象合约但不实现任何功能{
//     1.不能包含状态变量
//     2.不能包含构造函数    
//     3.不能继承除接口外的其他合约
//     4.所有函数都必须是external且不能有函数体
//     5.继承接口的合约必须实现接口所定义的所有功能
// }

abstract contract Base{
    string public name = "Base";
    function getAlias() public pure virtual returns(string memory);

}

contract BaseImpl is Base{
    function getAlias() public pure override returns(string memory){
        return "BaseImpl";
    }

    
}

interface Base1{
    function getFirstName() external pure returns(string memory);
    function getLastName() external pure returns(string memory);

}

contract Base1Impl is Base1{
    function getFirstName() external pure override returns(string memory){
        return "Amazing";

    }
    function getLastName() external pure override returns(string memory){
        return "Ang";
    }
}


