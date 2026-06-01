tableextension 50017 "EDC HIS Purch. Recpt. Line" extends "Purch. Rcpt. Line"
{
    fields
    {

        field(50000; "EDC Item Type"; Enum "EDC HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
    }
}
