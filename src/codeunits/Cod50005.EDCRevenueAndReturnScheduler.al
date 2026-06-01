codeunit 50005 "EDC Rev./Rev. Ret. Scheduler"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        HISIntegrationSetup.Get();
        ProcessData();
    end;

    local procedure ProcessData()
    begin
        xRevHeader.Reset();
        xRevHeader.SetRange("Create Revenue", false);
        if xRevHeader.FindSet() then
            repeat
                RevHeader := xRevHeader;
                if HISIntegrationSetup."Rev./Rev.Cancel Direct Post" then begin
                    Clear(RevPostMgmt);
                    if RevPostMgmt.Run(RevHeader) then;
                end else begin
                    Clear(IntegrationMgmt);
                    IntegrationMgmt.InitRevenueInvoice(RevHeader."Record Type", RevHeader."Document Type", RevHeader."Document No.");
                end;
            until xRevHeader.Next() = 0;
    end;

    var
        HISIntegrationSetup: Record "EDC HIS Integartion Setup";
        xRevHeader: Record "EDC HIS Revenue Header";
        RevHeader: Record "EDC HIS Revenue Header";
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
        RevPostMgmt: Codeunit "EDC Revenue Post Mgmt.";
}
