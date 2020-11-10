pragma solidity ^0.4.11;

contract Renting{
    address public owner;
    address public renter;
    uint public expireTime;
    uint public unitPrice;
    string public otherRent;
    string public insurance;
    
    
    function Renting(uint _unitPrice){
        owner = msg.sender;
        renter = 0x0;
        expireTime = now;
        unitPrice = _unitPrice;
        otherRent = "";
        insurance = "";
    }
    
    function rent(string Otherrent, string Insurance) public payable returns(bool){
        if(renter != 0x0) return false;
        else{
            if((msg.value/1 ether) / unitPrice < 1) return false;
            else{
                expireTime = now + 30 minutes * (msg.value/1 ether)/unitPrice;
                otherRent = Otherrent;
                insurance = Insurance;
                renter = msg.sender;
            }
        }
    }
    
    function rentingFee(){
        if(msg.sender == owner){
            owner.transfer(this.balance);
        }
    }
}

