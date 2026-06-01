codeunit 50010 "EDC Post Consumption Line"
{
    TableNo = "EDC HIS Consumption Entries";

    trigger OnRun()
    begin
        ConsumptionEntry.Copy(Rec);
        ProcessLine(ConsumptionEntry);
        Rec := ConsumptionEntry;
    end;

    local procedure ProcessLine(var HISConsumptionEntry: Record "EDC HIS Consumption Entries")
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "EDC HIS Item Mapping";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        DocumentTypeLbl: Label 'Setup not found for Entry No. %1.';
        EntryNo: Integer;
    begin
        GenJournalLine.INIT();
        GenJournalLine.VALIDATE("Document Type", HISConsumptionEntry."Document Type");
        GenJournalLine.VALIDATE("Document No.", HISConsumptionEntry."Document No.");
        GenJournalLine.VALIDATE("Posting Date", HISConsumptionEntry."Posting Date");

        HISGLAccountMapping.Reset();
        HISGLAccountMapping.SetRange("Entry Type", HISGLAccountMapping."Entry Type"::Consumption);
        HISGLAccountMapping.SetRange("Item Category Code", HISConsumptionEntry."Item Category Code");
        if HISGLAccountMapping.FindFirst() then begin
            if not ConsHISDocumentDateValidation(HISConsumptionEntry) then begin
                GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::"G/L Account");
                GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."G/L Account No.");
            end ELSE
                Error(DocumentTypeLbl, HISConsumptionEntry."Entry No.");

            GenJournalLine.VALIDATE(Amount, HISConsumptionEntry.Amount);
            GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");

            HISGLAccountMapping.Reset();
            HISGLAccountMapping.SetRange("Entry Type", HISGLAccountMapping."Entry Type"::"Purchase Order");
            HISGLAccountMapping.SetRange("Item Category Code", HISConsumptionEntry."Item Category Code");
            if HISGLAccountMapping.FindFirst() then
                GenJournalLine.VALIDATE("Bal. Account No.", HISGLAccountMapping."G/L Account No.")
            ELSE
                Error(DocumentTypeLbl, HISConsumptionEntry."HIS Document Type");

            if HISConsumptionEntry."Shortcut Dimension 1 Code" <> '' then begin
                GenJournalLine.VALIDATE("Location Code", HISConsumptionEntry."Shortcut Dimension 1 Code");
                GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISConsumptionEntry."Shortcut Dimension 1 Code");
            end;

            if HISConsumptionEntry."Shortcut Dimension 1 Code" <> '' then
                GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISConsumptionEntry."Shortcut Dimension 2 Code"));

            GenJournalLine.VALIDATE("External Document No.", HISConsumptionEntry."External Document No.");
            GenJournalLine."EDC Narration" := COPYSTR(HISConsumptionEntry."Line Narration", 1, 50);
            GenJournalLine."EDC HIS Module" := HISConsumptionEntry."HIS Module";
            GenJournalLine."EDC HIS Document Type" := COPYSTR(HISConsumptionEntry."HIS Document Type", 1, 60);
            GenJournalLine."EDC Sub Group Code" := HISConsumptionEntry."Sub Group";
            GenJournalLine."EDC Receipt No." := COPYSTR(HISConsumptionEntry."Receipt No.", 1, 20);
            GenJournalLine."EDC UHID" := HISConsumptionEntry.UHID;
            GenJournalLine."EDC Validation Key" := HISConsumptionEntry."Validation HIS Key";
            GenJournalLine."EDC Store Code" := HISConsumptionEntry."Store Code";
            GenJournalLine."EDC Patient Name" := HISConsumptionEntry."Patient Name";
            GenJournalLine."EDC Transaction Type" := HISConsumptionEntry.TRANSACTION_TYPE;
            GenJournalLine."EDC Speciality" := HISConsumptionEntry.Speciality;
            GenJournalLine."EDC Encounter No." := HISConsumptionEntry."Encounter No.";
            EntryNo := GenJnlPostLine.RunWithCheck(GenJournalLine);

            if EntryNo <> 0 then begin
                HISConsumptionEntry."Created By" := USERID;
                HISConsumptionEntry."Created Date Time" := CURRENTDATETIME;
                HISConsumptionEntry."General Entries Created" := TRUE;
                HISConsumptionEntry.MODIFY();
            end;
            // UNTIL HISConsumptionEntry.NEXT() = 0;

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

    procedure ConsHISDocumentDateValidation(HISConsumptionEntry1: Record "EDC HIS Consumption Entries"): Boolean
    var
        AllowPostingDate: Record "HIS Allow Posting Date";
        DocDate: Date;

    begin
        DocDate := HISConsumptionEntry1."Posting Date";

        AllowPostingDate.Reset();
        AllowPostingDate.SetRange("Code Unit Name", '50009');

        AllowPostingDate.SetFilter("From Date", '<=%1', DocDate);
        AllowPostingDate.SetFilter("To Date", '>=%1', DocDate);

        if not AllowPostingDate.FindFirst() then begin
            message('Document Date %1 is not allowed. Allowed date range not defined for %2.', DocDate, '50009 Table Allow Integration Setup From date and To Date');
            EXIT(TRUE);
        end
        else
            EXIT(FALSE);
    end;


    var
        ConsumptionEntry: Record "EDC HIS Consumption Entries";

}
