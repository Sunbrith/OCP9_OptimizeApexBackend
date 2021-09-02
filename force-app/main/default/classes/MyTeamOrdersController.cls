public without sharing class MyTeamOrdersController {
     public AggregateResult[] getOrders{
        get{
           return [SELECT Owner.Name ownerName, SUM(TotalAmount) totalAmount FROM Order 
                    WHERE Status = 'Ordered' GROUP BY Owner.Name];
        }    
    	set;
    }
       public decimal sumOrders{
        get{
			AggregateResult groupedResults = [SELECT SUM(TotalAmount) total FROM Order];
			return (decimal)groupedResults.get('total');
        }
        set;
    }
}