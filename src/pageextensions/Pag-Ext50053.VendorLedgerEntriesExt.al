pageextension 50053 "EDC HIS Vend. Ledger Entries" extends "Vendor Ledger Entries"
{
    layout
    {
        addbefore("Location GST Reg. No.")
        {
            field("VendorPostingGroup"; Rec."Vendor Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Vendor Posting Group';
                Editable = false;
                ToolTip = 'Specifies the value of the Vendor Posting Group field.';
            }
            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("EDC Send E-Mail"; rec."EDC Send E-Mail")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("EDC Payment Terms Code"; Rec."EDC Payment Terms Code")
            {
                Editable = false;
                ApplicationArea = All;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            field("TDS Amount"; Rec."Total TDS Including SHE CESS")
            {
                Editable = false;
                ApplicationArea = All;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            field("EDC Narration"; Rec."EDC Narration")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Narration field.';
            }
            field("EDC Line Narration"; Rec."EDC Line Narration")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Line Narration field.', Comment = '%';
            }
            field("EDC Voucher Narration"; Rec."EDC Voucher Narration")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Voucher Narration field.', Comment = '%';
            }
            field("E3 Receipt No."; Rec."E3 Receipt No.")
            {
                Caption = 'Receipt No.';
                ToolTip = 'Specifies the value of the Receipt No. field.';
                ApplicationArea = All;
            }
            field("E3 UHID"; Rec."E3 UHID")
            {
                Caption = 'UHID';
                ToolTip = 'Specifies the value of the UHID field.';
                ApplicationArea = All;
            }
            field("E3 Patient Name"; Rec."E3 Patient Name")
            {
                Caption = 'Patient Name';
                ToolTip = 'Specifies the value of the Patient Name field.';
                ApplicationArea = All;
            }
            field("E3 Bank Account No."; Rec."E3 Bank Account No.")
            {
                Caption = 'Bank Account No.';
                ToolTip = 'Specifies the value of the Bank Account No. field.';
                ApplicationArea = All;
                Visible = false;
            }
            field("E3 IFSC Code"; Rec."E3 IFSC Code")
            {
                Caption = 'IFSC Code';
                ToolTip = 'Specifies the value of the IFSC Code field.';
                ApplicationArea = All;
                Visible = false;
            }
            field("E3 Branch"; Rec."E3 Branch")
            {
                Caption = 'Branch';
                ToolTip = 'Specifies the value of the Branch field.';
                ApplicationArea = All;
                Visible = false;
            }

        }
    }

    actions
    {
        addbefore("&Navigate")
        {
            action("EDC Print Payment Advice")
            {
                ApplicationArea = All;
                Caption = 'Print Payment Advice';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF (Rec."Document Type" = Rec."Document Type"::Payment) OR (Rec."Document Type" = Rec."Document Type"::" ") THEN begin
                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Document No.", Rec."Document No.");
                        VendorLedgerEntry.SetRange("Vendor No.", Rec."Vendor No.");
                        if VendorLedgerEntry.FindFirst() then
                            Report.RunModal(Report::"EDC Vendor - Payment Advice", true, false, VendorLedgerEntry);
                    end else
                        Error('Please Payment Advice Select only Payment Document !');
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CheckBln := USERID;
        UserSetup.RESET();
        UserSetup.SETRANGE("User ID", CheckBln);
        IF UserSetup.FIND('-') THEN
            IF UserSetup."Vendor Ledger View" <> TRUE THEN
                ERROR('Permission of Vendor Ledger View is not added in your access. If required please contact to IT Administrator ');
    END;

    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        CheckBln: Code[30];
        UserSetup: Record "User Setup";
}
