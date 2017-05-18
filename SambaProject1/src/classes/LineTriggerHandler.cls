//AUTHOR :                      Khushman,Deomurari(161183)
//CREATED :                     September 2016
//LAST MODIFIED BY :     <Firstname, LASTNAME (ID)>
//LAST MODIFIED :          <dd/mm/yyyy>
//MODIFICATION HISTORY:
         
//UST:1072
//UST TITLE :Win Loss Questionnaire
      
//PURPOSE OF DEVELOPMENT: to check duplicate question numbers



public class LineTriggerHandler
{
    //Checking for duplicate Question number in same Questionnaire, same Language and same Section
    public static void checkduplicateQNOs(List<Line__c> newTrigger, Map<id, Line__c> newTriggerMap)
    {
        //Storing Question Numbers for particular Section, Language and Questionnaire for records which are going to be inserted
        Map<Id, Map<String, Map<Id, Set<Decimal>>>> goingToInsertMap=new Map<Id, Map<String, Map<Id, Set<Decimal>>>>(); //QuestionnaireId, Language, SectionId, QNos Found
        
        Set<String> languages=new Set<String>();
        Set<Id> sections=new Set<Id>();
        Set<Decimal> questionNos=new Set<Decimal>();
        
        //Checking for duplicate question numbers in records which are going to insert for particular Section, Language and Questionnaire and adding error to record if found duplicate
        for (Line__c currLine: newTrigger)
        {
           Set<Decimal> snos=processLineQNOMap(currLine, goingToInsertMap, languages, sections, questionNos);
           if (snos.contains(currLine.SMB_Line_Question_Number__c))
           {
               currLine.SMB_Line_Question_Number__c.addError('Question number already exist for this Section and Language.');
           } else 
           {
               snos.add(currLine.SMB_Line_Question_Number__c);
               questionNos.add(currLine.SMB_Line_Question_Number__c);
           }
        }

        List<Line__c> alreadyPresent;
        //Query existing Line (excluding records which are going to be updated as they are already counted)
        if (newTriggerMap!=null)
        {
            alreadyPresent=[select id, SMB_Line_Questionnaire__c, SMB_Line_Language__c, SMB_Line_Line_Section__c, SMB_Line_Question_Number__c from Line__c
            where SMB_Line_Questionnaire__c IN :goingToInsertMap.keySet() AND SMB_Line_Language__c IN :languages AND SMB_Line_Line_Section__c IN :sections
            AND SMB_Line_Question_Number__c IN :questionNos AND ID NOT IN :newTriggerMap.keySet()];
        } else 
        {
            alreadyPresent=[select id, SMB_Line_Questionnaire__c, SMB_Line_Language__c, SMB_Line_Line_Section__c, SMB_Line_Question_Number__c from Line__c
            where SMB_Line_Questionnaire__c IN :goingToInsertMap.keySet() AND SMB_Line_Language__c IN :languages AND SMB_Line_Line_Section__c IN :sections
            AND SMB_Line_Question_Number__c IN :questionNos];
        }
        goingToInsertMap=new Map<Id, Map<String, Map<Id, Set<Decimal>>>>();  

        //Adding serial numbers of existing records in Map
        for (Line__c currLine: alreadyPresent)
        {
           Set<Decimal> snos=processLineQNOMap(currLine, goingToInsertMap, languages, sections, questionNos);
           if (!snos.contains(currLine.SMB_Line_Question_Number__c))
           {
                   snos.add(currLine.SMB_Line_Question_Number__c);

           }
        }

        //Checking for duplicate question numbers including existing records for particular Section, Language and Questionnaire and adding error to record if found duplicate
        for (Line__c currLine: newTrigger)
        {
           Set<Decimal> snos=processLineQNOMap(currLine, goingToInsertMap, languages, sections, questionNos);
           if (snos.contains(currLine.SMB_Line_Question_Number__c))
           {
               currLine.SMB_Line_Question_Number__c.addError('Question number already exist for this Section and Language.');
           }
     

        }
    }

    //Storing Question Numbers for particular Section, Language and Questionnaire for records in Map
    public static Set<Decimal> processLineQNOMap(Line__c currLine,Map<Id, Map<String, Map<Id, Set<Decimal>>>> goingToInsertMap,
        Set<String> languages, Set<Id> sections, Set<Decimal> questionNos)
        {
    
           if (!goingToInsertMap.keySet().contains(currLine.SMB_Line_Questionnaire__c))
           {
               goingToInsertMap.put(currLine.SMB_Line_Questionnaire__c, new Map<String, Map<Id, Set<Decimal>>>());
           }
           if (!goingToInsertMap.get(currLine.SMB_Line_Questionnaire__c).keySet().contains(currLine.SMB_Line_Language__c))
           {
               goingToInsertMap.get(currLine.SMB_Line_Questionnaire__c).put(currLine.SMB_Line_Language__c, new Map<Id, Set<Decimal>>());
               languages.add(currLine.SMB_Line_Language__c);
           }
           if (!goingToInsertMap.get(currLine.SMB_Line_Questionnaire__c).get(currLine.SMB_Line_Language__c).keySet().contains(currLine.SMB_Line_Line_Section__c))
           {
               goingToInsertMap.get(currLine.SMB_Line_Questionnaire__c).get(currLine.SMB_Line_Language__c).put(currLine.SMB_Line_Line_Section__c, new Set<Decimal>());
               sections.add(currLine.SMB_Line_Line_Section__c);
           }
           return goingToInsertMap.get(currLine.SMB_Line_Questionnaire__c).get(currLine.SMB_Line_Language__c).get(currLine.SMB_Line_Line_Section__c);
           
        }
  
}