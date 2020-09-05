pragma solidity >=0.4.21 <0.7.0;

contract TestMsgValue {

  address owner;
  uint fee = 32 wei;
  event MsgValue(uint);
  event Tansfer(address from, address to, uint count);

//如果不提前声明合约为payable 那么remix构造函数时将不能使用value赋予价值
   /* constructor() public payable {
     owner = msg.sender;
     /* emit MsgValue(msg.value); 
  } */

  function show() public payable returns (uint) {
    /* require(msg.value >= fee);
    owner.transfer(msg.value - fee); */
     emit MsgValue(msg.value);
    /* emit MsgValue(msg.value); */

  }
  function getBalance() public view returns (uint)  {
    return address(this).balance;
  }
  function transferValue(address getValueAddress, uint count) public  {
    emit Tansfer(address(this), msg.sender, count);
    msg.sender.transfer(count);
    getBalance();
  }

}
