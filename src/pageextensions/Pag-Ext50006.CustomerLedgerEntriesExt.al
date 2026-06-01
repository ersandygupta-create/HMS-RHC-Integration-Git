pageextension 50006 "EDC HIS Cust. Ledger Entries" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("External Document No.")
        {
            field("EDC HIS Module"; Rec."EDC HIS Module")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC HIS Document Type"; Rec."EDC HIS Document Type")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Receipt No."; Rec."EDC Receipt No.")
            {
                ApplicationArea = All;
                Editable = false;
            }

            field("EDC UHID"; Rec."EDC UHID")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Patient Name"; Rec."EDC Patient Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Encounter No."; Rec."EDC Encounter No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Doctor Name"; Rec."EDC Doctor Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Speciality"; Rec."EDC Speciality")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Sponsor Code"; Rec."EDC Sponsor Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Sponsor Name"; Rec."EDC Sponsor Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Payer Code"; Rec."EDC Payer Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("EDC Payer Name"; Rec."EDC Payer Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
