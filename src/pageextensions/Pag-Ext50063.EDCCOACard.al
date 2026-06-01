pageextension 50063 "Chart of Accounts Card" extends "G/L Account Card"
{
    layout
    {
        addafter(Totaling)
        {
            field(FIReportMapping; Rec.FIReportMapping)
            {
                ApplicationArea = All;
                Caption = 'KPIs Mapping';
                ToolTip = 'Specifies the value of the KPIs Mapping field.';
            }
            field("KPIs Name"; Rec."KPIs Name")
            {
                ApplicationArea = All;
                Caption = 'KPIs Mapping Name';
                ToolTip = 'Specifies the value of the KPIs Mapping Name field.';
            }
            }
        }
    }
    