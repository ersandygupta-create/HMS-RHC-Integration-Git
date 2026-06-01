codeunit 50023 "LIMS Post Rev/Coll Line"
{
    TableNo = "EDC HIS Collection Staging";

    trigger OnRun()
    begin
        RevenueEntry.Copy(Rec);
        ProcessLine(RevenueEntry);
        Rec := RevenueEntry;
    end;

    local procedure ProcessLine(var HISRevenueStaging: Record "EDC HIS Collection Staging")
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "EDC HIS GL Accounts Mapping";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        DocumentTypeLbl: Label 'Setup not found for Document Type %1.';
        EntryNo: Integer;
    begin
        GenJournalLine.INIT();
        GenJournalLine.VALIDATE("Document Type", HISRevenueStaging."Document Type");
        GenJournalLine.VALIDATE("Document No.", HISRevenueStaging."Document No.");
        GenJournalLine.VALIDATE("Posting Date", HISRevenueStaging."Document Date");

        HISGLAccountMapping.Reset();
        HISGLAccountMapping.SetRange(Type, HISGLAccountMapping.Type::"LIMS MOP");
        HISGLAccountMapping.SetRange("MOP Code", HISRevenueStaging."Mode of Payment");
        if HISGLAccountMapping.FindFirst() then begin

            GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
            GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
        end ELSE
            Error(DocumentTypeLbl, HISRevenueStaging."Mode of Payment");

        GenJournalLine.VALIDATE(Amount, HISRevenueStaging.Amount);
        GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
        GenJournalLine.VALIDATE("Cheque Date", HISRevenueStaging."Cheque Date");
        GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISRevenueStaging."Cheque No.", 1, 10));
        if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then begin
            GenJournalLine.VALIDATE("Location Code", HISRevenueStaging."Shortcut Dimension 1 Code");
            GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueStaging."Shortcut Dimension 1 Code");
        end;

        if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then
            GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueStaging."Shortcut Dimension 2 Code"));

        GenJournalLine.VALIDATE("External Document No.", HISRevenueStaging."Cheque No.");
        GenJournalLine."EDC Narration" := COPYSTR(HISRevenueStaging."Line Narration", 1, 50);
        GenJournalLine."EDC HIS Module" := HISRevenueStaging."HIS Module";
        GenJournalLine."EDC HIS Document Type" := COPYSTR(HISRevenueStaging."HIS Document Type", 1, 60);
        GenJournalLine."EDC UTR No." := HISRevenueStaging."Cheque No.";
        GenJournalLine."EDC Sub Group Code" := HISRevenueStaging."Sub Group";
        GenJournalLine."EDC Receipt No." := COPYSTR(HISRevenueStaging."Receipt No.", 1, 20);
        GenJournalLine."EDC UHID" := HISRevenueStaging.UHID;
        GenJournalLine."EDC Validation Key" := HISRevenueStaging."Validation HIS Key";
        GenJournalLine."EDC Store Code" := HISRevenueStaging."Store Code";
        GenJournalLine."EDC Patient Name" := HISRevenueStaging."Patient Name";
        GenJournalLine."EDC Transaction Type" := HISRevenueStaging.TRANSACTION_TYPE;
        GenJournalLine."EDC Encounter No." := HISRevenueStaging."Encounter No.";
        EntryNo := GenJnlPostLine.RunWithCheck(GenJournalLine);

        HISGLAccountMapping.Reset();
        HISGLAccountMapping.SetRange("Service/Station Head", HISRevenueStaging."HIS Document Type");
        if HISGLAccountMapping.FindFirst() then begin

            GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
            GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
        end ELSE
            Error(DocumentTypeLbl, HISRevenueStaging."HIS Document Type");


        GenJournalLine.VALIDATE(Amount, -HISRevenueStaging.Amount);
        GenJournalLine.validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
        GenJournalLine.VALIDATE("Cheque Date", HISRevenueStaging."Cheque Date");
        GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISRevenueStaging."Cheque No.", 1, 10));
        if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then begin
            GenJournalLine.VALIDATE("Location Code", HISRevenueStaging."Shortcut Dimension 1 Code");
            GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueStaging."Shortcut Dimension 1 Code");
        end;

        if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then
            GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueStaging."Shortcut Dimension 2 Code"));

        GenJournalLine.VALIDATE("External Document No.", HISRevenueStaging."External Document No.");
        GenJournalLine."EDC Narration" := COPYSTR(HISRevenueStaging."Line Narration", 1, 50);
        GenJournalLine."EDC HIS Module" := HISRevenueStaging."HIS Module";
        GenJournalLine."EDC HIS Document Type" := COPYSTR(HISRevenueStaging."HIS Document Type", 1, 60);
        GenJournalLine."EDC UTR No." := HISRevenueStaging."Cheque No.";
        GenJournalLine."EDC Sub Group Code" := HISRevenueStaging."Sub Group";
        GenJournalLine."EDC Receipt No." := COPYSTR(HISRevenueStaging."Receipt No.", 1, 20);
        GenJournalLine."EDC UHID" := HISRevenueStaging.UHID;
        GenJournalLine."EDC Validation Key" := HISRevenueStaging."Validation HIS Key";
        GenJournalLine."EDC Store Code" := HISRevenueStaging."Store Code";
        GenJournalLine."EDC Patient Name" := HISRevenueStaging."Patient Name";
        GenJournalLine."EDC Transaction Type" := HISRevenueStaging.TRANSACTION_TYPE;
        GenJournalLine."EDC Encounter No." := HISRevenueStaging."Encounter No.";
        EntryNo := GenJnlPostLine.RunWithCheck(GenJournalLine);

        if EntryNo <> 0 then begin
            HISRevenueStaging."Created By" := USERID;
            HISRevenueStaging."Created Date Time" := CURRENTDATETIME;
            HISRevenueStaging."General Entries Created" := TRUE;
            HISRevenueStaging.MODIFY();
        end;
        // UNTIL HISRevenueStaging.NEXT() = 0;

    end;

    local procedure GetMappedDimension(HISCCode: Code[20]): Code[20]
    var
        LGeneralLedgerSetup: Record "General Ledger Setup";
        DimensionMapping: Record "EDC HIS GL Accounts Mapping";
    begin
        if HISCCode = '' then
            exit('');

        LGeneralLedgerSetup.Get();

        DimensionMapping.Reset();
        DimensionMapping.SetRange(Type, DimensionMapping.Type::Dimension);
        DimensionMapping.SetRange("Dimension Code", LGeneralLedgerSetup."Global Dimension 2 Code");
        DimensionMapping.SetRange("HIS Code", HISCCode);
        if DimensionMapping.FindFirst() then
            exit(DimensionMapping."Department Code");
    end;

    var
        RevenueEntry: Record "EDC HIS Collection Staging";

}
