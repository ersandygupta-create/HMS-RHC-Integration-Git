codeunit 50019 "EDC GRN/GRN Return Create"
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
                if ProcessGRNReturn.Run(GRNHeader) then;
            until xGRNHeader.Next() = 0;
    end;

    var
        xGRNHeader: Record "EDC HIS Purchase Header";
        GRNHeader: Record "EDC HIS Purchase Header";
        ProcessGRNReturn: Codeunit "EDC GRN/Return Scheduler";
}
