codeunit 50007 "EDC Rev/Adv/Coll Sheduler"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        IntegrationMgmt.InitGenJnlLineRevenueStaging();
        IntegrationMgmt.PostGenJnlLineEntries();
    end;

    var
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
}
