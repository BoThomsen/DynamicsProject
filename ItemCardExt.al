pageextension 50104 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field(WooComId; Rec.WooComId)
            {
                Caption = 'WooCommerce Id';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

}