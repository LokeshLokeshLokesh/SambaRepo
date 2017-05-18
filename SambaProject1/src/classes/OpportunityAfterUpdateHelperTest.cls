@isTest
private class OpportunityAfterUpdateHelperTest {

    static testMethod void addchatterFeedOnAmountChangeTest1() {    
        System.assertEquals(true, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(0, 10));
    }
    
    static testMethod void addchatterFeedOnAmountChangeTest2() {    
        System.assertEquals(true, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(10, 0));
    }
    
    static testMethod void addchatterFeedOnAmountChangeTest3() {
        Decimal prevValue = 100;
        Decimal newValue = prevValue+((Decimal.valueOf(System.Label.SMB_Threshold_Percentage_Variation_For_Amount_Value_on_Opportunity)/100)*prevValue);
        System.assertEquals(true, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(newValue, prevValue));
    }
    
    static testMethod void addchatterFeedOnAmountChangeTest4() {
        Decimal prevValue = 100;
        Decimal newValue = prevValue-((Decimal.valueOf(System.Label.SMB_Threshold_Percentage_Variation_For_Amount_Value_on_Opportunity)/100)*prevValue);
        System.assertEquals(true, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(newValue, prevValue));
    }
    
    static testMethod void addchatterFeedOnAmountChangeTest5() {
        Decimal prevValue = 100;
        Decimal newValue = prevValue+(((Decimal.valueOf(System.Label.SMB_Threshold_Percentage_Variation_For_Amount_Value_on_Opportunity)/100)*prevValue)-5);  
        System.assertEquals(false, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(newValue, prevValue));
    }
    
    static testMethod void addchatterFeedOnAmountChangeTest6() {    
        Decimal prevValue = 100;
        Decimal newValue = prevValue-(((Decimal.valueOf(System.Label.SMB_Threshold_Percentage_Variation_For_Amount_Value_on_Opportunity)/100)*prevValue)-5);
        System.assertEquals(false, OpportunityAfterUpdateHelper.addchatterFeedOnAmountChange(newValue, prevValue));
    }
    
    static testMethod void getURLTest() {
        try{
            OpportunityAfterUpdateHelper.getURL();
            System.assert(true, 'Running as Expected');        
        }catch(Exception ex){
            System.assert(false, 'Falied');
        }
        
    }
    
}