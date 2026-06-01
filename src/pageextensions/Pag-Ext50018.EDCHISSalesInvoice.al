pageextension 50018 "EDC HIS Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("EDC RCM"; Rec."EDC RCM")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the RCM field.';
            }

        }
    }
}
