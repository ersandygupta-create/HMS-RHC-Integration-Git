codeunit 50014 "EDC Post Settlement Line"
{
    TableNo = "EDC HIS Settlement Staging";

    trigger OnRun()
    begin
        SettlementEntry.Copy(Rec);
        ProcessLine(SettlementEntry);
        Rec := SettlementEntry;
    end;

    local procedure ProcessLine(var HISSettlementStaging: Record "EDC HIS Settlement Staging")
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "EDC HIS GL Accounts Mapping";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        DocumentTypeLbl: Label 'Setup not found for Document Type %1.';
        EntryNo: Integer;
    begin
        GenJournalLine.INIT();
        GenJournalLine.VALIDATE("Document Type", HISSettlementStaging."Document Type");
        GenJournalLine.VALIDATE("Document No.", HISSettlementStaging."Document No.");
        GenJournalLine.VALIDATE("Posting Date", HISSettlementStaging."Document Date");

        HISGLAccountMapping.Reset();
        HISGLAccountMapping.SetRange(Type, HISGLAccountMapping.Type::Settlement);
        HISGLAccountMapping.SetRange("MOP Code", HISSettlementStaging."HIS Document Type");
        if HISGLAccountMapping.FindFirst() then begin
            if not SettHISDocumentDateValidation(HISSettlementStaging) then begin
                GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
                GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
            end ELSE
                Error(DocumentTypeLbl, HISSettlementStaging."HIS Document Type");

            GenJournalLine.VALIDATE(Amount, HISSettlementStaging.Amount);
            GenJournalLine.validate("Bal. Account Type", HISSettlementStaging."Bal. Account Type");
            GenJournalLine.validate("Bal. Account No.", HISSettlementStaging."Bal. Account No");
            //GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
            GenJournalLine.VALIDATE("Cheque Date", HISSettlementStaging."Cheque Date");
            GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISSettlementStaging."Cheque No.", 1, 10));
            if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then begin
                GenJournalLine.VALIDATE("Location Code", HISSettlementStaging."Shortcut Dimension 1 Code");
                GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISSettlementStaging."Shortcut Dimension 1 Code");
            end;

            if HISSettlementStaging."Shortcut Dimension 2 Code" <> '' then
                GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISSettlementStaging."Shortcut Dimension 2 Code"));

            GenJournalLine.VALIDATE("External Document No.", HISSettlementStaging."External Document No.");
            GenJournalLine."EDC Narration" := COPYSTR(HISSettlementStaging."Line Narration", 1, 50);
            GenJournalLine."EDC HIS Module" := HISSettlementStaging."HIS Module";
            GenJournalLine."EDC HIS Document Type" := COPYSTR(HISSettlementStaging."HIS Document Type", 1, 60);
            GenJournalLine."EDC UTR No." := HISSettlementStaging."Cheque No.";
            GenJournalLine."EDC Sub Group Code" := HISSettlementStaging."Sub Group";
            GenJournalLine."EDC Receipt No." := COPYSTR(HISSettlementStaging."Receipt No.", 1, 20);
            GenJournalLine."EDC UHID" := HISSettlementStaging.UHID;
            GenJournalLine."EDC Validation Key" := HISSettlementStaging."Validation HIS Key";
            GenJournalLine."EDC Store Code" := HISSettlementStaging."Store Code";
            GenJournalLine."EDC Patient Name" := HISSettlementStaging."Patient Name";
            GenJournalLine."EDC Transaction Type" := HISSettlementStaging.TRANSACTION_TYPE;
            GenJournalLine."EDC Sponsor Code" := HISSettlementStaging."Sponsor Code";
            GenJournalLine."EDC Sponsor Name" := HISSettlementStaging."Sponsor Name";
            EntryNo := GenJnlPostLine.RunWithCheck(GenJournalLine);

            // GenJournalLine.VALIDATE(Amount, -HISSettlementStaging.Amount);
            // GenJournalLine.validate("Account Type", HISSettlementStaging."Bal. Account Type");
            // GenJournalLine.validate("Account No.", HISSettlementStaging."Bal. Account No");
            // GenJournalLine.VALIDATE("Cheque Date", HISSettlementStaging."Cheque Date");
            // GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISSettlementStaging."Cheque No.", 1, 10));
            // if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then begin
            //     GenJournalLine.VALIDATE("Location Code", HISSettlementStaging."Shortcut Dimension 1 Code");
            //     GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISSettlementStaging."Shortcut Dimension 1 Code");
            // end;

            // if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then
            //     GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISSettlementStaging."Shortcut Dimension 2 Code"));

            // GenJournalLine.VALIDATE("External Document No.", HISSettlementStaging."External Document No.");
            // GenJournalLine."EDC Narration" := COPYSTR(HISSettlementStaging."Line Narration", 1, 50);
            // GenJournalLine."EDC HIS Module" := HISSettlementStaging."HIS Module";
            // GenJournalLine."EDC HIS Document Type" := COPYSTR(HISSettlementStaging."HIS Document Type", 1, 60);
            // GenJournalLine."EDC UTR No." := HISSettlementStaging."Cheque No.";
            // GenJournalLine."EDC Sub Group Code" := HISSettlementStaging."Sub Group";
            // GenJournalLine."EDC Receipt No." := COPYSTR(HISSettlementStaging."Receipt No.", 1, 20);
            // GenJournalLine."EDC UHID" := HISSettlementStaging.UHID;
            // GenJournalLine."EDC Validation Key" := HISSettlementStaging."Validation HIS Key";
            // GenJournalLine."EDC Store Code" := HISSettlementStaging."Store Code";
            // GenJournalLine."EDC Patient Name" := HISSettlementStaging."Patient Name";
            // GenJournalLine."EDC Transaction Type" := HISSettlementStaging.TRANSACTION_TYPE;
            // GenJournalLine."EDC Sponsor Code" := HISSettlementStaging."Sponsor Code";
            // GenJournalLine."EDC Sponsor Name" := HISSettlementStaging."Sponsor Name";
            // EntryNo := GenJnlPostLine.RunWithCheck(GenJournalLine);

            if EntryNo <> 0 then begin
                HISSettlementStaging."Created By" := USERID;
                HISSettlementStaging."Created Date Time" := CURRENTDATETIME;
                HISSettlementStaging."General Entries Created" := TRUE;
                HISSettlementStaging.MODIFY();
            end;

        end;
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

    procedure SettHISDocumentDateValidation(HISSettlementStaging: Record "EDC HIS Settlement Staging"): Boolean
    var
        AllowPostingDate: Record "HIS Allow Posting Date";
        DocDate: Date;
    begin
        DocDate := HISSettlementStaging."Document Date";

        AllowPostingDate.Reset();
        AllowPostingDate.SetRange("Code Unit Name", '50017');

        AllowPostingDate.SetFilter("From Date", '<=%1', DocDate);
        AllowPostingDate.SetFilter("To Date", '>=%1', DocDate);

        if not AllowPostingDate.FindFirst() then begin
            message('Document Date %1 is not allowed. Allowed date range not defined for %2.', DocDate, '50017 Table Allow Integration Setup From date and To Date');
            EXIT(TRUE);
        end
        else
            EXIT(FALSE);
    end;



    var
        SettlementEntry: Record "EDC HIS Settlement Staging";

}
