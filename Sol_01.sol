pragma solidity >=0.5.0;

contract KeepAdd {

  uint  public  currentResult = 1;
      function Add(uint _newAdd) public  returns (uint) {
        currentResult += _newAdd;
        assert(true);
        return currentResult;
      }
}



