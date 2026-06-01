codeunit 50015 "EDC HIS Settlement Post Batch"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        HISIntegrationSetup.Get();
        HISIntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        HISIntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);

        IF NOT (HISIntegrationSetup."Integration Enabled") AND (HISIntegrationSetup."Revenue Creation Enabled") THEN
            Error(IntegrationErr);

        ProcessData();
    end;

    local procedure ProcessData()
    begin
        xSettlementEntry.Reset();
        xSettlementEntry.SetRange("General Entries Created", false);
        if xSettlementEntry.FindSet() then
            repeat
                SettlementEntry := xSettlementEntry;
                Clear(PostSettlementLine);
                if PostSettlementLine.Run(SettlementEntry) then;
            until xSettlementEntry.Next() = 0;
    end;

    var
        HISIntegrationSetup: Record "EDC HIS Integartion Setup";
        xSettlementEntry: Record "EDC HIS Settlement Staging";
        SettlementEntry: Record "EDC HIS Settlement Staging";
        PostSettlementLine: Codeunit "EDC Post Settlement Line";
        IntegrationErr: Label 'Integration not enabled for Settlement creation.';
}
