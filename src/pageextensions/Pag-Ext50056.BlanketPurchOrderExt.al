pageextension 50056 "EDC Blanket Purchase Order" extends "Blanket Purchase Order"
{
    layout

    {
        addlast(General)
        {
            field("EDC Delivery Terms"; Rec."EDC Delivery Terms")
            {
                ApplicationArea = All;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the Delivery Terms field.';
            }

        }
    }


}
