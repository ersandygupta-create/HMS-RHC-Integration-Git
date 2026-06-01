pageextension 50004 "EDC HIS General Journal" extends "General Journal"
{
    layout
    {
        addafter("External Document No.")
        {
            field("EDC Narration"; Rec."EDC Narration")
            {
                ApplicationArea = All;
            }
            field("EDC UTR No."; Rec."EDC UTR No.")
            {
                ApplicationArea = All;

            }
            field("EDC HIS Module"; Rec."EDC HIS Module")
            {
                ApplicationArea = All;

            }
            field("EDC HIS Document Type"; Rec."EDC HIS Document Type")
            {
                ApplicationArea = All;

            }
            field("EDC Store Code"; Rec."EDC Store Code")
            {
                ApplicationArea = All;

            }
            field("EDC Sub Group Code"; Rec."EDC Sub Group Code")
            {
                ApplicationArea = All;

            }
            field("EDC Receipt No."; Rec."EDC Receipt No.")
            {
                ApplicationArea = All;

            }

            field("EDC UHID"; Rec."EDC UHID")
            {
                ApplicationArea = All;

            }
            field("EDC Patient Name"; Rec."EDC Patient Name")
            {
                ApplicationArea = All;

            }
            field("EDC Validation Key"; Rec."EDC Validation Key")
            {
                ApplicationArea = All;

            }

        }
    }
}
