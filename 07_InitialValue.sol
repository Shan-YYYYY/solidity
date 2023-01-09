// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

    contract Value_test{
        //solidity中值类型的默认初始值
        bool public _Bool;  // false
        string public _String;  //""
        int public _Int;  //0
        uint public _Uint;  //0
        address public _address;  //0x0000000000000000000000000000

        enum ActionSet {Buy , Hold , Shell}
        ActionSet public _enum;

        function fi() internal{} //internal 空白方程
        function fe() external{} //external 空白方程

        uint[8] public _staticArray;//静态数组默认值为其成员默认初始值
        uint[] public _dynamicArray;//[]

        //delete操作符 让变量的值变为初始值
        bool public bool2 = true;
        function d() external returns(bool) {
            delete bool2;//delete操作使bool2的值变为默认的false
            return(bool2);
        }
    }    

