page 50111 "WooComPage"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            
            group(Chart)
            {
            part(MostSoldPro; MostSoldProductsChart)
            {
                ApplicationArea = all;
            }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}
