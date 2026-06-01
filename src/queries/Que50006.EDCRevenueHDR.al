query 50006 "HIS Revenue HDR"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'edhate';
    APIVersion = 'v2.0';
    Caption = 'hisRevenuehdrdata';
    EntityName = 'hisRevenuehdrData';
    EntitySetName = 'hisRevenuehdrData';
    QueryType = API;

    elements
    {
        dataitem(hisRevenueHDR; "EDC HIS Revenue Header")
        {
            column(documentNo; "Document No.")
            {
            }
            column(documentDate; "Document Date")
            {
            }
            column(hisDocumentType; "HIS Document Type")
            {
            }
            column(patientName; "Patient Name")
            {
            }
            column(uHID; UHID)
            {
            }
            column(encounterNo; "Encounter No.")
            {
            }
            column(doctor; Doctor)
            {
            }
            column(speciality; Speciality)
            {
            }
            column(sponsorCode; "Sponsor Code")
            {
            }
            column(sponsorName; "Sponsor Name")
            {
            }
            column(payerCode; "Payer Code")
            {
            }
            column(payorCategory; "Payor Category")
            {
            }
            column(payerName; "Payer Name")
            {
            }
            column(admissionDateTime; "Admission Date Time")
            {
            }
            column(dischargeDateTime; "Discharge Date Time")
            {
            }
            column(externalDocumentNo; "External Document No.")
            {
            }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(validationHISKey; "Validation HIS Key")
            {
            }
            column(admissionSource; "Admission Source")
            {
            }
            column(packagePatient; "Package Patient")
            {
            }
            column(admissionBedCategory; "Admission Bed Category")
            {
            }
            column(dischargeBedCategory; "Discharge Bed Category")
            {
            }
            column(amount; Amount)
            {
            }
            column(noOfLines; "No. of Lines")
            {
            }
            column(specialityCode; "Speciality Code")
            {
            }
            column(posteddocumentNo; "Posted Document No.")
            {
            }
            column(isProcessed; "Create Revenue")
            {
            }
            column(customererror; "Error 1")
            {
            }
            column(revaccountmissing; "Error 2")
            {
            }

        }
    }
    trigger OnBeforeOpen()
    begin

    end;
}