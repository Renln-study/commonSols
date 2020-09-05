pragma solidity ^0.5.0;

contract Ademo {
    uint number ;
   //  声明一个地址类型的状态变量owner；
    address  owner;
    event getMessage(address,string);
    constructor() public  {
       // 构造函数，给状态变量owner赋值
       owner = msg.sender;
       number += 10;
    }
    function increment(uint addNum) public {
       if (owner == msg.sender) {
          number = number + addNum;
       }
    }

    function getCurrentNum() public view returns (uint) {
       return number;
    }

    function kill() external {
       if (owner == msg.sender) {
         emit getMessage(msg.sender,"successful!");
          // 析构函数，销毁合约，只有合约持有者调用这个方法才会进内部逻辑
          selfdestruct(address(uint(owner)));
       }
    }
}
