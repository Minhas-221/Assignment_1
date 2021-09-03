pragma solidity >=0.7.0 <0.9.0;

contract TShirtDeal
{

    bool deal = false;
    address public Beach;
    uint public QuantityofTShirts;
    string public PaymentStatus = "Pending";
    address public ThreadsInc;
    string public OrderStatus = "Pending";
    uint public Cost;

    constructor(uint quantity) public
    {
        Beach = msg.sender;
        QuantityofTShirts = quantity;
    }

    function AcceptOffer() public
    {
        if ( msg.sender == Beach )
        {
            revert("Threads Inc will accept the offers!");
        }

        deal = true;
        OrderStatus = "Order Complete!";
        Cost = QuantityofTShirts*700;
    }
    
    function MakePayment() public
    {
        
        if ( deal == false )
        {
            if (msg.sender == Beach)
            {
                revert("LET THE OFFER BE ACCEPTED FIRST");
            }
            else
            {
                revert("THREADS INC CAN'T MAKE PAYMENTS FOR THEMSELVES");
            }
        }
        
        else
        {
            if ( msg.sender != Beach )
            {
                revert("THREADS INC CAN'T MAKE PAYMENT FOR THEMSELVES");
            }
            
            PaymentStatus = "IT IS DONE";
        }
        
    }