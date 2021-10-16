pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract multiplication {
    // This variable stores a result of multiply 
    int8 public multiplication = 1;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier multiplyModifief{
        require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
        _;
    }

    function multiply(int8 value) public multiplyModifief{
        require(value >= 1 && value <= 10, 103);
        multiplication *= value;
    }
}
