pageextension 50005 "EDC HIS G/L Entries" extends "General Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Amount LCY"; Rec.Amount)
            {
                ApplicationArea = All;
                Caption = 'Amount';
                ToolTip = 'Specifies the value of the Amount field.';
            }
            field("EDC Narration"; Rec."EDC Narration")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Narration field.';
            }
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Document Date field.';
            }
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the UTR No. field.';
            }
            field("EDC HIS Module"; Rec."EDC HIS Module")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the HIS Module field.';
            }
            field("EDC HIS Document Type"; Rec."EDC HIS Document Type")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the HIS Document Type field.';
            }
            field("EDC Store Code"; Rec."EDC Store Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Store Code field.';
            }
            field("EDC Sub Group Code"; Rec."EDC Sub Group Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Sub Group Code field.';
            }
            field("EDC Receipt No."; Rec."EDC Receipt No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Receipt No. field.';
            }

            field("EDC UHID"; Rec."EDC UHID")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the UHID field.';
            }
            field("EDC Patient Name"; Rec."EDC Patient Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Patient Name field.';
            }
            field("EDC Validation Key"; Rec."EDC Validation Key")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Validation Key field.';
            }
            field("EDC Encounter No."; Rec."EDC Encounter No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Encounter No. field.';
            }
            field("EDC Doctor Name"; Rec."EDC Doctor Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Doctor Name field.';
            }
            field("EDC Speciality"; Rec."EDC Speciality")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Speciality field.';
            }
            field("EDC Sponsor Code"; Rec."EDC Sponsor Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Sponsor Code field.';
            }
            field("EDC Sponsor Name"; Rec."EDC Sponsor Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Sponsor Name field.';
            }
            field("EDC Payer Code"; Rec."EDC Payer Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Payer Code field.';
            }
            field("EDC Payer Name"; Rec."EDC Payer Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Payer Name field.';
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

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the SystemCreatedAt field.';
            }
            field("Created By"; Rec."User ID")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the SystemCreatedBy field.';
            }


        }
    }

    actions
    {
        addafter("Print Voucher")
        {
            action("Print Voucher Dimension")
            {
                ApplicationArea = All;
                Caption = 'Print Voucher Dimension';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;
                ToolTip = 'Executes the Print Voucher Dimension action.';
                trigger OnAction()
                begin
                    GLEntry.RESET;
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", Rec."Document No.");
                    GLEntry.SETRANGE("Posting Date", Rec."Posting Date");
                    if GLEntry.FindFirst() then
                        REPORT.RUNMODAL(REPORT::"Posted Voucher - Post Voucher", TRUE, TRUE, GLEntry);

                end;
            }
        }


    }
    var
        GLEntry: Record "G/L Entry";
}
