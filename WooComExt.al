pageextension 50110 WooComExt extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Action76)
        {

            action("WooCommerce")
            {
                ApplicationArea = All;
                RunObject = page "Student Chart Setup Page";

            }

            action("AmazonBestSeller")
            {
                ApplicationArea = All;
                RunObject = page "BestSellerPage";
            }


        }

    }

    var
        myInt: Integer;
}