tableextension 50008 "EDC HIS TDS Entries" extends "TDS Entry"
{
    fields
    {
        field(50000; "EDC Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
            Editable = false;
        }
    }
}
