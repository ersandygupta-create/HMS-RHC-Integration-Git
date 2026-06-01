tableextension 50022 "EDC Order Adress" extends "Order Address"
{
    fields
    {
        field(50010; "EDC NPU"; Boolean)
        {
            Caption = 'NPU';
            DataClassification = CustomerContent;
        }
        field(50015; "EDC Sync Record Exists"; Boolean)
        {
            Caption = 'Sync Record Exists';
            CalcFormula = exist("EDC API Supplier Update Log" where("No." = field("Vendor No."), "Address Code" = field(Code)));
            FieldClass = FlowField;
            Editable = false;
        }
    }

    // trigger OnBeforeRename()
    // begin
    //     CalcFields("EDC Sync Record Exists");
    //     if "EDC Sync Record Exists" then
    //         Error('Record synchronized to HIS, rename is not allowed');
    // end;
}
