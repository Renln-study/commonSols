pragma solidity >=0.5.0 <0.7.0;

contract Person{
    uint age = 10;
    event getMessages(uint);
    constructor(uint a) public {
       age += a;
       emit getMessages(age);
    }
    function increaseAge(uint num)  public  returns (uint){
        return age+=num;
    }

    function getAge() public view returns (uint){
        return age;
    }

}


contract CallTest{

  uint a = 10;
  //首先声明一个Person变量
  Person person;
  event GetInstance(Person);
  constructor() public {
    //Person合约中的构造器来产生新的对象；
      Person newPerson = new Person(20);
      emit GetInstance(newPerson);
  }

    function CallTestdemo(address personAddr) public returns (uint) {
        /* emit GetInstance(newPerson); */
        person = Person(personAddr);
        person.increaseAge(21);
        return person.getAge();
    }
    function callIncreaseAge(uint num) public  returns (uint){
        return person.increaseAge(num);
    }
}
