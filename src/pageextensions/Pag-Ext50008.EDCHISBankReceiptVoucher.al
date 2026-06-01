pageextension 50008 "EDC HIS Bank Receipt Voucher" extends "Bank Receipt Voucher"
{
    layout
    {
        addlast(Control1)
        {
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the account posting group that the entry on the journal line will be posted to.';
            }
            field("EDC Narration"; Rec."EDC Narration")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Narrantion field.';
            }
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the UTR No. field.';
            }
            field("EDC HIS Module"; Rec."EDC HIS Module")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HIS Module field.';
            }
            field("EDC HIS Document Type"; Rec."EDC HIS Document Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HIS Document Type field.';
            }
            field("EDC Store Code"; Rec."EDC Store Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Code field.';
            }
            field("EDC Sub Group Code"; Rec."EDC Sub Group Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sub Group Code field.';
            }
            field("EDC Receipt No."; Rec."EDC Receipt No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Receipt No. field.';
            }

            field("EDC UHID"; Rec."EDC UHID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the UHID field.';
            }
            field("EDC Patient Name"; Rec."EDC Patient Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Patient Name field.';
            }
            field("EDC Validation Key"; Rec."EDC Validation Key")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vaidation Key field.';
            }
        }
    }
}
