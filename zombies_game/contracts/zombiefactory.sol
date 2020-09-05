pragma solidity >=0.4.21 <0.7.0;

import "./ownable.sol";

contract ZombieFactory is Ownable{

    // 这里建立事件 用于查看事件
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    //定义结构体
    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
    }

    Zombie[] public zombies;
    // 定义映射用来控制
    /*
    第一映射--- 用来id映射 地址
    第二映射 -- 用来记录僵尸数量
    */
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) public ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) internal {
        // 这里触发事件
        uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1;
        //创造一个僵尸之后，控制这个addresss对应的僵尸数量
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);

    }
    //产生随机dna
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encode(_str)));
        return rand % dnaModulus;
    }
    // 产生随机僵尸
    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
