tableextension 50012 "EDC HIS Return Shipment Header" extends "Return Shipment Header"
{
    fields
    {
        field(50000; "EDC Capex Type"; Enum "EDC Capex Type")
        {
            Caption = 'Capex Type';
            DataClassification = CustomerContent;
        }
        field(50001; "EDC Work Order Type"; Enum "EDC Work Order Type")
        {
            Caption = 'Work Order Type';
            DataClassification = CustomerContent;
        }
        field(50002; "EDC Item Type"; Enum "EDC HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
    }
}
