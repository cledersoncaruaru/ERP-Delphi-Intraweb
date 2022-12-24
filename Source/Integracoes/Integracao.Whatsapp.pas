unit Integracao.Whatsapp;

interface
  uses

  IdHTTP,
  IdSSLOpenSSL,
  IdGlobal,
  System.JSON,
  System.Classes,
  System.netEncoding,
  RESTRequest4D,
  System.SysUtils;

  var

    LResponse   : IResponse;
    Body        : String; 

  function FileToBase64(Arquivo : String): String;
  function StreamToBase64(STream : TMemoryStream) : String;

  function SomenteNumero(Texto : String): String;

  
  
  function Base64Invalids(const ABase64Str: string): string;


  function Enviar_PDF_WhatsApp(number:String; mensagem:String; Arquivo:string; var aResponse:String) :Boolean;
  function Enviar_Whatsapp(number:String; mensagem:String; var aResponse:String):Boolean;


  Function GenereteToken:String;
  function Get_StatusWhatsApp:String;
  Function RemoverMascara(Texto: string): string;


  const
    BaseUrl_Api_Whats   = 'http://127.0.0.1:21465/api';
    secretKey           = 'THISISMYSECURETOKEN';
    session             = 'DELPHIEINTRAWEB_xx';




implementation

uses ServerController,System.StrUtils;


Function GenereteToken:String;
var
 Obj:TJSONObject;
 Jv: TJSONValue;
begin

 UserSession.Token := '';


 try

    try

    Obj:=TJSONObject.Create;


    LResponse := TRequest.New.BaseURL(BaseUrl_Api_Whats+'/'+session+'/'+secretKey+'/generate-token')
    .ContentType('application/json')
    .Accept('application/json')
    .Post;


    Obj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( LResponse.Content), 0) as TJSONObject;


    Jv := Obj.Get('token').JsonValue;

    Result                 := StringReplace(Jv.ToString,'"','',[rfReplaceAll, rfIgnoreCase]);
    UserSession.Token      := Result;




   finally

   Obj.Free;


   end;



   
 except on E: Exception do

//     Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                              ' Data Hora- '+ DateTimeToStr(now) +
//                                              ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                              ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                              ' - Erro Token WhatsApp :   '+ e.Message);



 end;



end;



Function RemoverMascara(Texto: string): string;
begin
  Result := Texto;

  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll]);
  Result := StringReplace(Result, '\', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, '(', '', [rfReplaceAll]);
  Result := StringReplace(Result, ')', '', [rfReplaceAll]);
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  Result := StringReplace(Result, ';', '', [rfReplaceAll]);
  Result := StringReplace(Result, ':', '', [rfReplaceAll]);
  Result := StringReplace(Result, '%', '', [rfReplaceAll]);

end;



function Base64Invalids(const ABase64Str: string): string;
begin

  Result := ABase64Str;
  Result := StringReplace(Result, #13#10, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);

   { Retirando as quebras de linha em campos blob }
  Result := StringReplace(Result, #$D#$A, '', [rfReplaceAll]);


end;




function StreamToBase64(STream: TMemoryStream): String;
Var Base64 : tBase64Encoding;
begin
  Try
    Stream.Position := 0; {ANDROID 64 e 32 Bits}
//    Stream.Seek(0, 0); {ANDROID 32 Bits}
    Base64 := TBase64Encoding.Create;
    Result := Base64.EncodeBytesToString(sTream.Memory, sTream.Size);
  Finally
    Base64.Free;
    Base64:=nil;
  End;
end;
function FileToBase64(Arquivo : String): String;
Var sTream : tMemoryStream;
begin
  if (Trim(Arquivo) <> '') then
  begin
     sTream := TMemoryStream.Create;
     Try
       sTream.LoadFromFile(Arquivo);
       result := StreamToBase64(sTream);
     Finally
       Stream.Free;
       Stream:=nil;
     End;
  end else
     result := '';
end;
function SomenteNumero(Texto : String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(Texto) do
       if Texto [I] In ['0'..'9'] Then
            Result := Result + Texto [I];
end;



function Enviar_Whatsapp(number:String; mensagem:String; var aResponse:String):Boolean;
var
 Obj:TJSONObject;
 Jv: TJSONValue;
begin
      Result   := False;

 try


    try


      if UserSession.Token = '' then
          GenereteToken;




      Body   :=

      '     {                                    '+
      '      "phone": "'+Trim('55'+SomenteNumero(number))+'",        '+
      '      "message": "'+Trim(Base64Invalids(mensagem) )+'",    '+
      '      "isGroup": false                    '+
      '    }                                     ';


      LResponse := TRequest.New.BaseURL(BaseUrl_Api_Whats+'/'+session+'/send-message')
      .ContentType('application/json')
      .Accept('application/json')
      .addbody(Body)
      .TokenBearer(UserSession.Token)
      .Post;

      Obj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( LResponse.Content), 0) as TJSONObject;


      if LResponse.StatusCode in [200,201] then begin

        aResponse    := LResponse.Content;
        Result       := True;
      end else begin

        aResponse    := LResponse.Content;

//        Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                    ' Data Hora- '+ DateTimeToStr(now) +
//                                    ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                    ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                    ' - Erro do WhatsApp :   '+ aResponse);


        

      end;


    finally

     Obj.Free;

    end;


   
 except on E: Exception do

//          Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                              ' Data Hora- '+ DateTimeToStr(now) +
//                                              ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                              ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                              ' - Erro ao Enviar Mensagem do WhatsApp :   '+ e.Message);
 
 end;


  
end;

function Get_StatusWhatsApp:String;
var
 Obj:TJSONObject;
 Jv: TJSONValue;
begin


  try

    if UserSession.Token = '' then begin 
    
     GenereteToken;
    
    end;


    try

      Result   := '';

      LResponse := TRequest.New.BaseURL(BaseUrl_Api_Whats+'/'+session+'/status-session')
      .ContentType('application/json')
      .Accept('application/json')
      .TokenBearer(UserSession.Token)
      .Get;


        Obj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( LResponse.Content), 0) as TJSONObject;


      if LResponse.StatusCode = 200 then  begin


        Jv := Obj.Get('status').JsonValue;


        Result                   := StringReplace(Jv.ToString,'"','',[rfReplaceAll, rfIgnoreCase]);
//        UserSession.StatusZap    := Result;


      end else begin

               Result       := LResponse.Content;
      end;







    finally

     Obj.Free;

    end;

  

    
  except on E: Exception do

//         Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                              ' Data Hora- '+ DateTimeToStr(now) +
//                                              ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                              ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                              ' - Erro Status WhatsApp :   '+ e.Message);


  end;

end;

function Enviar_PDF_WhatsApp(number:String; mensagem:String; Arquivo:string; var aResponse:String) :Boolean;
var
  Extensao        : String;
  Body :String;
  Obj:TJSONObject;
  Jv: TJSONValue;
  b64:String;
begin

 Result := False;

   try

     if not FileExists(Arquivo) then begin
      aResponse :='Arquivo inexistente.';
      Exit;
     end;

     Extensao        := '';
     Extensao        := RemoverMascara( ExtractFileExt(Arquivo) );
     b64             := Base64Invalids( FileToBase64(Arquivo) );

     
     
        try

         Result   := False;

         Body   :=

        '      {                                                                    '+
        '          "phone": "'+Trim('55'+SomenteNumero(number)) +'",                '+
        '          "filename": "'+ExtractFileName(Arquivo)+'",                      '+
        '          "base64": "data:application/'+Extensao+';base64,'+Trim(b64)+'",  '+
        '          "isGroup": false                                                 '+
        '      }                                                                    ';


          LResponse := TRequest.New.BaseURL(BaseUrl_Api_Whats+'/'+session+'/send-file-base64')
         .ContentType('application/json')
          .Accept('application/json')
          .addbody(Body)
          .TokenBearer(UserSession.Token)
          .Post;

          Obj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( LResponse.Content), 0) as TJSONObject;


          if ( LResponse.StatusCode = 200 ) or ( LResponse.StatusCode = 201 ) then begin

            aResponse    := LResponse.Content;
            Result       := True;
          end else begin

            aResponse    := LResponse.Content;

//
//               Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                    ' Data Hora- '+ DateTimeToStr(now) +
//                                    ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                    ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                    ' - Erro do WhatsApp :   '+ aResponse);

            
          end;





        finally

         Obj.Free;

        end;


       
   except on E: Exception do
//
//           Telegram_Send(UserSession.CNPJLogado+'AutoParts'+
//                                            ' Data Hora- '+ DateTimeToStr(now) +
//                                            ' Emitente:  '+ Get_Field_String_Param_Int('EMP_RAZAO','EMPRESA','COD_EMPRESA',UserSession.ID_EmpLogada)+
//                                            ' - CNPJ:    '+ UserSession.CNPJLogado+
//                                            ' - Erro ao Enviar Arquivo Base64 WhatsApp :   '+ e.Message);

     
   end;


end;


end.
