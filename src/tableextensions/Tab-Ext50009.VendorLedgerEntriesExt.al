tableextension 50009 "EDC HIS Vendor Ledger Entry" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50000; "EDC Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            DataClassification = CustomerContent;
        }

        field(50001; "EDC Send E-Mail"; Boolean)
        {
            Caption = 'Send E-Mail';
            DataClassification = CustomerContent;
        }
        field(50002; "EDC Select E-Mail"; Boolean)
        {
            Caption = 'Select E-Mail';
            DataClassification = CustomerContent;
        }
        field(50003; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "EDC Narration"; Text[150])
        {
            //DataClassification = CustomerContent;
            Caption = 'Narration';
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Entry"."EDC Narration" where("Entry No." = field("Entry No.")));
        }
        field(50005; "EDC Line Narration"; Text[250])
        {
            Caption = 'Line Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = field("Entry No."), "Transaction No." = field("Transaction No.")));
        }
        field(50006; "EDC Voucher Narration"; Text[250])
        {
            Caption = 'Voucher Narration';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Narration".Narration where("Entry No." = const(0), "Transaction No." = field("Transaction No.")));
        }
        field(50007; "EDC Vendor Email"; text[250])
        {
            Caption = 'Vendor Email';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."E-Mail" where("No." = field("Vendor No.")));
        }
        field(50008; "E3 Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
        }
        field(50009; "E3 UHID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'UHID';
        }
        field(50010; "E3 Patient Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Patient Name';
        }
        field(50011; "E3 Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
        }
        field(50012; "E3 IFSC Code"; Text[20])
        {
            Caption = 'IFSC Code';
        }
        field(50013; "E3 Branch"; Text[100])
        {
            Caption = 'Branch';
        }
    }
}
