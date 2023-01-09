// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract _Error{

    //三种异常处理方法
    //error、require和assert
    //其中error消耗gas最少 其次是assert require消耗最多
    error TransferNotOwner();//自定义error

    error TransferNotOwner1(address sender);//自定义带参数的error

    //在执行中 error 必须搭配revert(回退)命令使用

    address [] _owners;

    function transferowner1(uint tokenId,address newOwner) public {
        if(_owners[tokenId] != msg.sender){
            revert TransferNotOwner();
            // revert TransferNotOwner(msg.sender);
        }
        _owners[tokenId] = newOwner;


    }

    //require命令使用方法：require(检查条件,"异常的描述") 当检查条件不成立的时候就会抛出异常
    function transferowner2(uint tokenId,address newOwner) public {
        require(_owners[tokenId] == msg.sender, "Transfor Not Owner");
        _owners[tokenId] = newOwner;
    }

    //Assert 一般用于程序员Debug 因为不会解释抛出异常的原因 用法assert(检查条件)不满足则抛出异常
    function transferowner3(uint tokenId,address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }













}
