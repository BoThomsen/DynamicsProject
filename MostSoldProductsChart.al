page 50119 "MostSoldProductsChart"
{
    Caption = 'MostSoldProducts';
    PageType = CardPart;
    SourceTable = "Business Chart Buffer";

    layout
    {
        area(Content)
        {
            usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                
                ApplicationArea = Basic, Suite;

                trigger DataPointClicked(point: JsonObject)
                var
                  JsonTokenXValueString: JsonToken;
                  XValueString: Text;
                  begin
                      if point.Get('XValueString',JsonTokenXValueString) then begin
                          XValueString := Format(JsonTokenXValueString);
                          XValueString := DelChr(XValueString, '=' , '"');
                          MostSoldProductsChartUnit.DrillDown(XValueString);
                      end;
                  end;


                trigger AddInReady()
                begin
                    UpdateChart;
                end;

                trigger Refresh()
                begin
                    UpdateChart;;
                end;


            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Chart Setup")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Chart Setup';
                Image = Setup;
                
                trigger OnAction()
                begin;
                    Page.RunModal(Page::"Product Chart Setup Page")
                end;
            }
        }
    }
    
    var
        MostSoldProductsChartUnit: Codeunit "MostSoldProductsChartUnit";

    local procedure UpdateChart()
    begin
        MostSoldProductsChartUnit.GenerateData(Rec);
        Update(CurrPage.BusinessChart);
    end;
}