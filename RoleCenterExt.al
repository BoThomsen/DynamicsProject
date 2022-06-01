pageextension 50110 RoleCenterExt extends "Order Processor Role Center"
{

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

}