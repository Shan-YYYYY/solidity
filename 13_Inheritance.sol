// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract _Inheritance{
    //继承
    //virtual:父合约中的函数 如果希望子合约重写 需要加上virtual关键字
    //override:子合约覆盖了父合约中的函数 需要加上override关键字    
}

//定义爷爷合约
contract Yeye{
    event Log(string msg);

    //定义三个function:hip(),pop(),man()log值Yeye
    function hip() public virtual{
        emit Log("Yeye");
    }

    function pop() public virtual{
        emit Log("Yeya");
    }

    function man() public virtual{
        emit Log("Yeye");
    }
}

contract Baba is Yeye{
    //继承两个function:hip()和pop() 输出为Baba
    function hip() public virtual override{
        emit Log("Baba");
    }

    function pop() public virtual override{
        emit Log("Baba");
    }

    function baba() public virtual {
        emit Log("Baba");
    }
}

contract Erzi is Yeye,Baba{
    //继承两个function:hip()和pop() 输出为Erzi
    //继承了多个合约 某一函数在多个合约中都存在 需在override中都标识出来
    function hip() public virtual override(Yeye,Baba){
        Yeye.pop();  //子合约调用父合约的函数 方法一：直接调用
        super.pop();//方法二可以使用super关键字来调用 最近父合约的函数
        emit Log("Erzi");
    }



    function pop() public virtual override(Yeye,Baba){
        emit Log("Erzi");
    }
}

//构造函数同样可以继承 方式和函数继承类似 在相应的地方加上virtual和override关键字即可
contract Base1{
    modifier test1(uint _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}

contract Base2 is Base1{
    function getAnnser(uint _dividend) public test1(_dividend) pure returns(uint,uint ){
        return getDiv(_dividend);
    }

    function getDiv(uint _dividend) public pure returns(uint,uint ){
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return(div2,div3);
    }
}

















