// SPDX-License-Identifier:MIT
pragma solidity 0.8.16;

contract ReceivedEth{
    //定义接收Eth的事件
    event Log(uint amount,uint gas);

    //receive方法 接收ETH时触发
    receive() external payable {
        emit Log(msg.value,gasleft());
    }

    //返回合约余额
    function getBalance() view public returns(uint){
        return address(this).balance;
    }
    event fallbackCalled(address Sender, uint Value,bytes dat);
    fallback() external payable{
        emit fallbackCalled(msg.sender,msg.value,msg.data);
    }
}

contract SendEth{
    //构造函数 payable使得部署时能够转入Eth
    constructor() payable{}
    //receive方法 接收Eth时被触发
    receive() external payable{}

    //使用transfer()发送Eth 用法 接收方地址.transfer(发送的Eth)
    //transfer gas限制为2300
    function transferEth(address payable _to,uint amount) external payable{
        _to.transfer(amount);
    }

    //send()方法发送Eth 用法 接收方地址.send(发送的Eth金额)
    //send gas限制为2300
    //send返回值为bool类型 
    error SendFailed();
    function sendEth(address payable _to,uint256 amount) external payable{
        bool success = _to.send(amount);

        if(!success){
            revert SendFailed();
        }
    }

    //call()方法发送Eth 用法 接收方地址.call{value:发送ETH数额}("")
    //call()没有gas限制 可以支持对方合约的fallback()和receive()实现复杂逻辑
    //call()一旦转账失败 不会revert
    //call()的返回值为(bool,data)其中bool代表转账成功与否
    error CallFailed();
    function callEth(address payable _to,uint256 amount) external payable{
        (bool success,) = _to.call{value:amount}("");
        if(!success){
            revert CallFailed();
        }
    }

    

}








