codeunit 50021 "LIMS Revenue Post Mgmt."
{
    TableNo = "EDC LIMS Revenue Header";

    trigger OnRun()
    begin
        xRevHeader.Copy(Rec);
        PostLine(xRevHeader);
        Rec := xRevHeader;
    end;

    local procedure PostLine(var RevHeader: Record "EDC LIMS Revenue Header")
    begin
        Clear(LIMSIntegrationMgmt);
        LIMSIntegrationMgmt.CreateAndPostRevenueInvoice(RevHeader);
    end;

    var
        xRevHeader: Record "EDC LIMS Revenue Header";
        LIMSIntegrationMgmt: Codeunit "EDC LIMS Integration Mgmt.";
}
