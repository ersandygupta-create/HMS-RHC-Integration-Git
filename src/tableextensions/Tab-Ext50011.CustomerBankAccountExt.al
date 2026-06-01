tableextension 50011 "EDC HIS Customer Bank Account" extends "Customer Bank Account"
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
