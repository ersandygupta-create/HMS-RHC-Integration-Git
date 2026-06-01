tableextension 50026 "EDC HIS Company Information" extends "Company Information"
{
    fields
    {
        field(50000; "CIN No."; Code[50])
        {
            Caption = 'CIN No.';
            DataClassification = CustomerContent;
        }
        field(50001; "Old Comapany Name"; Code[100])
        {
            Caption = 'Old Company Name';
            DataClassification = CustomerContent;
        }
        field(50002; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = CustomerContent;
        }
        field(50003; DraftImage; Blob)
        {
            Caption = 'Draft Image';
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }
        field(50004; Picture2; Blob)
        {
            Caption = 'Picture 2';
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }
    }
}
