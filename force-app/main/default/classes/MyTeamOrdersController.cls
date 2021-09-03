/**
* This class returns a summary of the data from the Order Object
* It is ordered by the owner i.e. the sales rep.   
*/


public with sharing class MyTeamOrdersController {

 public List<AggregateResult> aggregateResultList {get; set;}

 public MyTeamOrdersController() {

     aggregateResultList = new List <aggregateResult>();
     aggregateResultList = [SELECT COUNT(id) ordCount, 
                                   SUM(TotalAmount) ordAmount, 
                                   owner.Name ordName 
                                   FROM Order 
                                   WHERE Status = 'Activated' 
                                   GROUP BY owner.Name];
 }
}