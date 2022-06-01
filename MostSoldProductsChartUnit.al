//inspiration from https://simplanova.com/blog/business-chart-control-add-in-in-bc/

codeunit 50117 "MostSoldProductsChartUnit"
{
    trigger OnRun()
    begin
    end;

    var
        MostSoldProChartSetup: Record "Product Chart Setup Table";
    procedure GenerateData(var BusinessChartBuffer: Record "Business Chart Buffer")
    var
        Item: Record Item;
        Index: Integer;
        TodaysDate: Date;
    begin
        MostSoldProChartSetup.SETRANGE("User ID", UserId);
        if not MostSoldProChartSetup.FindFirst() then
            Page.RunModal(Page::"Product Chart Setup Page");

        with BusinessChartBuffer do begin
            Initialize;

            if MostSoldProChartSetup."Most Sold Products" = MostSoldProChartSetup."Most Sold Products"::All then
                AddMeasure('Sold', 1, "Data Type"::Decimal, MostSoldProChartSetup."Chart type");

            SetXAxis('Product', "Data Type"::String);
            
            Item.SetRange(WooComId, 1, 10000);
        
           // Item.SetRange(Item."Date Filter", Today - 7 , Today);
            if Item.FindSet() then begin  
                Item.SetCurrentKey("Qty. on Sales Order");
                Item.SetAscending("Qty. on Sales Order",false);              
                repeat
                Item.CalcFields("Qty. on Sales Order");

                
                AddColumn(Item.Description);
                if MostSoldProChartSetup."Most Sold Products" = MostSoldProChartSetup."Most Sold Products"::All then
                        SetValueByIndex(0, Index, Item."Qty. on Sales Order");
                Index += 1;
                until (Item.Next() = 0) OR (Index >= 5);
            end;

        end;

    end;

        procedure DrillDown(ItemDes: Text)
    var 
        Item : Record Item;
    begin
        Item.SetRange(Description, ItemDes);
        Page.Run(Page::"Item Card", Item);
    end;
}
