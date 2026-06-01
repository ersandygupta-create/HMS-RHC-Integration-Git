tableextension 50000 "EDC HIS Vendor Ext" extends Vendor
{
    fields
    {
        field(50000; "EDC HIS Code"; Code[20])
        {
            Caption = 'HIS Code';
            DataClassification = CustomerContent;
        }
        field(50001; "EDC MSME Type"; Boolean)
        {
            Caption = 'MSME Type';
            DataClassification = CustomerContent;
        }
        field(50002; "EDC HIS Type"; Enum "EDC HIS Type")
        {
            Caption = 'HIS Type';
            DataClassification = CustomerContent;
        }
        field(50003; "EDC Auto E-Mail"; Boolean)
        {
            Caption = 'Auto E-Mail';
            DataClassification = CustomerContent;
        }
        field(50004; "DL No."; Text[20])
        {
            Caption = 'DL No.';
            DataClassification = CustomerContent;
        }
        field(50015; "EDC Sync Record Exists"; Boolean)
        {
            Caption = 'Sync Record Exists';
            CalcFormula = exist("EDC API Supplier Update Log" where("No." = field("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50016; "EDC MSME No."; Code[20])
        {
            Caption = 'MSME No.';
            DataClassification = CustomerContent;
        }
        field(50050; "Opening Balance (LCY)"; Decimal)
        {
            Caption = 'Opening Balance (LCY)';
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                       "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                       "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                       "Currency Code" = field("Currency Filter"),
                       "Posting Date" = field("Opening Filter"),
                       "Entry Type" = filter(<> Application)));

            FieldClass = FlowField;
            Editable = false;
        }
        field(50051; "Closing Balance (LCY)"; Decimal)
        {
            Caption = 'Closing Balance (LCY)';
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                       "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                       "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                       "Currency Code" = field("Currency Filter"),
                       "Posting Date" = field(UPPERLIMIT("Date Filter")),
                       "Entry Type" = filter(<> Application)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50052; "Opening Filter"; Date)
        {
            Caption = 'Opening Filter';
            FieldClass = FlowFilter;
        }
        modify("Date Filter")
        {
            trigger OnAfterValidate()
            begin
                IF GETFILTER("Date Filter") <> '' THEN BEGIN
                    SETRANGE("Opening Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                END;

            end;
        }


    }
    trigger OnBeforeRename()
    begin
        if (Rec."No." <> xRec."No.") and (xRec."No." <> '') then
            Error('You cannot modify the Vendor No.');
    end;

    // trigger OnBeforeRename()
    // begin
    //     CalcFields("EDC Sync Record Exists");
    //     if "EDC Sync Record Exists" then
    //         Error('Record synchronized to HIS, rename is not allowed');
    // end;
}
