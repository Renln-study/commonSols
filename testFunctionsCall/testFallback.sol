pragma solidity ^0.5.0;

contract Test {
   uint public x ;
   function() external { x = 1; }
}
contract Sink {
   function() external payable { }
   function getBalance() public view returns (uint) {
     return address(this).balance;
   }
}
contract Caller {
   event getTransactDetails(uint,bool);
   function callTest(Test test) public returns (bool) {
      (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
      require(success);
      // test.x 是 1
      //地址类型的强制转换
      address payable testPayable = address(uint160(address(test)));

      // 发送以太测试合同,
      // 转账将失败，也就是说，这里返回false。
      return (testPayable.send(2 ether));
   }

   function callSink(Sink _sink) public  payable returns (bool) {
      address payable _sinkPayable = address(_sink);
      bool _result = _sinkPayable.send(2 ether);
      emit getTransactDetails(getBalance(_sinkPayable), _result);
      return _result;
   }
   function getBalance(address _address) public view returns (uint) {
     return _address.balance;
   }
}
