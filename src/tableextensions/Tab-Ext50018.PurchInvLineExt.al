tableextension 50018 "EDC HIS Purch. Inv. Line" extends "Purch. Inv. Line"
{
    fields
    {

        field(50000; "EDC HIS Item Type"; Enum "EDC HIS Item Type")
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
