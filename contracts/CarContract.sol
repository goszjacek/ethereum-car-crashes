pragma solidity >=0.4.22 <0.7.0;
// pragma solidity ^0.4.15;

abstract contract CarContract{
    struct Crash{
        uint datetime;
    }

    function emitCrash() virtual public;
    function getLastCrashTime() virtual public returns (uint datetime);
}