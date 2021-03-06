pragma solidity ^0.5.0;

library StringToUintMap {
    struct Data {
        mapping (string => uint8) map;
    }

    function insert(
        Data storage self,
        string memory key,
        uint8 value) 
    public returns (bool updated)
    {
        require(value > 0);

        updated = self.map[key] != 0;
        self.map[key] = value;
    }

    function get(Data storage self, string memory key) public returns (uint8) {
        return self.map[key];
    }
}
