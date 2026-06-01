codeunit 50009 "EDC Revenue Post Mgmt."
{
    TableNo = "EDC HIS Revenue Header";

    trigger OnRun()
    begin
        xRevHeader.Copy(Rec);
        PostLine(xRevHeader);
        Rec := xRevHeader;
    end;

    local procedure PostLine(var RevHeader: Record "EDC HIS Revenue Header")
    begin
        Clear(IntegrationMgmt);
        IntegrationMgmt.CreateAndPostRevenueInvoice(RevHeader);
    end;

    var
        xRevHeader: Record "EDC HIS Revenue Header";
        IntegrationMgmt: Codeunit "EDC HIS Integration Mgmt.";
}
