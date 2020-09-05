pragma solidity >=0.5.0 <0.7.0;

contract D {
    uint x;
    constructor(uint a) public payable {
          x = a;
      }
      function getX() public  view returns (uint) {
        return x;
      }
      function  getBalance() public  view returns (uint) {
        return address(this).balance;
      }
}

contract C {
    D d ;
    event getDAddress(D);
    /* event getBalance(uint); */
    constructor() public {
        emit getDAddress(d);
        d = new D(4); // 将作为合约 C 构造函数的一部分执行
        emit getDAddress(d);
    }

    function createD(uint arg) public {
        D newD = new D(arg);
        emit getDAddress(newD);
        // address(newD).call.getX();
        /* emit getbalance(newD.getX()); */
    }
    function createAndEndowD(uint arg, uint amount) public payable {
                //随合约的创建发送 ether
        D newD = (new D).value(amount)(arg);
          emit getDAddress(newD);
    }

    function  getbalance(D _d) public view returns (uint) {
      return  _d.getBalance();
    }
    function getX(D _d) public view returns (uint) {
      return _d.getX();
    }
    function getBalance() public view returns (uint) {
      return address(this).balance;
    }
}
