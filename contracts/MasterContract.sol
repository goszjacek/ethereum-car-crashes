pragma solidity >=0.4.22 <0.7.0;
// pragma solidity ^0.4.15;

abstract contract MasterContract{

    struct Crash{
        uint datetime;
    }

    struct Car{
        Crash[] crashes;
        uint256 lastPayment;
    }

    mapping(address => Car) cars;

    uint256 public registrationPayment = 1 ether;
    uint256 public crashPayment = 0.1 ether;

    // if a car wants to register in the system it needs to do a payment
    function register() payable public{
        Car storage car = cars[msg.sender];

        require(msg.value == registrationPayment);

        car.lastPayment = now;
    }

    function registerCrash() payable public{
        Car storage car = cars[msg.sender];

        msg.sender.transfer(crashPayment);
        Crash memory crash = Crash({datetime: now});
        car.crashes.push(crash);

        car.lastPayment = now;        
    }

} 