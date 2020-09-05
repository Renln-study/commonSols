pragma solidity ^0.5.0;

contract TestString {
  function makeThirdCharacterX(string memory _s) public view returns (uint) {
    bytes memory byteString = bytes(_s);

    return byteString.length;
  }
  function getBytes(string memory newString) public view returns (bytes memory) {
    return bytes(newString);
  }
}


contract dynamicTostring{
    bytes name = new bytes(2);

    function InitName() public{
        name[0] = 0x6a;
        name[1] = 0x6f;
    }

    function dynamictostr() public view returns(string memory){
        return string(name);
    }
}

contract utf8StringLength{
    //---------------------BEGIN Code to copy-paste--------------
    event getBytes(bytes);
    event getByte(byte);
    event getlength(uint);
    event getI(uint);
  function utfStringLength(string memory str) public payable returns (uint length){
      uint i=0;
      bytes memory string_rep = bytes(str);
      emit getBytes(string_rep);
      emit getlength(string_rep.length);
      while (i<string_rep.length)
      {
          emit getByte(string_rep[i]);
          if (string_rep[i]>>7==0)
              i += 1;
          else if (string_rep[i]>>5==0x06)
              i += 2;
          else if (string_rep[i]>>4==0x0E)
              i += 3;
          else if (string_rep[i]>>3==0x1E)
              i += 4;
          else
              //For safety
              i += 1;

          length++;
          emit getI(i);
      }
  }
}
