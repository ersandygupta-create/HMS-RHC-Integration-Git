tableextension 50065 "Purch & Payable Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "HIS GRN Amount Validation"; Boolean)
        {
            Caption = 'HIS GRN AMount Validation';
            DataClassification = CustomerContent;
        }
        field(50001; "GRN Vendor Code Check"; Boolean)
        {
            Caption = 'GRN Vendor Code Check';
            DataClassification = CustomerContent;
        }
        field(50002; "Enable Advance Settlement"; Boolean)
        {
            Caption = 'Enable Advance Settlement';
            DataClassification = CustomerContent;
        }

    }
}
