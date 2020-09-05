contract ReplicatorB {

    address creator;
    uint blockCreatedOn;

    function Replicator()
    {
        creator = msg.sender;
        blockCreatedOn = block.number;
    }

	function getBlockCreatedOn() constant returns (uint)
	{
		return blockCreatedOn;
	}

    function kill()
    {
        if (msg.sender == creator)
        {
            suicide(creator);  // kills this contract and sends remaining funds back to creator
        }
    }
}


//复制器
contract ReplicatorA {

  address creator;
	address baddress;
	uint blockCreatedOn;

    function Replicator()
    {
        creator = msg.sender;
        baddress = new ReplicatorB();		 // This works just fine because A already knows about B
        blockCreatedOn = block.number;
    }

	function getBAddress() constant returns (address)
	{
		return baddress;
	}

	function getBlockCreatedOn() constant returns (uint)
	{
		return blockCreatedOn;
	}

    function kill()
    {
        if (msg.sender == creator)
        {
            suicide(creator);  // kills this contract and sends remaining funds back to creator
        }
    }
}
