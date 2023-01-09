// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract otherContract{
    uint256 private _x = 0;//状态变量

    event Log(uint amount,uint gas);//定义事件

    //返回合约ETH余额
    function getBalance() view public returns(uint){
        return address(this).balance;
    }

    //可以调整状态变量_x 并且可以往合约里转入ETH
    function setX(uint x) external payable {
        _x = x;
        //如果转入则释放Log事件
        if(msg.value > 0 ){
            emit Log(msg.value,gasleft());
        }
    }

    //读取_x
    function getX() external view returns(uint256 x){
        x = _x;
    }
}

contract CallContract{
    function callSetX(address _Address,uint256 x) external{
        otherContract(_Address).setX(x);
    }

    function callGetX(otherContract _Address) external view returns(uint x){
        x = _Address.getX();
    }

    function callGetX2(address _Address) external view returns(uint x){
        otherContract oc = otherContract(_Address);
        x = oc.getX();
    }

    function setXTransferETH(address othercontract,uint256 x) payable external{
        otherContract(othercontract).setX{value:msg.value}(x);
    }
}
