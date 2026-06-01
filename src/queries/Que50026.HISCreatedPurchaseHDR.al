query 50026 "HIS Created GRN Purch. Header"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'Created Pending GRN List';
    EntityName = 'createdPendingGRNHDRList';
    EntitySetName = 'createdPendingGRNHDRLists';
    QueryType = API;

    elements
    {
        dataitem(HISPurchaseHeader; "EDC HIS Purchase Header")
        {
            DataItemTableFilter = "Document Date" = filter(>= '2026-01-01');

            column(Record_Type; "Record Type")
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(DocumentNo; "Document No.")
            {

            }
            column(Type; Type)
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }
            column(Posted_Order_No_; "Posted Order No.")
            {

            }
            column(Posted_Cr_Memo_No_; "Posted Cr.Memo No.")
            {

            }
            column(Posted_Via_Order_No_; "Posted Via Order No.")
            {

            }
            column(FI_Posting_Date; "FI Posting Date")
            {

            }
            column(Address_Code; "Address Code")
            {

            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {

            }
            column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
            {

            }
            column(DocumentDate; "Document Date")
            {

            }
            column(PostingDate; "Posting Date")
            {

            }
            column(Vendor_Invoice_Date; "Vendor Invoice Date")
            {

            }
            column(Vendor_Invoice_No; "Vendor Invoice No.")
            {

            }
            column(Purchase_Order_No_; "Purchase Order No.")
            {

            }
            column(Purchase_Order_Date; "Purchase Order Date")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(No__of_Lines; "No. of Lines")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Error_Description; "Error Description")
            {

            }
            column(Error_1; "Error 1")
            {

            }
            column(Error_2; "Error 2")
            {

            }
            column(Error_3; "Error 3")
            {

            }
            column(Error_4; "Error 4")
            {

            }
            column(Store_Name; "Store Name")
            {

            }
            column(SystemCreatedAt; SystemCreatedAt)
            {

            }
            column(SystemCreatedBy; SystemCreatedBy)
            {

            }
            column(SystemModifiedAt; SystemModifiedAt)
            {

            }
            column(SystemModifiedBy; SystemModifiedBy)
            {

            }
            column(Create_PO; "Create PO")
            {

            }

        }
    }


    var
        HISPurchHDR: Record "EDC HIS Purchase Header";

    trigger OnBeforeOpen()
    begin

        if HISPurchHDR."Posted Order No." = '' then begin

        end;


    end;
}