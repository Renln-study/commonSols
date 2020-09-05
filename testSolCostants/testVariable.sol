pragma solidity ^ 0.5.0;

contract ValuePassing {
  uint public x = 21;
  string public name = "renln";
  string public newName;
  event getMess(string, string, string);
  event getMess1(string, string);
  //memory类型
  function tesPassingByM(uint _x) public returns (string memory,uint, uint) {
    // uint   _x = x;
    x = _x;
    return ("_x||x", _x, x);
  }
  function TTTT() public   {
    /* newName = "hello"; */
    /* testPassingByS(newName); */
    testPassin1(name);
  }
  //storage类型
  //因为函数默认为public类型，但是当我们的函数参数如果为storage类型时，函数的类型必须为internal或者private
  // 按照代码所示，调用函数TTTT传入参数hello，然后把新参数传入name,这时候name就是hello,
  // 如果是引用传递，那么name,newName,_btsName都应该是hello
  // 修改_btsName为Hello,那么上述三个变量都是Hello
  // 以上都是错误的，因为状态变量之间的赋值是值引用
  function testPassingByS(string storage _name) internal returns (string storage, bytes storage) {
    bytes storage _btsName = bytes(_name);
    // bytes memory _btsName = bytes(_name);
    name = string(_btsName); //传入hello
    _btsName[0] = "H";//修改为world
    emit getMess(string(_btsName), string(_btsName), name);
    return (string (_btsName), _btsName);
  }
  function testPassins(string storage _name) internal  {
    newName = _name; //传入hello
    bytes(newName)[0] = 'R';
    /* _name = "Hello"; */
    emit getMess1(name, newName);
  }
  //局部变量引用类型，是采用引用传递---传递的是指针
  function testPassin1(string storage _name) internal  {
    string storage newName1 = _name; //传入hello
    bytes(newName1)[0] = 'R';
    /* _name = "Hello"; */
    emit getMess1(name, newName1);
  }

}

contract LocationsFromStoS {

  uint public stateVar1 = 10;
  uint stateVar2 = 20;

  function doSomething() public returns (uint, uint) {

   stateVar1 = stateVar2;
   stateVar2 = 30;

   return (stateVar1, stateVar2); //returns 20，30
  }
}


contract LocationsFromMtoS {

    uint public stateVar = 10; //storage

    function doSomething(uint _x) public returns(uint, uint) {

        stateVar = _x;
        _x = 21;

        return (stateVar, _x); //returns 20,40
    }
}


contract LocationsFromStoM {

    uint stateVar = 10; //storage
    string public name = "renln";

    function doSomething() public returns(uint, uint) {

        uint localVar = 20; //memory

        localVar = stateVar;
        stateVar = 40;

        return (localVar, stateVar); //returns 10,40
    }
    function doSomething1(string memory _localname) public returns(string memory) {
    //   bytes memory btsName = bytes(name);
      bytes memory btsLocalname = bytes(_localname);

     name = string(btsLocalname);
     btsLocalname = "Renln";

        return (string(btsLocalname));
    }
}


contract LocationsFromMtoM {
    //引用类型
    function doSomething()
        public pure returns(uint[] memory, uint[] memory) {

        uint[] memory localMemoryArray1 = new uint[](3);
        localMemoryArray1[0] = 4;
        localMemoryArray1[1] = 5;
        localMemoryArray1[2] = 6;

        uint[] memory localMemoryArray2 = localMemoryArray1;
        localMemoryArray1[0] = 10;

        return (localMemoryArray1, localMemoryArray2);
       //returns 10,5,6 | 10,5,6
    }
    //值类型 修改_localVar2只是为了整明—_localVar1是获取到_localVar1的数据拷贝
    function doSomething1(uint _localVar1, uint _localVar2) public pure returns(uint, uint) {

       _localVar1 = _localVar2;  // _localVar1:11,_localVar2:22
       _localVar2 = 40;

       return (_localVar1, _localVar2); //returns 20
   }
}
