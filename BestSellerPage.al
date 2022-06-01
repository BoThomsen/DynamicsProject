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
                        CurrPage.AmazonBestSeller.Navigate('https://tv2.dk/');
                    end;

                }
          }
        }
    }
    
    var
        myInt: Integer;
}