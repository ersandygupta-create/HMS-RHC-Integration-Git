codeunit 50018 "EDC GRN/Return Scheduler"
{
    TableNo = "EDC HIS Purchase Header";

    trigger OnRun()
    begin
        PurHeader.Copy(Rec);
        ProcessData(PurHeader);
        Rec := PurHeader;
    end;

    local procedure ProcessData(var PurHeaderStaging: Record "EDC HIS Purchase Header");
    begin

        Clear(IntegrationMgmt);
        IntegrationMgmt.InitPurchaseOrder(PurHeader."Record Type", PurHeader."Document Type", PurHeader."Document No.")
    end;

    var
        PurHeader: Record "EDC HIS Purchase Header";
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
        HISIntegrationSetup: Record "EDC HIS Integartion Setup";
}
