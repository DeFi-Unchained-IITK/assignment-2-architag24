// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract PrimeOwner{

function prime(uint num) private pure returns(bool){
    if(num==1) return false;
    if(num==2 || num==3){
        return true;
    }
    if(num%2==0) return false;
    for(uint i=3;i*i<=num;i+=2){
        if(num%i==0) return false;
    }
    return true;
}

    address public owner;
    event ownerChange(address newOwner);

    constructor(){
        owner = msg.sender;
    }

    function ChangeOwner(uint input) public {
        if(input<1){
            revert("Give a value greater than or equal to 1");
        }
        if(prime(input)){
            owner = msg.sender;
            emit ownerChange(owner);
        }
    }

}