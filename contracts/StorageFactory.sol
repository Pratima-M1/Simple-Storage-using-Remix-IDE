// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage []  public  simpleStorageArray;
    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);  
    }

    function sfStore(uint256 _simpleStoreIndex,uint256  _simpleStorageNumber) public {
       // SimpleStorage simpleStorage=simpleStorageArray[_simpleStoreIndex];
       //simpleStorage.store(_simpleStorageNumber);
        simpleStorageArray[_simpleStoreIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStoreIndex) public view returns(uint256){
      //  SimpleStorage simpleStorage=simpleStorageArray[_simpleStoreIndex];
     //return simpleStorage.retrieve();
       return simpleStorageArray[_simpleStoreIndex].retrieve();
    }
}
