query 50000 "EDC HIS G/L Entries"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcGLEntries';
    EntityName = 'edcGLEntries';
    EntitySetName = 'edcGLEntries';
    QueryType = API;

    elements
    {
        dataitem(gLEntry; "G/L Entry")
        {

            column(postingDate; "Posting Date")
            {
            }
            column(gLAccountNo; "G/L Account No.")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(edcDoctorName; "EDC Doctor Name")
            {
            }
            column(edcSpeciality; "EDC Speciality")
            {
            }
            column(edcPayerName; "EDC Payer Name")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(sourceno; "Source No.")
            {
            }
            column(amount; Amount)
            {
                Method = Sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
