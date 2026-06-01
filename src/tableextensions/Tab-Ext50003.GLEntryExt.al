tableextension 50003 "EDC HIS G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(50000; "EDC UTR No."; Code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'UTR No.';
        }
        field(50001; "EDC HIS Module"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Module';
        }
        field(50002; "EDC HIS Document Type"; Text[60])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Document Type';
        }
        field(50011; "EDC Store Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Code';
        }
        field(50012; "EDC Sub Group Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sub Group Code';
        }
        field(50013; "EDC Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
        }
        field(50014; "EDC UHID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'UHID';
        }
        field(50015; "EDC Patient Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Patient Name';
        }
        field(50016; "EDC Validation Key"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Validation Key';
        }
        field(50017; "EDC Narration"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Narration';
        }
        field(50018; "EDC Transaction Type"; Text[50])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(50100; "EDC Encounter No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(50102; "EDC Doctor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Doctor Name';
        }
        field(50103; "EDC Speciality"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Speciality';
        }
        field(50104; "EDC Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(50105; "EDC Sponsor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(50106; "EDC Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(50107; "EDC Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }
        field(50120; "EDC Line Narration"; Text[250])
        {
            Caption = 'Line Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = field("Entry No."), "Transaction No." = field("Transaction No.")));
        }
        field(50121; "EDC Voucher Narration"; Text[250])
        {
            Caption = 'Voucher Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = const(0), "Transaction No." = field("Transaction No.")));
        }
    }
}