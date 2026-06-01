pageextension 50002 "EDC HIS Vendor Bank Acc. Card" extends "Vendor Bank Account Card"
{
    layout
    {
        addlast(General)
        {
            field("EDC IFSC Code"; Rec."EDC IFSC Code")
            {
                Caption = 'IFSC Code';
                ToolTip = 'Enter IFDC Code of Bank Account.';
                ApplicationArea = all;
            }
        }
    }
}
