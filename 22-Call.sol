// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
//使用call调用其他合约
//使用场景在不知道源代码或abi编码的情况下使用
//使用方法：目标合约地址.call(二进制编码);
//其中二进制编码利用结构化编码函数abi.encodeWithSignature获得
//abi.encodeWithSignature("函数签名", 逗号分隔的具体参数)
//例如:abi.encodeWithSignature("f(uint256,address)", _x, _addr)
//除此之外 call在调用合约时可以指定交易发送的ETH数额和gas
//目标合约地址.call{value:发送数额, gas:gas数额}(二进制编码);

contract OtherContract{
    uint256 private _x = 0;// 状态变量

    //收到eth的事件，记录amount和gas
    event Log(uint amount,uint gas);

    fallback() external payable{}

    receive() external payable{}

    //返回合约ETH余额
    function getBalance() view public returns(uint){
        return address(this).balance;
    }

    //可以调整状态变量的函数并且可以往合约里转ETH
    function setX(uint256 x) external payable{
        _x = x;
        //如果转入ETH则释放事件
        if(msg.value > 0){
            emit Log(msg.value,gasleft());
        }
    } 

    //读取x
    function getX() external view returns(uint x){
        x = _x;
    }
}

contract call{
    //定义事件 输出call返回的结果success和data
    event Response(bool success,bytes data);

    function callsetX(address payable _addr,uint256 x) public payable{
        //call setX() 同时可以发送ETH
        (bool success,bytes memory data) =  
        _addr.call{value:msg.value}(
            abi.encodeWithSignature("setX(uint256)",x)
        );
    
        emit Response(success,data);//释放事件
    }

    function callGetX(address _addr) external returns(uint256){
        //call getX()
        (bool success,bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );
        emit Response(success,data);
        return abi.decode(data,(uint256));//使用abi.decode()解码call的返回值data并读出数值
    }

    function callNonExist(address _addr) external {
        (bool success,bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")//使用call调用不存在的合约触发fallback()或receive()
        );

        emit Response(success,data);//释放事件
    }

}
