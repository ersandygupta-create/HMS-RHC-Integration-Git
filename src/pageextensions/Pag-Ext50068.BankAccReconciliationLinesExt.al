pageextension 50068 "Bank Acc. Recon Lines Ext" extends "Bank Acc. Reconciliation Lines"
{
    layout
    {
        addafter(Difference)
        {
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                Caption = 'UTR No.';
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