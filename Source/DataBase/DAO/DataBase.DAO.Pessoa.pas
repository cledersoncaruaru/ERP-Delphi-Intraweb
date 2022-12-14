unit DataBase.DAO.Pessoa;

interface

uses
  System.Classes,
  System.StrUtils,
  DataBase.Entity.Pessoa,
  DataBase.Funcoes,
  Integracao.Telegram;

Procedure Get_Lista_Pessoa(FiltrarPor:Longint; aParams: TStrings; out aResult: String);
function  Set_Pessoa (Pessoa:TPessoa; var vResult:String):Boolean;




implementation

uses
  FireDAC.Comp.Client, System.SysUtils, ServerController, DataBase.BD.Funcoes;



Procedure Get_Lista_Pessoa(FiltrarPor:Longint; aParams: TStrings; out aResult: String);
var
  Qry        : TFDQuery;
  wresult    : string;
  wtotal     : Integer;
begin


 try


   try


    Qry               := TFDQuery.Create(Nil);
    Qry.Connection    := UserSession.Conexao;


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' select * from pessoa ');


    if FiltrarPor < 0 then
       FiltrarPor:= 1;




    case FiltrarPor of

      0 :begin

          if StrToIntDef(aParams.Values['search[value]'],0) > 0 then begin

             Qry.SQL.Add(' where COD_PESSOA ='+aParams.Values['search[value]']);

          end;


         end;
//      0 : Qry.SQL.Add(' where COD_PESSOA ='+aParams.Values['search[value]']);
      1 : Qry.SQL.Add(' where PES_RAZAO like ''%'+StringReplace(UpperCase(aParams.Values['search[value]']), ' ', '%', [rfReplaceAll])+'%'' ');
      2 : Qry.SQL.Add(' where PES_CNPJ_CPF like ''%'+StringReplace(UpperCase(aParams.Values['search[value]']), ' ', '%', [rfReplaceAll])+'%'' ');
      3 : Qry.SQL.Add(' where PES_WHATSAPP like ''%'+StringReplace(UpperCase(aParams.Values['search[value]']), ' ', '%', [rfReplaceAll])+'%'' ');

    end;

    case aParams.Values['order[0][column]'].ToInteger of

      0: Qry.SQL.Add('Order by COD_PESSOA '+aParams.Values['order[0][dir]'] + ' ');
      1: Qry.SQL.Add('Order by PES_RAZAO '+aParams.Values['order[0][dir]'] + ' ');
      2: Qry.SQL.Add('Order by PES_CNPJ_CPF '+aParams.Values['order[0][dir]'] + ' ');
      3: Qry.SQL.Add('Order by PES_WHATSAPP '+aParams.Values['order[0][dir]'] + ' ');

    end;

    Qry.FetchOptions.RecsMax:=StrToInt(aParams.Values['length']);
    Qry.FetchOptions.RecsSkip:=StrToInt(aParams.Values['start']);

    Qry.Open;

    wtotal := ReturnCountSQL(Qry);

    wresult:='{'+
      '"draw": '+StrToIntDef(aParams.Values['draw'],0).ToString + ', ' +
      '"recordsTotal": '+wtotal.ToString + ', ' +
      '"recordsFiltered": '+wtotal.ToString + ', ' +
      '"data": [';

    while not Qry.Eof do
    begin

        wresult := wresult + '['+
                           '"'+StringReplace(Trim(IntToStr(Qry.FieldByName('COD_PESSOA').AsInteger)), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('PES_RAZAO').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('PES_CNPJ_CPF').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('PES_WHATSAPP').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"<button type=\"button\" class=\"btn btn-warning '+'btn-xs'+'\"    onclick=\"ajaxCall(''Crud'', ''Edit='+Qry.FieldByName('COD_PESSOA').AsString+''')\"><i class=\"fas fa-pencil-alt\"></i></button> '+
                           ' <button type=\"button\" class=\"btn btn-danger '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Delete='+Qry.FieldByName('COD_PESSOA').AsString+''')\"><i class=\"fas fa-times\"></i></button> "' +

                           '],';
      Qry.Next;
    end;
    Qry.Close;

    if wtotal <= 0 then
      wresult := wresult + ']}'
    else
      wresult := LeftStr(Trim(wresult),Length(Trim(wresult))-1) + ']}';

    aResult := wresult;



   except on E: Exception do

   // Aqui a Gente vai Disparar uma Mensagem para o Telegram
   // do Log de Erro

     Telegram_Send(' *** Error *** DataBase.Dao.Pessoa - Get_Lista_Pessoa'+sLineBreak+
     e.Message);


   end;



 finally

  Qry.Free;

 end;


end;

function  Set_Pessoa (Pessoa:TPessoa; var vResult:String):Boolean;
var
Qry  : TFDQuery;
begin

  Result := False;


  try

   try

    Qry             := TFDQuery.Create(Nil);
    Qry.Connection  := UserSession.Conexao;


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('Select * from PESSOA where COD_PESSOA =:COD_PESSOA');
    Qry.ParamByName('COD_PESSOA').AsInteger   := Pessoa.COD_PESSOA;
    Qry.Open();


      if Pessoa.COD_PESSOA = 0 then begin

        Qry.Append;

        Set_AjusteGenerator('COD_PESSOA','COD_PESSOA','PESSOA');
        Pessoa.COD_PESSOA                       := Get_ReturnNextCOD('COD_PESSOA');
        vResult := 'Cadastro N? '+Pessoa.COD_PESSOA.ToString+'Realizado com Sucesso';

      end else begin

        Qry.Edit;

        Qry.FieldByName('COD_PESSOA').AsInteger  := Pessoa.COD_PESSOA;

        vResult := 'Cliente/Fornecedor de N?'+Pessoa.COD_PESSOA.ToString+' Realizada Com Sucesso';

      end;


      Qry.FieldByName('COD_PESSOA').AsInteger            := Pessoa.COD_PESSOA;
      Qry.FieldByName('COD_STATUS').AsInteger            := Pessoa.COD_STATUS;
      Qry.FieldByName('PES_RAZAO').AsString              := Pessoa.PES_RAZAO;
      Qry.FieldByName('PES_CEP').AsString                := Pessoa.PES_CEP;
      Qry.FieldByName('PES_LOGRADOURO').AsString         := Pessoa.PES_LOGRADOURO;
      Qry.FieldByName('PES_NUMERO').AsString             := Pessoa.PES_NUMERO;
      Qry.FieldByName('PES_BAIRRO').AsString             := Pessoa.PES_BAIRRO;
      Qry.FieldByName('PES_CIDADE').AsString             := Pessoa.PES_CIDADE;
      Qry.FieldByName('PES_WHATSAPP').AsString           := Pessoa.PES_WHATSAPP;
      Qry.Post;
      Result := True;




   except on E: Exception do


   Telegram_Send('*** ERROR DataBase.Dao.Pessoa Set_Pessoa'+sLineBreak+
                e.Message);

   end;



  finally

  Qry.Free;

  end;



end;



end.
