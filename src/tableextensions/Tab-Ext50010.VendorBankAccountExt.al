tableextension 50010 "EDC HIS Vendor Bank Account" extends "Vendor Bank Account"
{
    fields
    {
        field(50000; "EDC IFSC Code"; Code[20])
        {
            Caption = 'IFSC Code';
            DataClassification = CustomerContent;
        }
    }
}
