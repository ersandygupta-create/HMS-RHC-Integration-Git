query 50003 "EDC FI Reporting Data"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'edcFIReportingData';
    EntityName = 'edcFIReportingData';
    EntitySetName = 'edcFIReportingData';
    QueryType = API;

    elements
    {
        dataitem(gLEntry; "G/L Entry")
        {
            column(entryNo; "Entry No.")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(gLAccountNo; "G/L Account No.")
            {
            }
            column(description; Description)
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(shortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(documentDate; "Document Date")
            {
            }
            column(utrNo; "EDC UTR No.")
            {
            }
            column(hisDocumentType; "EDC HIS Document Type")
            {
            }
            column(externalDocumentNo; "External Document No.")
            {
            }
            column(encounterNo; "EDC Encounter No.")
            {
            }
            column(patientName; "EDC Patient Name")
            {
            }
            column(edcDoctorName; "EDC Doctor Name")
            {
            }
            column(edcSpeciality; "EDC Speciality")
            {
            }
            column(payerCode; "EDC Payer Code")
            {
            }
            column(edcPayerName; "EDC Payer Name")
            {
            }
            column(sponsorCode; "EDC Sponsor Code")
            {
            }
            column(sponsorName; "EDC Sponsor Name")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(sourceno; "Source No.")
            {
            }
            column(narration; "EDC Narration")
            {
            }
            column(voucherNarration; "EDC Voucher Narration")
            {
            }
            column(lineNarration; "EDC Line Narration")
            {
            }
            column(storeCode; "EDC Store Code")
            {
            }
            column(subGroupCode; "EDC Sub Group Code")
            {
            }
            column(receiptNo; "EDC Receipt No.")
            {
            }
            column(uhid; "EDC UHID")
            {
            }
            column(amount; Amount)
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(userid; "User ID")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
