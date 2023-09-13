// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
contract SimpleStorage{
    //boolean,uint,int,address,bytes

  //  bool hasFavNumber= true;
 //   uint favNuber=123;
 //   string favNumberinText="data";
  //  address myAddress;
  //  bytes favBytes="cat";
  //  int favouriteInt=-23;
  uint256 public  favNumber;//if no value is set default value willl be stored here it's 0
  
  //global variable can be accessed anywhere in contract
  mapping(string=>uint256) public nameToFavNumber;

// declaring arrays using structs diiferent data types
   People public person=People({favNumber:2, name:"radha"});

  //arrays and structs
  People [] public people;
  struct People
  {
      uint favNumber;
      string name;
  }
  
  function store(uint _favNumber) public virtual{
     //  uint testVar=6;// local variable
      favNumber=_favNumber;
      //favNumber=favNumber+1;//used to illustrate that more gas fee increased
     //retrieve();// cost applies here as contract is calling this function
  }

 function retrieve () public view returns (uint256){
     
     return favNumber;
    
 }

 function add () public pure returns(uint sum,uint prd){
     uint a=2;
     uint b=5;
     sum=a+b;
     prd=a*b;

 }

 function addperson(uint _favNumber, string memory _name) public{
     People memory newPerson=People({favNumber:_favNumber,name:_name});
        people.push(newPerson);
       // people.push(People(_favNumber,_name));//2 way of adding data to the dynamic array
      nameToFavNumber[_name]=_favNumber;
 }



}

