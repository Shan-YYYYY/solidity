// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

    contract Mapping{
        //映射格式mapping( _KeyType => _ValueType)
        //其中_KeyType 必须为solidity的默认数据类型
        //_ValueType可以为自定义的类型
        //映射的存储位置必须是storage且mapping不能用于public函数的参数和返回值里
        mapping(uint => address) private idToAddress;
        mapping(address => address) public swapAddress;

        //给映射增加新的键值对
        function writeMap (uint _Key,address _Value) public {
            idToAddress[_Key] = _Value;
        }

        function getIdHash(uint id) public view returns(address _address){
            return(idToAddress[id]);
        }
    }


