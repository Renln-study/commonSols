pragma solidity ^0.5.0;
//测试状态变量
contract Person {

    uint public _age;

    constructor(uint age) public {
      _age = age;
    }

    function f() public view returns (uint) {
      midifyAge(_age);
      return _age;
    }

    function midifyAge(uint age) public view returns (uint) {
      age = 100;
      return _age;
    }
}

//测试 值传递与指针传递
contract Person1 {

    string public  _name;

    constructor() public {
        _name = "renln";
    }

    function test() public {

        modifyName_M(_name);
        /* return _name; */
    }


    function modifyName_M(string storage name) internal   {

        string storage newName = name;
        bytes(newName)[0] = 'R';
    }
    /* function modifyName_S(string storage name) public   {

        string name1 = name;
        bytes(name1)[0] = 'L';
    } */
}
