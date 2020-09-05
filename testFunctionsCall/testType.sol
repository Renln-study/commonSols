pragma solidity ^0.5.0;

contract CType {
  /**
   * jsut test the method --type()
   */
  function getTypeResult(bytes memory bts) public view returns (bytes memory) {

    return bts;
  }
}

contract TestCType {
  event getMessage(string);
  CType c = new CType();
  function testType() public  {
    emit getMessage(type(CType).name);
  }
}
