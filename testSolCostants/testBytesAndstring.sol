pragma solidity ^0.5.0;


contract TestArray {
    uint[]  d = [1,2,3,4,5];

   function basicUsing() public view {
      uint len = 7;

      //dynamic array
      uint[] memory a = new uint[](7);

      //bytes is same as byte[]
      bytes memory b = new bytes(len);

      assert(a.length == 7);
      assert(b.length == len);

      //access array variable
      a[6] = 8;

      //test array variable
      assert(a[6] == 8);

      //static array
      uint[3] memory c = [uint(1) , 2, 3];
      assert(c.length == 3);

   }

   function testPush() public payable returns (uint) {
     //dynamic array to test push()
     // 如果申明函数为view 下面语句会报错，因为涉及到改变d数组的状态，
     // 那么提示使用 payable 用以标识变量状态的变化
     d.push(21);
     assert(d.length == 6);
     uint num = 0;
        for(uint i = 0; i < d.length; i++) {
            num = num + d[i];
        }
        return num;

   }
   function testMemoryArray() public view  {
     //是否可用length  --
     uint[] memory f = new uint[](5);
    //   f.push(21);
   }


}

contract TestMapping {

  struct Student {
    string  name;
    uint level;
    uint age;
  }
  //level >= uint
  mapping (uint => Student[]) levelCounts;
  function createStudent(string memory _name, uint  _level, uint _age) public  {
    Student memory newStudent =  Student(_name, _level, _age);
    levelCounts[_level].push(newStudent);
  }

  function getUsers (uint _level) public view returns (bytes32[] users)
   {
       uint length = mulUsers[_level].length;
       users = new bytes32[](length);

       for(uint i = 0; i < length; i++)
       {
           users[i] = stringToBytes32(mulUsers[_level][i].name);
       }
   }

 // Make sure that string is not longer than 32 bytes or result will be cut
  function stringToBytes32(string memory source) private pure returns (bytes32 result) {
      bytes memory tempEmptyStringTest = bytes(source);
      if (tempEmptyStringTest.length == 0) {
          return 0x0;
      }

      assembly {
          result := mload(add(source, 32))
      }
  }

}

contract BytesOrStrings {
    string  _string = "cryptopus.co Medium";
    bytes32  _bytes = "cryptopus.co Medium";
    function  getAsString() public view returns(string memory) {
      return _string;
    }

    function  getAsBytes() public view returns(bytes32) {
      return _bytes;
    }
    function getLength() public view returns (uint) {
      return _bytes.length;
    }
  }

  contract GetLength {
    string str = "Renln";
    bytes bts1 = "星星";  //两个汉字   3个字节 --对应二进制2^3位
    bytes bts2 = "renln"; //五个英文字母  一个字节  --对应二进制2*5 < 2^4位

    /*
     * 下面使用的是直接利用固定长度的bytes1，bytes2 .....bytes32 来进行定义字符串
     */
    bytes6 Bts1 = "星星"; //两个汉字对应6个字节
    bytes5 Bts2 = "renln";
  function getStrLength() public view returns (uint) {
    return bytes(str).length;
  }

  function getBytesLength() public view returns (uint, uint) {
    return (bts1.length, bts2.length);
  }

  function getByteLength() public view returns (uint, uint) {
    return (Bts1.length, Bts2.length);
  }
}

contract bytesToString {

    bytes names = new bytes(4);
    byte  bbbytes = 0x77;
    bytes32 public str = "helloworld";
    bytes9 public g = 0x6c697975656368756e;

  constructor() public  {
        names[0] = 0x77;
        names[1] = 0x61;
        names[2] = 0x6e;
        names[3] = 0x67;
    }

    function namesToString() public  view returns (string memory) {
        return string(names);
    }

    function getDetailByIndex(uint index) public view returns (bytes1) {
        return names[index];
    }
    function getBytesLength(bytes2 bt) public view returns (uint) {
        return bt.length;
    }
    /* function getLength() */

}
