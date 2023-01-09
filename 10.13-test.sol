// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract test1{



    function byToAddress(bytes32 data) public pure returns(address) {

        address address2 = address(bytes20(data));
        return address2;
    }

}
