tableextension 50014 "EDC HIS Bank Ledger Entry" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "EDC UTR No."; Code[35])
        {
            Caption = 'UTR No.';
            DataClassification = CustomerContent;
        }
        field(50017; "EDC Narration"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Narration';
        }
        field(50120; "EDC Line Narration"; Text[250])
        {
            Caption = 'Line Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = field("Entry No."), "Transaction No." = field("Transaction No.")));
        }
        field(50121; "EDC Voucher Narration"; Text[250])
        {
            Caption = 'Voucher Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = const(0), "Transaction No." = field("Transaction No.")));
        }
        field(50122; "E3 UTR No."; Code[35])
        {
            Caption = 'E3 UTR No.';
            DataClassification = CustomerContent;
        }
    }
    procedure E3SetBankReconciliationCandidatesFilter(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        FilterDate: Date;
    begin
        Rec.Reset();
        Rec.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        Rec.SetRange("Statement Status", Rec."Statement Status"::Open);
        Rec.SetFilter("Remaining Amount", '<>%1', 0);
        rec.SetFilter("E3 UTR No.", '<>%1', '');
        Rec.SetRange("Reversed", false); // PR 30730


        FilterDate := BankAccReconciliation.MatchCandidateFilterDate();
        if FilterDate <> 0D then
            Rec.SetFilter("Posting Date", '<=%1', FilterDate);

        // Records sorted by posting date to optimize matching
        Rec.SetCurrentKey("Posting Date");
        Rec.SetAscending("Posting Date", true);

        E3OnAfterSetBankReconciliationCandidatesFilter(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure E3OnAfterSetBankReconciliationCandidatesFilter(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    begin
    end;

}
