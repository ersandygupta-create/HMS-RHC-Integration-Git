page 50109 "EDC Settlements Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'edcSettlementsBatchAPI';
    DelayedInsert = true;
    EntityName = 'settlementsBatch';
    EntitySetName = 'settlementsBatch';
    SourceTable = "EDC HIS Settlement Staging";
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
            part(RevenueLine; "EDC Settlement API")
            {
                Caption = 'Settlements';
                EntityName = 'Settlement';
                EntitySetName = 'settlements';
            }
        }
    }

    var
        BatchNo: Text[100];
}
