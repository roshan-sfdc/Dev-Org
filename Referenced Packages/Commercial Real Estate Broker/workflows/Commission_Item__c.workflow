<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Commission_Item_Calculate_Amount</fullName>
        <field>Amount__c</field>
        <formula>Rent_Sq_Ft__c * Area_Sq_Ft__c</formula>
        <name>Commission Item - Calculate Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Commission Item - Calculate Amount from Area</fullName>
        <actions>
            <name>Commission_Item_Calculate_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Area_Sq_Ft__c)) &amp;&amp; NOT(ISBLANK(Rent_Sq_Ft__c ))  &amp;&amp; (Area_Sq_Ft__c * Rent_Sq_Ft__c &lt;&gt; Amount__c || ISBLANK(Amount__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
