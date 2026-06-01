query 50002 "EDC FIReporting"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcFIReporting';
    EntityName = 'edcFIReportings';
    EntitySetName = 'edcFIReportings';
    QueryType = API;

    elements
    {
        dataitem(fireportings; "EDC FIReportingMapping")
        {

            column(kpicode; "KPI Code")
            {
            }
            column(kipname; "KPI Name")
            {
            }
            column(type; Type)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
