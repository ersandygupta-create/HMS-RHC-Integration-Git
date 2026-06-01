tableextension 50007 "EDC HIS Purch. Inv. Header" extends "Purch. Inv. Header"
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
        field(50003; "EDC HIS Type"; Enum "EDC HIS Type")
        {
            Caption = 'HIS Type';
            DataClassification = CustomerContent;
        }
        field(50004; "EDC Delivery Terms"; Text[150])
        {
            Caption = 'Delivery Terms';
            DataClassification = CustomerContent;
        }
        field(50005; "Store Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Name';
        }

    }
}
