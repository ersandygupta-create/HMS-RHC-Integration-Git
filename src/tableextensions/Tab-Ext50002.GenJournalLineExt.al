tableextension 50002 "EDC Gen. Journal Line Exts" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "EDC UTR No."; Code[35])
        {
            Caption = 'UTR No.';
            DataClassification = CustomerContent;
        }
        field(50001; "EDC HIS Module"; Text[30])
        {
            Caption = 'HIS Module';
            DataClassification = CustomerContent;
        }
        field(50002; "EDC HIS Document Type"; Text[60])
        {
            Caption = 'HIS Document Type';
            DataClassification = CustomerContent;
        }
        field(50011; "EDC Store Code"; Code[10])
        {
            Caption = 'Store Code';
            DataClassification = CustomerContent;
        }
        field(50012; "EDC Sub Group Code"; Code[10])
        {
            Caption = 'Sub Group Code';
            DataClassification = CustomerContent;
        }
        field(50013; "EDC Receipt No."; Code[20])
        {
            Caption = 'Receipt No.';
            DataClassification = CustomerContent;
        }
        field(50014; "EDC UHID"; Code[20])
        {
            Caption = 'UHID';
            DataClassification = CustomerContent;
        }
        field(50015; "EDC Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = CustomerContent;
        }
        field(50016; "EDC Validation Key"; Text[50])
        {
            Caption = 'Vaidation Key';
            DataClassification = CustomerContent;
        }
        field(50017; "EDC Narration"; Text[150])
        {
            Caption = 'Narrantion';
            DataClassification = CustomerContent;
        }
        field(50018; "EDC Transaction Type"; Text[50])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(50019; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            TableRelation = "Vendor Adv. Pay. Ag. PO" where("Vendor Code" = field("Account No."));//, "Remaining Amount" = filter(<> 0));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                VendAdvPayAgPO: Record "Vendor Adv. Pay. Ag. PO";
                decAmount: Decimal;
            begin
                VendAdvPayAgPO.Reset();
                VendAdvPayAgPO.SetRange("Entry Type", VendAdvPayAgPO."Entry Type"::"Purchase Order");
                VendAdvPayAgPO.SetRange("Purchase Order No.", "Purchase Order No.");
                IF VendAdvPayAgPO.FindFirst() then begin
                    VendAdvPayAgPO.CalcFields("Total Applied Amount");
                    IF ((VendAdvPayAgPO."Total PO Amount" - VendAdvPayAgPO."Total Applied Amount") = 0) then
                        Error('No Purchase order is pending to apply Amount');

                    IF ((VendAdvPayAgPO."Total PO Amount" - VendAdvPayAgPO."Total Applied Amount") < "Amount (LCY)") then
                        Error('Remaining Amount is less than Bank Payment Amount so Entry Can''t be applied');

                    if (VendAdvPayAgPO."Total PO Amount" < "Amount (LCY)") OR ("Amount (LCY)" = 0) then
                        Error('Purchase Order Amount is less than Bank Payment Amount');

                    VendAdvPayAgPO.CalcFields("Total Applied Amount");
                    VendAdvPayAgPO."Remaining Amount" := (VendAdvPayAgPO."Total PO Amount" - VendAdvPayAgPO."Total Applied Amount");
                    VendAdvPayAgPO.Modify();
                end
            end;
        }
        field(50100; "EDC Encounter No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(50102; "EDC Doctor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Doctor Name';
        }
        field(50103; "EDC Speciality"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Speciality';
        }
        field(50104; "EDC Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(50105; "EDC Sponsor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(50106; "EDC Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(50107; "EDC Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }

    }
}