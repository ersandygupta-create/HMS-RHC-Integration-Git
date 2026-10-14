pageextension 50074 "E3 Purchase Cr. Memo Sub" extends 98
{
    layout
    {
        addafter("GST Group Code")
        {
            field("GST Reverse Charge"; Rec."GST Reverse Charge")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Reverse Charge field';
                editable = true;
            }
        }
    }


}