pageextension 50001 "EDC HIS Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("EDC HIS Code"; Rec."EDC HIS Code")
            {
                ApplicationArea = All;
                Editable = false;
                Style = StrongAccent;
                StyleExpr = true;
            }
        }
    }

    actions
    {
        addafter("Sent Emails")
        {
            action("Customer Ledger Report")
            {
                ApplicationArea = All;
                Caption = 'Customer Ledger Report';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Report;
                trigger OnAction()
                begin
                    recCustomer.Reset();
                    recCustomer.SetRange("No.", Rec."No.");
                    REPORT.RUNMODAL(Report::"Customer Ledger Report", TRUE, TRUE, recCustomer);

                end;
            }
        }


    }
    var
        recCustomer: Record Customer;

}