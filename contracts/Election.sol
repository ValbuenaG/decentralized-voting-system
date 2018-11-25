pragma solidity ^0.4.24;

contract Election {
    //Model of a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //Store Candidate
    mapping(uint => Candidate) public candidates;
    //Store Candidates Count
    uint public candidatesCount;
    //constuctor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}

