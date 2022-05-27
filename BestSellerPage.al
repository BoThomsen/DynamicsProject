page 50112 BestSellerPage
{
    PageType = Card;
    Extensible = false;
    Editable = false;

    
    layout
    {
        area(Content)
        {
            group(BestSeller)
            {
            
                Caption = 'Best Sellers in Electronics';
                usercontrol(AmazonBestSeller; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        CurrPage.AmazonBestSeller.Navigate('https://www.amazon.com/Best-Sellers-Electronics/zgbs/electronics/ref=zg_bs_nav_0&output=embed');
                    end;

                }
          }
        }
    }
    
    var
        myInt: Integer;
}