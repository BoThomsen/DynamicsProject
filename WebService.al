codeunit 50102 WebCodeUnit
{
    var
        client: HttpClient;

        //Husk at ændre til jeres egen key
        CK: Label 'ck_990d1f9863d145f2428dfee7f5a8899857c6e85e';
        CS: Label 'cs_ac2e8b1eb5af0cf1f5f4da91b3fddf2043ec3f57';


    trigger OnRun()
    begin
        client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        client.DefaultRequestHeaders.Add('Authorization', CreateAuth());

    end;


    //using http://dankinsella.blog/http-basic-authentication-with-the-al-httpclient/ 
    local procedure CreateAuth() AuthString: Text
    var
        TypeHelper: Codeunit "Base64 Convert";
    begin
        AuthString := STRSUBSTNO('%1:%2', CK, CS);
        AuthString := TypeHelper.ToBase64(AuthString);
        AuthString := STRSUBSTNO('Basic %1', AuthString);
    end;

    //using https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpcontent/httpcontent-data-type
    procedure MakeRequest(uri: Text; payload: Text; request: HttpRequestMessage)
    var
        contentHeaders: HttpHeaders;
        content: HttpContent;
    begin
        // Add the payload to the content
        content.WriteFrom(payload);

        // Retrieve content
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');

        // Assigning content to request.Content will actually create a copy of the content and assign it.
        // After this line, modifying the content variable or its associated headers will not reflect in 
        // the content associated with the request message
        request.Content := content;

        request.SetRequestUri(uri);
        request.Method := 'POST';
    end;
}