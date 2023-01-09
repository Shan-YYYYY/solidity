// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

import './17-liarbry.sol';

contract Import{
    //solidity支持import关键字导入其他源代码中的合约 使开发模块化

    //三种方式
    //1.通过文件相对位置导入
        //import ./Yeye.sol
    //2.通过网址导入
        //import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';
    //3.通过npm导入
        //import '@openzeppelin/contracts/access/Ownable.sol';
    //4.通过全局符号导入
        //import {Yeye} from './Yeye.sol';
}
