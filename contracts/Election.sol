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
        addCandidate("candidate 1");
        addCandidate("candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}

