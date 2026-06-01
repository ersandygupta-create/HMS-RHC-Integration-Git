pageextension 50017 "EDC HIS Sales Order" extends "Sales Order"
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
