pragma solidity >=0.4.21 <0.7.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {


      //申明变量 等级升级费用
      uint levelUpFee  = 0.001 ether;

    //限制器 用于设置等级
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(keccak256(abi.encode(zombies[_zombieId].level)) >=
        keccak256(abi.encode(_level)));
        _;
    }

    //僵尸升级函数，传入参数僵尸id，external，payable
    function levelUp(uint _zombieId) external payable {
      require(msg.value == levelUpFee);
      zombies[_zombieId].level++;
    }

    // external 可以用于合约外部访问， internal用于合约内部，不同合约之间进行访问
    /*
    修改僵尸姓名，僵尸dna，但是需要设置不同的等级
    */
    function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId){
       require(msg.sender == zombieToOwner[_zombieId]);
      zombies[_zombieId].name = _newName;
    }

    function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId){
       require(msg.sender == zombieToOwner[_zombieId]);
      zombies[_zombieId].dna = _newDna;
    }
    //获取合约地址获取该地址下面的僵尸
    function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
      //根据该地址下面的僵尸数量，申请相应空间的内存空间
      uint[] memory result = new uint[](ownerZombieCount[_owner]);
      uint counter = 0;
      //??????uint256 uint32?
      for (uint i = 0; i < zombies.length; i++) {
        if(zombieToOwner[i] == _owner ) {
          result[counter] = i ;
          counter++;
        }
      }
      return result;
    }
}
