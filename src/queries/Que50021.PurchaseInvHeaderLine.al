query 50021 "Purchase Inv Header Line"
{
    QueryType = API;
    APIPublisher = 'edhate';
    APIGroup = 'apiHIS';
    APIVersion = 'v2.0';
    Caption = 'purchaseInvHdrline';
    EntityName = 'purchaseInvHdrline';
    EntitySetName = 'purchaseInvHdrline';

    elements
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            DataItemTableFilter = "Store Name" = FILTER(''), "Pre-Assigned No. Series" = filter(<> '');

            column(no; "No.") { }
            column(postingDate; "Posting Date") { }
            column(orderNo; "Order No.") { }
            column(amount; Amount) { }
            column(vendorInvoiceNo; "Vendor Invoice No.") { }
            column(documentDate; "Document Date") { }
            column(userID; "User ID") { }
            dataitem(PurchInvLine; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = PurchInvHeader."No.";

                column(buyfromVendorNo; "Buy-from Vendor No.") { }
                column(documentNo; "Document No.") { }
                column(lineNo; "Line No.") { }
                column(linenumber; "No.") { }
                column(locationCode; "Location Code") { }
                column(expectedReceiptDate; "Expected Receipt Date") { }
                column(description; Description) { }
                column(description2; "Description 2") { }
                column(quantity; Quantity) { }
                column(directUnitCost; "Direct Unit Cost") { }
                column(unitCostLCY; "Unit Cost (LCY)") { }
                column(lineDiscount; "Line Discount %") { }
                column(lineDiscountAmount; "Line Discount Amount") { }
                column(lineAmount; "Line Amount") { }
                column(amt; Amount) { }
                column(amountIncludingVAT; "Amount Including VAT") { }
                column(receiptNo; "Receipt No.") { }
                column(receiptLineNo; "Receipt Line No.") { }
                column(orderLineNo; "Order Line No.") { }
                column(paytoVendorNo; "Pay-to Vendor No.") { }
                column(buyfromVendorName; "Buy-from Vendor Name") { }
                column(systemCreatedAt; SystemCreatedAt) { }
                column(systemModifiedAt; SystemModifiedAt) { }
                column(gstGroupCode; "GST Group Code") { }
                column(hsnSACCode; "HSN/SAC Code") { }
                column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
    end;
}
