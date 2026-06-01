tableextension 50055 "Bank Account" extends "Bank Account"
{
    fields
    {
        field(50050; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where("Bank Account No." = field("No."),
                       "Posting Date" = field("Opening Filter"),
                       "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                       "Global Dimension 2 Code" = field("Global Dimension 2 Filter")));

            Caption = 'Opening Balance';
            FieldClass = FlowField;
            Editable = false;

        }
        field(50051; "Opening Filter"; Date)
        {
            Caption = 'Opening Filter';
            FieldClass = FlowFilter;

        }
        modify("Date Filter")
        {
            trigger OnAfterValidate()
            begin
                SETRANGE("Opening Filter", CLOSINGDATE(GETRANGEMIN("Date Filter") - 1));
            end;
        }
    }
    trigger OnBeforeRename()
    begin
        if (Rec."No." <> xRec."No.") and (xRec."No." <> '') then
            Error('You cannot modify the Bank No.');
    end;

}

