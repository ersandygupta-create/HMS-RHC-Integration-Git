codeunit 50006 "EDC Consumption Sheduler"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        HISPharmacyPost.InitGenJnlLineConsumptionEntry();
        IntegrationMgmt.PostGenJnlLineConsumptionEntries();
    end;

    var
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
        HISPharmacyPost: Codeunit "EDC HIS Integration Mgmt.";
}
