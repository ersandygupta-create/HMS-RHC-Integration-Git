pageextension 50054 "EDC HIS Posted Purch. Invoice" extends "Posted Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Store Name"; Rec."Store Name")
            {
                ApplicationArea = ALL;
                Caption = 'Store Name';
                Editable = false;
                ToolTip = 'Specifies the value of the Store Name field.';
            }
        }
    }

    actions
    {
        addlast("&Invoice")
        {
            action("EDC Export Non Pharmacy Purchase Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Export Non Pharmacy Purchase Invoice';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "EDC HIS Integration Mgmt.";
                begin
                    IF (Rec."EDC HIS Type" <> Rec."EDC HIS Type"::" ") then
                        Error('Export Only Non Pharmacy Posted Purchase Invoice %1', Rec."No.");

                    IF (Rec."EDC HIS Type" = Rec."EDC HIS Type"::" ") then begin
                        HISIntegration.InitHISPurchaseSaleHeader(Rec);
                    END ELSE
                        Error('Export Posted Purchase Invoice is already Created to HIS Staging Table.No need to Export Posted Purchase Invoice %1', Rec."No.");


                end;

            }
        }
    }
}
