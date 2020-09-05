/**
 *  调用solidity提供的api 存在于全局命名空间
 */
pragma solidity >= 0.5.0 < 0.7.0;

contract TestAllSolapis {
 event getValues(uint);
  //调用msg.value必须声明为payable
  constructor() public payable {

  }
  function getSender() public view returns(address) {
        // 获取当前调用发起人的地址
        return msg.sender;
    }

    function getValue() public payable returns(uint) {
        // 获取这个消息所附带的以太币，单位为wei
        emit getValues(msg.value);
        return msg.value;
    }

    function getBlockCoinbase() public view returns(address) {
        // 获取当前块矿工的地址
        return block.coinbase;
    }

    function getBlockDifficulty() public view returns(uint) {
        // 获取当前块的难度
        return block.difficulty;
    }

    function getBlockNumber() public view returns(uint) {
        // 获取当前区块的块号
        return block.number;
    }

    function getBlockTimestamp() public view returns(uint) {
        // 获取当前块的Unix时间戳
        return block.timestamp;
    }

    function getNow() public view returns(uint) {
        // 获取当前块的时间戳
        return now;
    }

    function getGasprice() public view returns(uint) {
        // 获取交易的gas价格
        return tx.gasprice;
    }
    function getData(uint x) public view returns(bytes memory data) {
        // 获取全部信息
        //msg.data表示当前执行函数的调用数据，包含函数标识（即sha3散列值的前8位）。
        //如果执行函数包含参数，则其还包含参数值。
        data = msg.data;
        return data;
    }
}
