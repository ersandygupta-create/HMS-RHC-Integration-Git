pageextension 50010 "EDC TDS Entries" extends "TDS Entries"
{
    layout
    {
        addafter("Vendor No.")
        {
            field("EDC Vendor Name"; Rec."EDC Vendor Name")
            {
                ApplicationArea = all;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the Vendor Name field.';
            }

        }
    }
}
