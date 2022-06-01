tableextension 50103 ItemExt extends Item
{
    fields
    {
        field(150; WooComId; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(151; OnlineOrPhysical; Option)
        {

            DataClassification = ToBeClassified;
            OptionMembers = Online,Physical,Both;
        }
    }

    trigger OnAfterInsert()
    var
        ResJson: JsonObject;
        JsonTokenWooComId: JsonToken;
    begin
        WebService.Run();

        ResJson := WebService.NewItem(Rec);

        ResJson.Get('id', JsonTokenWooComId);
        Rec.WooComId := JsonTokenWooComId.AsValue().AsInteger();


    end;

    trigger OnBeforeModify()
    var
        ResJson: JsonObject;
    begin
        If format(xRec) <> format(rec) then begin
            WebService.Run();
            ResJson := WebService.ModifyItem(Rec);
        end;

    end;

    var
        WebService: Codeunit WebService;
        FraudReport: Codeunit FraudReport;
}