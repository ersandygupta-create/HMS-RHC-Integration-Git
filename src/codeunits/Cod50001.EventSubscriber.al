codeunit 50001 "EDC HIS Event Subscriber"
{

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldGLEntries(GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry");
    begin
        GLEntry."EDC Narration" := GenJournalLine."EDC Narration";
        GLEntry."EDC UTR No." := GenJournalLine."EDC UTR No.";
        GLEntry."EDC HIS Module" := GenJournalLine."EDC HIS Module";
        GLEntry."EDC HIS Document Type" := GenJournalLine."EDC HIS Document Type";
        GLEntry."EDC Store Code" := GenJournalLine."EDC Store Code";
        GLEntry."EDC Sub Group Code" := GenJournalLine."EDC Sub Group Code";
        GLEntry."EDC Receipt No." := GenJournalLine."EDC Receipt No.";
        GLEntry."EDC UHID" := GenJournalLine."EDC UHID";
        GLEntry."EDC Patient Name" := GenJournalLine."EDC Patient Name";
        GLEntry."EDC Validation Key" := GenJournalLine."EDC Validation Key";
        GLEntry."EDC Transaction Type" := GenJournalLine."EDC Transaction Type";
        GLEntry."EDC Encounter No." := GenJournalLine."EDC Encounter No.";
        GLEntry."EDC Doctor Name" := GenJournalLine."EDC Doctor Name";
        GLEntry."EDC Speciality" := GenJournalLine."EDC Speciality";
        GLEntry."EDC Sponsor Code" := GenJournalLine."EDC Sponsor Code";
        GLEntry."EDC Sponsor Name" := GenJournalLine."EDC Sponsor Name";
        GLEntry."EDC Payer Code" := GenJournalLine."EDC Payer Code";
        GLEntry."EDC Payer Name" := GenJournalLine."EDC Payer Name";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure EDCOnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."EDC HIS Module" := GenJournalLine."EDC HIS Module";
        CustLedgerEntry."EDC HIS Document Type" := GenJournalLine."EDC HIS Document Type";
        CustLedgerEntry."EDC Receipt No." := GenJournalLine."EDC Receipt No.";
        CustLedgerEntry."EDC UHID" := GenJournalLine."EDC UHID";
        CustLedgerEntry."EDC Patient Name" := GenJournalLine."EDC Patient Name";
        CustLedgerEntry."EDC Encounter No." := GenJournalLine."EDC Encounter No.";
        CustLedgerEntry."EDC Doctor Name" := GenJournalLine."EDC Doctor Name";
        CustLedgerEntry."EDC Speciality" := GenJournalLine."EDC Speciality";
        CustLedgerEntry."EDC Sponsor Code" := GenJournalLine."EDC Sponsor Code";
        CustLedgerEntry."EDC Sponsor Name" := GenJournalLine."EDC Sponsor Name";
        CustLedgerEntry."EDC Payer Code" := GenJournalLine."EDC Payer Code";
        CustLedgerEntry."EDC Payer Name" := GenJournalLine."EDC Payer Name";
        CustLedgerEntry."Sales (LCY)" := GenJournalLine."Sales/Purch. (LCY)";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldVendLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry");
    var
        Vendor: Record "vendor";
    begin
        VendorLedgerEntry."EDC Payment Terms Code" := GenJournalLine."Payment Terms Code";
        VendorLedgerEntry."Purchase Order No." := GenJournalLine."Purchase Order No.";
        VendorLedgerEntry."E3 Receipt No." := GenJournalLine."EDC Receipt No.";
        VendorLedgerEntry."E3 UHID" := GenJournalLine."EDC UHID";
        VendorLedgerEntry."E3 Patient Name" := GenJournalLine."EDC Patient Name";
        IF VendorLedgerEntry."Vendor Name" = '' then begin
            IF GenJournalLine."Account Type" = GenJournalLine."Account Type"::Vendor THEN
                IF Vendor.Get(GenJournalLine."Account No.") then
                    VendorLedgerEntry."Vendor Name" := Vendor.Name;

            IF GenJournalLine."Bal. Account Type" = GenJournalLine."Bal. Account Type"::Vendor THEN
                IF Vendor.Get(GenJournalLine."Bal. Account No.") then
                    VendorLedgerEntry."Vendor Name" := Vendor.Name;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Detailed CV Ledg. Entry Buffer", 'OnAfterCopyFromGenJnlLine', '', true, true)]

    local procedure InsertPONOFieldDetailedVendorLedgEntry(var DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GenJnlLine: Record "Gen. Journal Line")
    begin
        DtldCVLedgEntryBuffer."Purchase Order No." := GenJnlLine."Purchase Order No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldBankLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry");
    begin
        BankAccountLedgerEntry."EDC UTR No." := GenJournalLine."EDC UTR No.";
        BankAccountLedgerEntry."EDC Narration" := GenJournalLine."EDC Narration";
        if (GenJournalLine."Cheque No." <> '') then
            BankAccountLedgerEntry."E3 UTR No." := GenJournalLine."Cheque No."
        else
            if (GenJournalLine."EDC UTR No." <> '') then
                BankAccountLedgerEntry."E3 UTR No." := GenJournalLine."EDC UTR No.";

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforePostGenJnlLine', '', false, false)]
    // local procedure OnBeforePostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line")
    // var
    //     vendorLedgerEntry: Record "Vendor Ledger Entry";
    //     remAmt: decimal;
    // begin

    //     // Check only Bank Payment Voucher
    //     if GenJournalLine."Document Type" <> GenJournalLine."Document Type"::Payment then
    //         exit;
    //     if GenJournalLine."Account Type" = GenJournalLine."Account Type"::Vendor then begin
    //         vendorLedgerEntry.SetRange("Vendor No.", GenJournalLine."Account No.");
    //         // vendorLedgerEntry.SetRange(open, true);

    //         if vendorledgerentry.FindSet() then
    //             repeat
    //                 vendorledgerentry.CalcFields("Remaining Amount");
    //                 remAmt += vendorLedgerEntry."Remaining Amount";
    //             until vendorledgerentry.Next() = 0;

    //         if remAmt <> 0 then
    //             if not Confirm(
    //                     'Vendor total remaining amount is %1.\Do you want to continue posting?',
    //                     false,
    //                     remAmt)
    //                 then
    //                 Error('Posting cancelled by user.');
    //     end

    // end;


    [EventSubscriber(ObjectType::CodeUnit, codeUnit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', true, true)]
    local procedure ModifyConfimationForPurchaseOrderPosting(PurchaseHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
    begin

        if PurchaseHeader."Posting Date" = 0D then
            Error('Posting Date must be filled before posting the document.');

        if PurchaseHeader."Document Date" > PurchaseHeader."Posting Date" then
            Error('Document Date (%1) cannot be later than Posting Date (%2).', PurchaseHeader."Document Date", PurchaseHeader."Posting Date");

        IF ((PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Return Order"))
             AND (PurchaseHeader."EDC Item Type" = PurchaseHeader."EDC Item Type"::"Non Pharmacy") then begin
            PurchaseHeader.TestField("Location Code");
            PurchLine.RESET();
            PurchLine.SETRANGE("Document Type", PurchaseHeader."Document Type");
            PurchLine.SETRANGE("Document No.", PurchaseHeader."No.");
            PurchLine.SETRANGE("Buy-from Vendor No.", PurchaseHeader."Buy-from Vendor No.");
            PurchLine.SETRANGE(PurchLine.Type, PurchLine.Type::Item);
            IF PurchLine.FindSet() THEN
                repeat
                    IF PurchLine."Location Code" = '' then
                        Error('You can''t post blank Location Cdoe !');
                    IF (PurchLine."EDC Item Type" = PurchLine."EDC Item Type"::Pharmacy) then
                        Error('You can''t select Pharmacy Item No. %1,Line No. %2,Item Name %3', PurchLine."No.", PurchLine."Line No.", PurchLine.Description);
                until PurchLine.Next() = 0;

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Vendor, OnBeforeOnRename, '', false, false)]
    local procedure OnBeforeOnRenameVendor(xVendor: Record Vendor; var Vendor: Record Vendor; var IsHandled: Boolean)
    begin
        xVendor.CalcFields("EDC Sync Record Exists");
        if xVendor."EDC Sync Record Exists" then
            Error('Record is already synchronized to HIS, rename is not allowed');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Order Address", OnBeforeRenameEvent, '', false, false)]
    local procedure OnBeforeOnRenameOrderAdd(var xRec: Record "Order Address"; var Rec: Record "Order Address"; RunTrigger: Boolean)
    begin
        xRec.CalcFields("EDC Sync Record Exists");
        if xRec."EDC Sync Record Exists" then
            Error('Record is already synchronized to HIS, rename is not allowed');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure EDCOnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    begin
        GenJournalLine."EDC HIS Module" := SalesHeader."EDC HIS Module";
        GenJournalLine."EDC HIS Document Type" := SalesHeader."EDC HIS Document Type";
        GenJournalLine."EDC Receipt No." := SalesHeader."EDC Receipt No.";
        GenJournalLine."EDC UHID" := SalesHeader."EDC UHID";
        GenJournalLine."EDC Patient Name" := SalesHeader."EDC Patient Name";
        GenJournalLine."EDC Encounter No." := SalesHeader."EDC Encounter No.";
        GenJournalLine."EDC Doctor Name" := SalesHeader."EDC Doctor Name";
        GenJournalLine."EDC Speciality" := SalesHeader."EDC Speciality";
        GenJournalLine."EDC Sponsor Code" := SalesHeader."EDC Sponsor Code";
        GenJournalLine."EDC Sponsor Name" := SalesHeader."EDC Sponsor Name";
        GenJournalLine."EDC Payer Code" := SalesHeader."EDC Payer Code";
        GenJournalLine."EDC Payer Name" := SalesHeader."EDC Payer Name";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchInvHeaderInsert', '', false, false)]
    local procedure EDCOnAfterPurchInvHeaderInsert(var PurchHeader: Record "Purchase Header"; var PurchInvHeader: Record "Purch. Inv. Header"; PreviewMode: Boolean)
    var
        GenJnlNarration: Record "Gen. Journal Narration";
        PurchCommentLine: Record "Purch. Comment Line";
    begin
        if PreviewMode then
            exit;

        PurchCommentLine.SetRange("Document Type", PurchHeader."Document Type");
        PurchCommentLine.SetRange("No.", PurchHeader."No.");
        if PurchCommentLine.FindSet() then
            repeat
                GenJnlNarration.Init();
                GenJnlNarration."Journal Template Name" := '';
                GenJnlNarration."Journal Batch Name" := '';
                GenJnlNarration."Document No." := PurchInvHeader."No.";
                GenJnlNarration."Gen. Journal Line No." := 0;
                GenJnlNarration."Line No." := PurchCommentLine."Line No.";
                GenJnlNarration.Narration := PurchCommentLine.Comment;
                GenJnlNarration.Insert();
            until PurchCommentLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGlobalGLEntry', '', false, false)]
    local procedure InitPostedNarration(
        GenJournalLine: Record "Gen. Journal Line";
        var GlobalGLEntry: Record "G/L Entry")
    var
        GenJnlNarration: Record "Gen. Journal Narration";
        PostedNarration: Record "Posted Narration";
    begin

        if (GenJournalLine."Source Code" <> 'PURCHASES') then
            exit;

        if (GenJournalLine."Document Type" = GenJournalLine."Document Type"::" ") or (GenJournalLine."Document No." = '') then
            exit;

        GenJnlNarration.Reset();
        GenJnlNarration.SetRange("Journal Template Name", '');
        GenJnlNarration.SetRange("Journal Batch Name", '');
        GenJnlNarration.SetRange("Document No.", GenJournalLine."Document No.");
        GenJnlNarration.SetFilter("Line No.", '<>%1', 0);
        GenJnlNarration.SetRange("Gen. Journal Line No.", 0);

        PostedNarration.Reset();
        PostedNarration.SetCurrentKey("Transaction No.");
        PostedNarration.SetRange("Transaction No.", GlobalGLEntry."Transaction No.");
        if not PostedNarration.FindFirst() then
            if GenJnlNarration.FindSet() then
                repeat
                    InsertPostedNarrationVouchers(GlobalGLEntry, GenJnlNarration);
                until GenJnlNarration.Next() = 0;
    end;

    local procedure InsertPostedNarrationVouchers(GLEntry: Record "G/L Entry"; PurchCommentLine: Record "Gen. Journal Narration")
    var
        PostedNarration: Record "Posted Narration";
    begin
        PostedNarration.Init();
        PostedNarration."Entry No." := 0;
        PostedNarration."Transaction No." := GLEntry."Transaction No.";
        PostedNarration."Line No." := PurchCommentLine."Line No.";
        PostedNarration."Posting Date" := GLEntry."Posting Date";
        PostedNarration."Document Type" := GLEntry."Document Type";
        PostedNarration."Document No." := GLEntry."Document No.";
        PostedNarration.Narration := PurchCommentLine.Narration;
        PostedNarration.Insert();
    end;

    [EventSubscriber(ObjectType::CodeUnit, codeUnit::"Bank Acc. Recon. Post (Yes/No)", OnBeforeBankAccReconPostYesNo, '', true, true)]
    local procedure InsetBankAccReconLine(var BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        BankAccRecLine: Record "Bank Acc. Reconciliation Line";
        BankAccStatmentLine: Record "Bank Account Statement Line";
    begin
        BankAccStatmentLine."EDC UTR No." := BankAccRecLine."EDC UTR No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchCrMemoHeaderInsert', '', false, false)]
    local procedure EDCOnAfterPurchCrMemoHeaderInsert(var PurchHeader: record "Purchase Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; PreviewMode: Boolean)
    var
        RefInvoiceNo: Record "Reference Invoice No.";
    begin
        RefInvoiceNo.Reset();
        RefInvoiceNo.SetRange("Document No.", PurchHeader."No.");
        if RefInvoiceNo.Find('-') then
            PurchCrMemoHdr."Reference Invoice No." := RefInvoiceNo."Alternate Ref. Invoice No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', false, false)]
    local procedure CheckOrderAmountonPurchaseDoc(var PurchaseHeader: Record "Purchase Header")
    var
        CalcStatistics: Codeunit "Calculate Statistics";
        AmountToVendor: Decimal;
        PurchPayablesSetup: Record "Purchases & Payables Setup";
        HISPurchHdr: Record "EDC HIS Purchase Header";
    begin

        HISPurchHdr.SetRange("Document No.", PurchaseHeader."No.");
        if not PurchPayablesSetup.Get() then
            exit;
        if HISPurchHdr.FindSet() then begin
            repeat
                if PurchaseHeader."Integration PO" = true then
                    if PurchPayablesSetup."GRN Vendor Code Check" then
                        if HISPurchHdr."Vendor No." <> PurchaseHeader."Buy-from Vendor No." then
                            Error(
      'Vendor Code mismatch. Staging Vendor (%1) must match Buy-from Vendor (%2). Posting is not allowed.',
      HISPurchHdr."Vendor No.",
      PurchaseHeader."Buy-from Vendor No."
    );
            until HISPurchHdr.Next() = 0;
        end;

        if not PurchPayablesSetup.Get() then
            exit;

        if not PurchPayablesSetup."HIS GRN Amount Validation" then
            exit;

        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Invoice) or
           (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Credit Memo") then begin

            if PurchaseHeader."Integration PO" then begin

                CalcStatistics.GetPurchaseStatisticsAmount(PurchaseHeader, AmountToVendor);

                if Abs(PurchaseHeader."HIS GRN Amount" - AmountToVendor) > 1 then begin
                    if not Confirm('Difference between Order Amount and Amount to Vendor is more than 1. Do you want to continue posting?', false) then
                        Error('Posting cancelled by user.');
                end;

            end;
        end;
    end;
}