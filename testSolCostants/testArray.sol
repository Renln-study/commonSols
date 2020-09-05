/**
 *测试sol中的数组使用
 */
pragma solidity ^0.5.0;
/* contract DemoArray {
    uint x = 21;
    uint[] memory location;
}

contract TestArray {

  //how to use type()
  function  testType() public {
    DemoArray _demoArray = new DemoArray();
    type(_demoArray).x;
  }

} */


contract C {
    uint someVariable;
    uint[] data;

    function f() public {
        uint[] memory x = new uint[](3);
        x.push(2);
        data = x;
    }
}
