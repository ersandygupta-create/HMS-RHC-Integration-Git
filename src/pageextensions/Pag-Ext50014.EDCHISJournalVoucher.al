pageextension 50014 "EDC HIS Journal Voucher" extends "Journal Voucher"
{
    layout
    {
        addlast(Control1)
        {
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posting Group field.';
            }
            field("Amount Excl. GST"; Rec."Amount Excl. GST")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Amount Excl. GST field.';
            }
            field("EDC Narration"; Rec."EDC Narration")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Narration field.';
            }
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the UTR No. field.';
            }
        }
    }
}
