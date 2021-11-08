pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Multiplication {
    // This variable stores a result of multiply 
    int8 public m_multiplication = 1;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier onlyOwner{
        require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
        _;
    }

    function multiply(int8 value) public onlyOwner{
        /*
            Error: 103 - If the entered value doesn't belong to the range from 1 to 10 
        */
        require(value >= 1 && value <= 10, 103);
        m_multiplication *= value;
    }
}
