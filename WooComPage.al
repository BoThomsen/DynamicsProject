page 50111 WooComPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; CompanyName)
                {
                    ApplicationArea = All;
                    
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