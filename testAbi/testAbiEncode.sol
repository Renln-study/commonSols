pragma solidity >=0.5.0 <0.6.0;


contract Test {
    function set(uint value) public {

    }
}

contract User {

    function test() public view returns(bytes memory){
        //一个参数对应一个32位的abi编码：0x00000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000002

        uint a = 1;
        uint b = 2;
        return abi.encode(a,b);
        // encodePacked编码只能是变量【如果encodePacked(1,2)会报错！】
        return abi.encodePacked(a,b);
        // 0xcccdda2c0000000000000000000000000000000000000000000000000000000000000001
        // 前面四位cccdda2c是函数set(uint)的签名（selector）,后面32位是参数1的ABI编码！
        // return abi.encodeWithSignature("set(uint)", 1);
    }
}


contract testABI {
    uint public  storedData;

    function set(uint x) public{
        storedData = x;
    }

    function abiEncode() public view returns (bytes memory) {
        abi.encode(21);  // 计算1的ABI编码
        return abi.encodeWithSignature("set(uint256)", 21); //计算函数set(uint256) 及参数1 的ABI 编码
    }
}
// 0x60fe47b10000000000000000000000000000000000000000000000000000000000000015
// 0x60fe47b10000000000000000000000000000000000000000000000000000000000000015


contract Contract {

    MyContract contract1 = new MyContract();

    function getSelector() public view returns (bytes4, bytes4) {
        return (contract1.function1.selector, contract1.getBalance.selector);
    }

    function callGetValue(uint _x) public view returns (uint) {

        bytes4 selector = contract1.getValue.selector;

        bytes memory data = abi.encodeWithSelector(selector, _x);
        (bool success, bytes memory returnedData) = address(contract1).staticcall(data);
        require(success);

        return abi.decode(returnedData, (uint256));
    }
}

contract MyContract {

    function function1() public {}

    function getBalance(address _address) public view returns (uint256){}

    function getValue (uint _value) public pure returns (uint) {
        return _value;
    }

}

contract strAppend {
  function getNewString(
    string memory _str1,
    string memory  _str2
    )
  public view returns (string memory) {
    return string(abi.encodePacked(_str1, _str2));
  }
function getEncode(string memory _str1,string memory _str2) public view returns (
   bytes memory,
   bytes memory,
   bytes memory,
   uint
   ) {
  return (abi.encode(_str1),abi.encodePacked(_str1),abi.encodePacked(_str1,"ren"),abi.encode(_str1).length);
}
}


contract TestDifference {
  function testUint(
    uint8 _num1,
    uint32 _num2
    )
    public view returns (bytes memory, bytes memory) {
    return (
      abi.encode(_num1),
      abi.encodePacked(_num2)
      );
  }

  function testBytes() public view returns (bytes memory, bytes memory) {
      bytes memory _bts ="Hello,world!";
    return (abi.encodePacked(_bts),abi.encode(_bts));
  }
}
