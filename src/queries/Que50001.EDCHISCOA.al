query 50001 "EDC COA API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcCOA';
    EntityName = 'edcCOAs';
    EntitySetName = 'edcCOAs';
    QueryType = API;

    elements
    {
        dataitem(gLAccount; "G/L Account")
        {

            column(no; "No.")
            {
            }
            column(name; "Name")
            {
            }
            column(incomebalance; "Income/Balance")
            {
            }
            column(accountcategory; "Account Category")
            {
            }
            column(accsubcategory; "Account Subcategory Descript.")
            {
            }
            column(accountType; "Account Type")
            {
            }
            column(kipsCode; FIReportMapping)
            {
            }
            column(kpisname; "KPIs Name")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
