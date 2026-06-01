pageextension 50007 "EDC Bank Payment Voucher" extends "Bank Payment Voucher"
{
    layout
    {
        addafter(Amount)
        {
            field("DebitAmount"; Rec."Debit Amount")
            {
                ApplicationArea = All;
                Caption = 'Debit Amount';
                ToolTip = 'Specifies the Debit Amount that the entry on the journal line will be posted to.';
            }
            field("CreditAmount"; Rec."Credit Amount")
            {
                ApplicationArea = All;
                Caption = 'Credit Amount';
                ToolTip = 'Specifies the Credit Amount that the entry on the journal line will be posted to.';
            }
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = All;
                Editable = true;
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
            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purchase Order No. field.';
            }
            field("Recipient Bank Account"; Rec."Recipient Bank Account")
            {
                Caption = 'Vendor Bank';
                ToolTip = 'Specifies the value of the Purchase Recipient Bank Account field.';
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        addafter("Void &All Checks")
        {
            action("Axis Print Check")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Multiple Vendor Check Print A';
                Image = Report;
                RunObject = report "Axis Bank Check_M";
                RunPageMode = Edit;
            }
            action("Check Print Check")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Check Print H';
                Image = Report;
                RunObject = report "Bank Check H";
                RunPageMode = Edit;
            }
        }
    }
}