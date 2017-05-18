<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Updated_Created_By_ID_Field</fullName>
        <field>CreatedById__c</field>
        <formula>$Organization.Id + &apos;-&apos; +  $User.Id</formula>
        <name>Updated Created By ID Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Created_By_Name_Field</fullName>
        <field>CreatedByName__c</field>
        <formula>$User.LastName + &apos;, &apos; + $User.FirstName</formula>
        <name>Updated Created By Name Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Created_Field</fullName>
        <field>Created__c</field>
        <formula>NOW()</formula>
        <name>Updated Created Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Dealmaker_ID_Field</fullName>
        <field>DealmakerID__c</field>
        <formula>$Organization.Id  + &apos;-&apos; + Id</formula>
        <name>Updated Dealmaker ID Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Last_Updated_By_ID_Field</fullName>
        <field>LastUpdatedById__c</field>
        <formula>$Organization.Id + &apos;-&apos; +  $User.Id</formula>
        <name>Updated Last Updated By ID Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Last_Updated_By_Name_Field</fullName>
        <field>LastUpdatedByName__c</field>
        <formula>$User.LastName + &apos;, &apos; + $User.FirstName</formula>
        <name>Updated Last Updated By Name Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Last_Updated_Field</fullName>
        <field>LastUpdated__c</field>
        <formula>NOW()</formula>
        <name>Updated Last Updated Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Insight GUID</fullName>
        <actions>
            <name>Updated_Created_By_ID_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Created_By_Name_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Created_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Dealmaker_ID_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Last_Updated_By_ID_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Last_Updated_By_Name_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Last_Updated_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK(DealmakerID__c) || ISNULL(DealmakerID__c)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
