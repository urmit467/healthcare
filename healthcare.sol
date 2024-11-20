//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Medicalrecords{
    uint public recordsId;
    mapping(uint=>Record) records;
    mapping(uint=>bool)public isDeleted;
    struct Record{
        uint recordsId;
        uint timestamp;
        string name;
        uint age;
        string gender;
        string bloodType;
        string allergies;
        string diagnosis;
        string treatment;
    }

    event Medicalrecords__AddRecord(
        uint recordsId , 
        uint256 time,
        string name,
        uint age,
        string gender,
        string bloodType,
        string allergies,
        string treatment

    );

    function addRecord(
        string memory _name,
        uint _age, 
        string memory _gender, 
        string memory _bloodType, 
        string memory _allergies, 
        string memory _diagnosis, 
        string memory _treatment
    ) public {
        recordsId++;
        records[recordsId] = Record(
            recordsId,
            block.timestamp,
            _name,
            _age,
            _gender,
            _bloodType,
            _allergies,
            _diagnosis,
            _treatment



        );
        emit Medicalrecords__AddRecord(
            recordsId, 
            block.timestamp, 
            _name, 
            _age, 
            _gender, 
            _bloodType, 
            _allergies, 
            _treatment
        );

    }
    event Medicalrecords__DeleteRecord(
        uint recordsId , 
        uint256 time,
        string name,
        uint age,
        string gender,
        string bloodType,
        string allergies,
        string diagnosis,
        string treatment

    );

    function deleteRecord(uint256 _recordsId) public {
        require(!isDeleted[_recordsId],"The record is always deleted");
        Record storage record = records[_recordsId];
        emit Medicalrecords__DeleteRecord(
        record.recordsId,
        block.timestamp,
        record.name,
        record.age,
        record.gender,
        record.bloodType,
        record.allergies,
        record.diagnosis,
        record.treatment
    );
    isDeleted[_recordsId] = true;
    }

    function getRecordsId() public view returns(uint){
        return recordsId;
    }
    function getTimestamp(uint _recordsId) public view returns(uint){
        return records[_recordsId].timestamp;
    }
    function getName(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].name;
    }
    function getAge(uint _recordsId) public view returns (uint) {
        return records[_recordsId].age;
    }
    function getGender(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].gender;
    }
    function getBloodType(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].bloodType;
    }
    function getAllergies(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].allergies;
    }
    function getDagnosis(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].diagnosis;
    }
    function getTreatment(uint _recordsId) public view returns (string memory) {
        return records[_recordsId].treatment;
    }
    function getDeleted(uint _recordsId) public view returns (bool){
        return isDeleted[_recordsId];
    }
}