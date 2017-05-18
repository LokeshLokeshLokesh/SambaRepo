<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Updated_Dealmaker_ID_Field</fullName>
        <field>DealmakerID__c</field>
        <formula>$Organization.Id  + &apos;-&apos; + Id</formula>
        <name>Updated Dealmaker ID Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Insight_Subcategory GUID</fullName>
        <actions>
            <name>Updated_Dealmaker_ID_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK(DealmakerID__c) || ISNULL(DealmakerID__c)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
