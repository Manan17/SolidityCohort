// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.7;

contract Simple{
    function add(uint num1, uint num2) public pure returns(uint){
        return num1 + num2;
    }

    function subt(uint num1, uint num2) public pure returns(uint) {
        return num1-num2;
    }
    function mult(uint num1, uint num2) public pure returns(uint) {
        return num1*num2;
    }

    function div(uint num1, uint num2) public pure returns(uint) {
        return num1/num2;
    }
    function modulo(uint num1, uint num2) public pure returns(uint) {
        return num1%num2;
    }
}
