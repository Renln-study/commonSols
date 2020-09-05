pragma solidity ^0.5.0;

contract A {
    int public x;

    function inc_call(address _contractAddress) public returns (bytes memory) {
        // _contractAddress.call(bytes4(abi.encode(keccak256("inc()"))));
        /* _contractAddress.call(bytes4(keccak256("inc()"))); */
        /* _contractAddress.call(abi.encodeWithSignature("inc()")); */
        /* return _contractAddress.call(abi.encodeWithSignature("add(uint256,uint256)",12,13)); */
        /* return _contractAddress.call(abi.encodeWithSignature("add(uint256, uint256)", _x, _y)); */
        /* return _contractAddress.call(abi.encodeWithSignature("addX(uint256)", 21)); */
        (bool success, bytes memory result) = _contractAddress.call(abi.encodeWithSignature("inc()"));
        require(success);
        return result;
    }
     function inc_callcode(address _contractAddress) public returns (bytes memory){
         (bool success, bytes memory result) = _contractAddress.delegatecall(abi.encodeWithSignature("inc()"));
         require(success);
         return result;
     }
}

contract B {
    uint public x;
    /* constructor() public {
      x = 21 ;
    } */
    function inc() public {
        x++;
    }
    function add(uint _x, uint _y) public view returns (uint) {

      return  (_x + _y);
    }
    function getValue() public view returns (uint) {
      return x;
    }
    function addX(uint _x) public returns (uint) {
      return x + _x;
    }
}
