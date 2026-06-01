tableextension 50020 "EDC HIS Purch. Cr. Memo Line" extends "Purch. Cr. Memo Line"
{
    fields
    {

        field(50000; "EDC Item Type"; Enum "EDC HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        field(50002; "EDC HIS Type"; Enum "EDC HIS Type")
        {
            Caption = 'HIS Type';
            DataClassification = CustomerContent;
        }

    }
}

