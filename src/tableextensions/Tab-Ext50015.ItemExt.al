tableextension 50015 "EDC HIS Item" extends Item
{
    fields
    {
        field(50000; "EDC HIS Type"; Enum "EDC HIS Type")
        {
            Caption = 'HIS Type';
            DataClassification = CustomerContent;
        }
        field(50001; "EDC Item Type"; Enum "EDC HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
    }
}
