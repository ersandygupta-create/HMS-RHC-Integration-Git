query 50004 "EDC GL Reprocessed Data"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcGLReprocessedData';
    EntityName = 'edcGLReprocessedData';
    EntitySetName = 'edcGLReprocessedData';
    QueryType = API;

    elements
    {
        dataitem(hisRprocessDoc; "EDC HIS Delete Document")
        {
            column(entryNo; "Entry No.")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(createdBy; "Created By")
            {
            }
            column(createdDatetime; "Created Datetime")
            {
            }
            column(approvedBy; "Approved By")
            {
            }
            column(approvedDatetime; "Approved Datetime")
            {
            }
            column(processedBy; "Processed By")
            {
            }
            column(processedDatetime; "Processed Datetime")
            {
            }
            column(status; Status)
            {
            }
            column(errorText; "Error Text")
            {
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
