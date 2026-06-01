tableextension 50016 "EDC HIS Purcha Line" extends "Purchase Line"
{
    fields
    {
        field(50000; "EDC Item Type"; Enum "EDC HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
                PurchHeader: Record "Purchase Header";
            begin
                IF Rec.Type = Rec.Type::Item then begin
                    Item.Get("No.");
                    Validate("EDC Item Type", Item."EDC Item Type");
                    IF PurchHeader.Get("Document Type", "Document No.") then
                        if PurchHeader."EDC Item Type" = PurchHeader."EDC Item Type"::"Non Pharmacy" then
                            IF PurchHeader."EDC Item Type" <> Item."EDC Item Type" then
                                Error('You can''t select other than Non Pharmacy Item %1 !', Item."No.");
                end;
            end;
        }


    }

}
