pageextension 50110 WooComExt extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    

    actions
    {
        addfirst(Action76)
        {

            action("WooCommerce")
            {
                ApplicationArea = All;
                RunObject = page "WooComPage";

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