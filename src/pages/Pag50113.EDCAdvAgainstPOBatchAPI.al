page 50113 "EDC Adv Against PO Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'edcAdvAgPOBatchAPI';
    DelayedInsert = true;
    EntityName = 'edcadvAgPOBatch';
    EntitySetName = 'advAgPOBatch';
    SourceTable = "Vendor Adv. Pay. Ag. PO";
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
            part(VendorAdvPo; "EDC Advance PO API")
            {
                Caption = 'AdvancePo';
                EntityName = 'advancePo';
                EntitySetName = 'advancePos';
            }
        }
    }

    var
        BatchNo: Text[100];
}
