pragma solidity >=0.5.0 <0.7.0;

contract Person{

    uint age = 10;
    event getMessages(uint);
    //构造器会自动修改age的值
    constructor(uint a) public {
       age += a;
       emit getMessages(age);
    }

    function increaseAge(uint num)  public  returns (uint){
        return age += num;
    }

    function getAge() public view returns (uint){
        return age;
    }

}


contract CallTestPerson{

  uint a = 10;
  //首先声明一个Person变量
  Person person;
  event GetInstance(Person);

  constructor() public {
    //Person合约中的构造器来产生新的对象；并且newPerson对应的age将是 20+10
      Person newPerson = new Person(20);
    //事件可以获取newPerson对象 ，根据日志可知，就是对应的智能合约地址
      emit GetInstance(newPerson);
  }

	/*
	@param personAddr --智能合约地址
	@return  返回当前Person对象中age的值
	*/
    // function CallTestdemo(address personAddr) public returns (uint) {
    //     /* emit GetInstance(newPerson); */
    //     person = Person(personAddr);
    //     person.increaseAge(21);
    //     return person.getAge();
    // }
    
    // function callIncreaseAge(uint num) public  returns (uint){
    //     return person.increaseAge(num);
    // }
}