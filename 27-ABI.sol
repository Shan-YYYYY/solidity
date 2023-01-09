// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract TestABI{
    uint x = 10;
    address addr = 0x45B5b7E140B1ce14337B03F65A7948eFCd5CE077;
    string name = "0x00YY";
    uint [2] array = [7,8];

    //abi.encode将给定参数利用ABI规则编码
    function encode() public view returns(bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }

    //abi.encodePacked将给定参数根据其所需最低空间编码 
    //类似abi.encode但省略许多填充0
    //常用于计算一些数据的哈希
    function encodePacked() public view returns(bytes memory result){
        result = abi.encodePacked(x, addr, name, array);
    }

    //abi.encodeWithSignature 类似于abi.encode 
    //只不过第一个参数为函数签名 如"foo(uint256,address)"当调用其他合约的时候使用
    function encodeWithSignature() public view returns(bytes memory result){
        result = abi.encodeWithSignature("foo(uint256,address,string,uint256[2])", x, addr, name, array );
    }

    //abi.encodeWithSelector 类似于abi.encode
    //只不过第一个参数为函数选择器 为函数签名Keccak哈希的前四个字节
    function encodeWithSelector() public view returns(bytes memory result){
        result = abi.encodeWithSelector(bytes4(keccak256("foo(uint256,address,string,uint256[2])")), x, addr, name, array);
    }

    //abi.decode
    //用于解码abi.encode生成的二进制编码，将他还原成原本的参数
    function decode(bytes memory data) public pure returns(uint dx, address daddr, string memory dname, uint[2] memory darray){
        (dx, daddr, dname, darray) = abi.decode(data, (uint, address, string, uint[2]));
    }

}