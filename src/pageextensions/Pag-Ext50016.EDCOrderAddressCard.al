pageextension 50016 "EDC Order Address Card" extends "Order Address"
{
    layout
    {
        addlast(General)
        {
            field("EDC NPU"; Rec."EDC NPU")
            {
                ToolTip = 'Specifies the value of the NPU field.';
                ApplicationArea = All;
            }
        }
    }
}
