pageextension 50069 "Apply Bank Acc. Led Ent Ext" extends "Apply Bank Acc. Ledger Entries"
{
    layout
    {
        addafter("Credit Amount")
        {
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                Caption = 'UTR No.';
                ApplicationArea = All;
            }
            field("Cheque No."; Rec."Cheque No.")
            {
                Caption = 'Cheque No.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}