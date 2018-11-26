pragma solidity ^0.4.24;

contract Election {
    //Model of a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //store voters
    mapping(address => bool) public voters;
    //Store Candidate
    mapping(uint => Candidate) public candidates;
    //Store Candidates Count
    uint public candidatesCount;
    //constuctor
    event votedEvent(
        uint indexed _candidateId
    );
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // requite that they haven't voted before
        require(!voters[msg.sender]);
        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        //record that voter has voted
        voters[msg.sender] = true;
        //update candidate vote count
        candidates[_candidateId].voteCount ++;
        votedEvent(_candidateId);
    }
}

