page 50110 "EDC Refund Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'edcRefundsBatchAPI';
    DelayedInsert = true;
    EntityName = 'refundsBatch';
    EntitySetName = 'refundsBatch';
    SourceTable = "EDC HIS Revenue Staging Table";
    SourceTableTemporary = true;
    PageType = API;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(batchNo; BatchNo)
                {
                    Caption = 'Batch No.';

                    trigger OnValidate()
                    begin
                        Rec.Init();
                        Rec.Insert();
                    end;
                }
            }
            part(RevenueLine; "EDC Refund API")
            {
                Caption = 'Refunds';
                EntityName = 'refund';
                EntitySetName = 'refunds';
            }
        }
    }

    var
        BatchNo: Text[100];
}
