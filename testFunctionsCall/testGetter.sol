pragma solidity >=0.5.0 <=0.7.0;

contract Testget{
    uint public data = 115;
    string public personName;
    uint public personAge;
    struct Person{
        string name;
        uint age;
    }
    mapping(uint=>Person) public persons;

    constructor() public{
        data = 200;
        // 创建Person结构体的实例
        Person memory person = Person({
            name:"Lebron James",
            age:34
        });
        // 将person添加到persons映射中
        persons[10] = person;
        // 在合约内部不能使用persons的getter函数形式引用persons映射，
        // 所以尽管下面的代码编译不会出错，但无法成功部署在以太坊上。
        // (string memory name,uint age) = this.persons(10);

        string memory name = persons[10].name;
        uint age = persons[10].age;
        personName = name;
        personAge = age;
    }
    //内部调用getter函数
    function GetterData() public view returns (uint) {
      return this.data();
    }
}

contract GetterContract{
    Testget my = new Testget();
    function getData() public view returns(uint){
        // 调用MyContract合约中的data状态变量对应的getter函数（data函数）
        return my.data();
    }

    function getPerson(uint id) public view returns(string memory,uint){
        // 调用MyContract合约中persons状态变量对应的getter函数（persons函数）
        // 该函数返回了多个值，这些值都是Person结构体的成员，
        // 如果这个结构体的某个成员的数据类型无法通过函数返回（如mapping），那么系统就会忽略这个结构体成员。
        (string memory name,uint age) = my.persons(id);
        return (name,age);
    }
}
