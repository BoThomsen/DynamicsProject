codeunit 50132 FraudReport
{
    trigger OnRun()
    begin

        FraudFile.Create('C:\TestFolder\' + 'FraudReport_' + Format(Today) + '.txt');
        FraudFile.Close();
        FraudText := 'C:\TestFolder\' + 'FraudReport_' + Format(Today) + '.txt';  
        IF EXISTS(FraudText) THEN BEGIN  
         FraudFile.WRITEMODE(TRUE);  
         FraudFile.OPEN(FraudText);
         FraudFile.CreateOutStream(FraudOutStream);



        
         Customer.SetRange("No. of Orders", 5, 1000);
        if Customer.FindSet() then begin              
            repeat
            Customer.CalcFields("No. of Orders");

            Index += 1;
            //FraudFile.Write(Customer.Name);
            FraudOutStream.WriteText(Customer.Name + ' Number of Orders ' 
            + Format(Customer."No. of Orders"));
            FraudOutStream.WriteText();
            until (Customer.Next() = 0) OR (Index >= 5);
            end;
            
            
           FraudFile.CLOSE;
            END  
        ELSE  
         MESSAGE('%1 does not exit.', FraudText); 
        
        
    end;
    
    var
        FraudText: Text;
        FraudFile: File;
        Index : Integer;
        Customer: Record Customer;

        FraudOutStream : OutStream;

        
}



