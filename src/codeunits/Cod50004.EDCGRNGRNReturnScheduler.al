codeunit 50004 "EDC GRN/GRN Return Scheduler"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        ProcessData();
    end;

    local procedure ProcessData()
    begin
        xGRNHeader.Reset();
        xGRNHeader.SetRange("Create PO", false);
        if xGRNHeader.FindSet() then
            repeat
                GRNHeader := xGRNHeader;
                IntegrationMgmt.InitPurchaseOrder(GRNHeader."Record Type", GRNHeader."Document Type", GRNHeader."Document No.");
            until xGRNHeader.Next() = 0;
    end;

    var
        xGRNHeader: Record "EDC HIS Purchase Header";
        GRNHeader: Record "EDC HIS Purchase Header";
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
}
