codeunit 50102 WebCodeUnit
{
    trigger OnRun()
    begin
        testWp();
        
    end;
    
    var
        myInt: Integer;
        



    procedure testWp()


    var
    client: HttpClient;
    content: HttpContent;
    response: HttpResponseMessage;
    data: Text;

    
    begin
        client.DefaultRequestHeaders.Add('User-Agent','Dynamics 365');
        client.DefaultRequestHeaders.Add('Authorization', 'ck_990d1f9863d145f2428dfee7f5a8899857c6e85e');

        if client.Get('URL', response) then begin response.Content.ReadAs(data);


    
    end;
    end;


}