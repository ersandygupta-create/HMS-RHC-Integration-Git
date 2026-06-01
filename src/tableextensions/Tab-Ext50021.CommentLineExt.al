tableextension 50021 "EDC HIS Comment Line" extends "Comment Line"
{
    fields
    {
        field(50000; "EDC Type"; Enum "EDC Master Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
    }
}
