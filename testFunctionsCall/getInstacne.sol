pragma solidity >=0.5.0 <0.7.0;

contract Person{
    uint age = 10;
    event getMessages(uint);

    function increaseAge(uint num)  public  returns (uint){
        return age+=num;
    }

    function getAge() public view returns (uint){
        return age;
    }

}

contract TestPerson {
  address contractAddress;

  constructor() public {
    contractAddress = new Person()
  }
  function getInstance(address _contractAddress)

}
