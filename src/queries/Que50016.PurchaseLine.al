query 50016 "Purchase Line"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'purchaseLine';
    EntityName = 'purchaseLine';
    EntitySetName = 'purchaseLine';
    QueryType = API;

    elements
    {
        dataitem(purchaseLine; "Purchase Line")
        {
            column(documentType; "Document Type") { }
            column(documentNo; "Document No.") { }
            column(buyfromVendorNo; "Buy-from Vendor No.") { }
            column(buyFromVendorName; "Buy-from Vendor Name") { }
            column(no; "No.") { }
            column(locationCode; "Location Code") { }
            column(description; Description) { }
            column(description2; "Description 2") { }
            column(quantity; Quantity) { }
            column(unitCost; "Unit Cost") { }
            column(unitCostLCY; "Unit Cost (LCY)") { }
            column(amount; Amount) { }
            column(amountIncludingVAT; "Amount Including VAT") { }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code") { }
            column(orderDate; "Order Date") { }
            column(gstGroupCode; "GST Group Code") { }
            column(postingDate; "Posting Date") { }
            column(status; Status) { }
            column(indentNo; "EDC Indent No.") { }
            column(lineNo; "Line No.") { }
            column(amtRcdNotInvoicedLCY; "Amt. Rcd. Not Invoiced (LCY)") { }
            column(currencyCode; "Currency Code") { }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}