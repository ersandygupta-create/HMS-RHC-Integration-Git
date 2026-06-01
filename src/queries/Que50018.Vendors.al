query 50018 "EDC Vendors Master"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcVendor';
    EntityName = 'edcVendor';
    EntitySetName = 'edcVendor';
    QueryType = API;

    elements
    {
        dataitem(vendor; Vendor)
        {
            column(no; "No.") { }
            column(name; Name) { }
            column(globalDimension1Code; "Global Dimension 1 Code") { }
            column(lastModifiedDateTime; "Last Modified Date Time") { }
            column(lastDateModified; "Last Date Modified") { }
            column(locationCode; "Location Code") { }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}