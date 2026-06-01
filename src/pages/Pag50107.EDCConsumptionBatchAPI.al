page 50107 "EDC Consumption Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'edcConsumptionBatchAPI';
    DelayedInsert = true;
    EntityName = 'edcConsumptionBatch';
    EntitySetName = 'edcConsumptionBatch';
    SourceTable = "EDC HIS Consumption Entries";
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
            part(RevenueLine; "EDC Consumption API")
            {
                Caption = 'Consumptions';
                EntityName = 'consumption';
                EntitySetName = 'consumptions';
            }
        }
    }

    var
        BatchNo: Text[100];
}
