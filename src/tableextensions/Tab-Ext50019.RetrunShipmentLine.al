tableextension 50019 "EDC HIS Retrun Shipment Line" extends "Return Shipment Line"
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
