<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Tax_me1</fullName>
        <field>IsTaxble__c</field>
        <literalValue>1</literalValue>
        <name>Tax me1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Tax me</fullName>
        <actions>
            <name>Tax_me1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Salary_Credited_Till_Date__c &gt;25000</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
