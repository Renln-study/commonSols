pragma solidity ^0.5.0;

import { StringToUintMap } from "./demoLibrary.sol";

contract PersonsAge {

    StringToUintMap.Data private _stringToUintMapData;

    event PersonAdded(string name, uint8 age);
    event GetPersonAgeResponse(string name, uint8 age);

    function addPersonAge(string memory name, uint8 age) public {
        StringToUintMap.insert(_stringToUintMapData, name, age);

        emit PersonAdded(name, age);
    }

    function getPersonAge(string memory name) public  returns (uint8) {
        uint8 age = StringToUintMap.get(_stringToUintMapData, name);

        emit GetPersonAgeResponse("renln", age);

        return age;
    }
}
