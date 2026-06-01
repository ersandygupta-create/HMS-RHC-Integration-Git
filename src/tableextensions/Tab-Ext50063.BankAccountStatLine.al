tableextension 50063 "EDC Bank Acc. Stat. Line Ext" extends "Bank Account Statement Line"
{
    fields
    {
        field(50000; "EDC UTR No."; Code[35])
        {
            Caption = 'UTR No.';
            DataClassification = CustomerContent;
        }
    }
}