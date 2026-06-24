codeunit 50028 ClearVATAmountLine
{
    trigger OnRun()
    var
        VATAmountLine: Record "VAT Amount Line";
    begin
        VATAmountLine.Reset();
        VATAmountLine.DeleteAll();
        Message('VAT Amount Line records deleted.');
    end;
}