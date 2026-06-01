page 50108 "EDC Advances Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'edcAdvancesBatchAPI';
    DelayedInsert = true;
    EntityName = 'edcadvanceBatch';
    EntitySetName = 'advanceBatch';
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
            part(RevenueLine; "EDC Advances API")
            {
                Caption = 'Advances';
                EntityName = 'advance';
                EntitySetName = 'advances';
            }
        }
    }

    var
        BatchNo: Text[100];
}
